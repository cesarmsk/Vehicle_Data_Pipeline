import json
import boto3
import psycopg2
import os

# environment variables
HOST_NAME = os.environ['HOST_NAME']
PORT = os.environ['PORT']
DB_NAME = os.environ['DB_NAME']
USER_NAME = os.environ['USER_NAME']
PWD = os.environ['PASSWORD']

# Initialize AWS S3 and RDS clients
s3_client = boto3.client('s3')

def lambda_handler(event, context):
    # Source: "data" folder of the "s3://de-tech-assessment-2022" bucket
    s3_bucket = 'de-tech-assessment-2022'
    s3_folder = 'data'

    try:
        # Establish a connection to the PostgreSQL database
        conn = psycopg2.connect(
            host=HOST_NAME,  
            database=DB_NAME,
            port = PORT,
            user=USER_NAME,
            password=PWD
        )

        cursor = conn.cursor()

        # List objects in the specified S3 folder
        objects = s3_client.list_objects_v2(Bucket=s3_bucket, Prefix=s3_folder)

        for obj in objects.get('Contents', []):
            # Get the object key (file path)
            file_key = obj['Key']

            # Download JSON data from S3
            response = s3_client.get_object(Bucket=s3_bucket, Key=file_key)
            json_data = response['Body'].read().decode('utf-8')
            data = json.loads(json_data)

            # Extract relevant information from JSON data
            event_type = data.get("event")
            entity_on_id = data.get("on")
            event_at_timestamp = data.get("at")
            vehicle_id = data.get("data", {}).get("id")
            if entity_on_id == "operating_period":
                # If it's an operating_period event, insert data into the operating_periods table
                start=data.get("data", {}).get("finish")
                finish=data.get("data", {}).get("finish")
                cursor.execute(
                    "INSERT INTO operating_periods (vehicle_id, start_timestamp, finish_timestamp) VALUES (%s, %s, %s);",
                    (vehicle_id, start, finish)
                )
            else:
                # If not, insert data into the vehicle_events table
                lat = data.get("data", {}).get("location", {}).get("lat")
                lng = data.get("data", {}).get("location", {}).get("lng")
                location_at_timestamp = data.get("data", {}).get("location", {}).get("at")
                organization_id = data.get("organization_id")
                cursor.execute(
                    "INSERT INTO vehicle_events (event_type, entity_on_id, event_at_timestamp, vehicle_id, lat, lng, location_at_timestamp, organization_id) VALUES (%s, %s, %s, %s, %s, %s, %s, %s);",
                    (event_type, entity_on_id, event_at_timestamp, vehicle_id, lat, lng, location_at_timestamp, organization_id)
                )

        conn.commit()
        cursor.close()
        conn.close()

        return {
            'statusCode': 200,
            'body': json.dumps('Data ingested successfully!')
        }

    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps('Error: ' + str(e))
        }
