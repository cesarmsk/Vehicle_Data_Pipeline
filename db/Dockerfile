# Use an official PostgreSQL image as the base image
FROM postgres:14

# Set environment variables for PostgreSQL
ENV POSTGRES_DB=d2d
ENV POSTGRES_USER=user_admin
ENV POSTGRES_PASSWORD=admin:abc

# Copy the init.sql script to the Docker container
COPY init.sql /docker-entrypoint-initdb.d/

# Expose the PostgreSQL port (5432) to the host
EXPOSE 5432

# Start the PostgreSQL server
CMD ["postgres"]
