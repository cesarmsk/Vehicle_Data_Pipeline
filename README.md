# Vehicle_Data_Pipeline
The purpose of this challenge is to automate the build of a simple yet scalable data lake and data warehouse that will enable our BI team

# Project structure: 
The project consists of this modules/folders: <br>
- db: Sql script to create DW tables <br>
- lambda: lambda function code <br>
- scripts: terraform deployment script (e.g. run cmd bash terraform_aws_deploy.sh) <br>
- terraform: terraform project for AWS infrastructure <br>
  
# Data Engineering:

Data Formats: In the challenge, the data is stored in a public S3 bucket and is described as JSON strings. 
Ingestion Techniques: Data ingestion involves the process of importing data from external sources into a data storage system. In this case, the data is ingested from an S3 bucket. AWS provides tools like AWS Lambda and AWS Glue that can be used for data ingestion. Lambda functions can also be scheduled to fetch data from the S3 bucket periodically. For this project a lambda function was chose and implemented.
Data Modeling: Data modeling is essential for designing the database schema that reflects the relationships between different entities in the data. In the challenge, a data lake and data warehouse are mentioned, which suggests the need for a well-defined data model. In the provided code example, for simplicity I only created the fact tables since there were no sufficient data to implement the dimension tables. Star and snowflake data models are a common approach in data warehousing to structure data for analytical purposes. 

# Technology:
Libraries and Approaches: The code provided in the challenge uses several technologies and libraries:
Python: Python is used for writing the Lambda function. It's a popular choice for data engineering and data processing tasks due to its extensive libraries and ecosystem for working with data.
Boto3: Boto3 is the AWS SDK for Python. It's used for interacting with AWS services, including S3, Lambda, and more. In this context, it's used for fetching data from the S3 bucket.
Psycopg2: Psycopg2 is a PostgreSQL adapter for Python. It's used for connecting to and interacting with the PostgreSQL database. It's a common choice for Python applications that need to work with PostgreSQL.
SQL: Structured Query Language is used for creating and querying the database tables. SQL is the standard language for managing and querying relational databases.
Justification: The technologies used in the provided code make sense for the task for several reasons:

Python: Python is a versatile and widely adopted language in the data engineering and data science communities. It provides libraries for working with both AWS services (via Boto3) and databases (via Psycopg2).
Boto3: Boto3 is the official AWS SDK for Python, making it a natural choice for AWS-related tasks. It provides a well-documented and reliable way to interact with AWS services programmatically.
Psycopg2: For PostgreSQL, Psycopg2 is a mature and widely used library. It allows for efficient interaction with the PostgreSQL database, including data insertion and querying.
SQL: SQL is the standard language for working with relational databases, including PostgreSQL. Using SQL for creating tables and querying data is the appropriate choice for managing structured data.
Overall Approach Justification: The overall approach of using AWS Lambda along with cloudwatch events to periodically fetch data from S3, process it using Python, and then insert it into a PostgreSQL database is a common and reasonable approach for building data pipelines and ETL (Extract, Transform, Load) processes. It allows for scalability, automation, and integration with other AWS services. Additionally, the use of a PostgreSQL database is appropriate for structured data storage and querying, especially when relational modeling is required.

In summary, the technology choices and approaches used in the provided code are well-aligned with common data engineering practices and are suitable for the given challenge's requirements. They leverage the strengths of Python, AWS services, and SQL for effective data management and processing.

# Project Documentation: Data Ingestion and Processing Pipeline
The following Contents were not implemented in this project and are just a guideline proposal based on best practices… 

Table of Contents <br>
1.	Introduction <br>
-Overview <br>
-Purpose <br>
-Scope <br>
2.	Architecture <br>
-High-Level Architecture <br>
-Components and Services <br>
-Data Flow Diagram <br>
3.	Setup and Configuration <br>
-Prerequisites <br>
-AWS Account Setup <br>
-Environment Configuration <br>
-AWS CLI Configuration <br>
-Database Setup <br>
4.	Codebase <br>
-Lambda Function Code <br>
-SQL Scripts <br>
-Docker Configuration <br>
5.	Data Model <br>
-Database Schema <br>
-Dimension Tables <br>
-Fact Tables <br>
-Relationships <br>
6.	Data Ingestion <br>
-S3 Bucket Configuration <br>
-Lambda Function for Ingestion <br>
-Data Transformation <br>
-Error Handling <br>
7.	Database <br>
-PostgreSQL Database Configuration <br>
-Database Initialization Scripts <br>
8.	Deployment <br>
-Deploying Lambda Function <br>
-Running Docker Containers <br>
-Terraform Configuration <br>

9.	Testing <br>
-Unit Tests <br>
-Integration Tests <br>
-Testing Strategy <br>

10.	Monitoring and Logging <br>
-CloudWatch Logs <br>
-Custom Metrics (if applicable) <br>
-Error Handling and Logging Best Practices <br>

11.	Scaling and Performance <br>
-Horizontal Scaling <br>
-Database Performance Optimization <br>

12.	Security <br>
-AWS IAM Roles and Policies <br>
-Data Encryption <br>
-Least Privilege Principle <br>

13.	Maintenance and Support <br>
-Backup and Restore Procedures <br>
-Data Retention Policies <br>
-Regular Maintenance Tasks <br>

14.	Troubleshooting <br>
-Common Issues <br>
-Debugging Techniques <br>
-FAQ <br>
15.	CI/CD Pipeline (if applicable) <br>
-Continuous Integration Setup <br>
-Deployment Automation <br>
-Deployment Strategies <br>
16.	Documentation Updates <br>
-Version History <br>
-Change Log <br>
17.	Contributing <br>
-Contribution Guidelines <br>
-Code Review Process <br>
-Issue Tracking <br>
18.	Conclusion <br>
-Recap of Project Goals <br>
-Future Enhancements <br>

# Documenting Best Practices: 
Consistency: Ensure consistency in formatting, style, and naming conventions throughout the documentation.
Clarity: Write clear and concise explanations, avoiding jargon or unnecessary technical terms. Use diagrams and examples to illustrate complex concepts.
Comments: Include comments in code snippets and configurations to explain key decisions and functionalities.
Links and References: Provide links to relevant AWS documentation, libraries, and external resources where necessary.
Versioning: Maintain version history for both the codebase and documentation to track changes over time.
Collaboration: Encourage collaboration by making the documentation accessible to the team, and consider using collaborative documentation tools.
Accessibility: Ensure that the documentation is accessible to all team members, including those with disabilities.
Regular Updates: Keep the documentation up to date as the project evolves.


