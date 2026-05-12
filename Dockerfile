FROM eclipse-temurin:17-jdk

# Create the user
RUN useradd -m appuser

WORKDIR /app

# Copy the jar
COPY target/gameapp-1.0.0.jar app.jar

# 1. Create the data directory explicitly
# 2. Change ownership of the entire /app folder to appuser
RUN mkdir -p /app/data && chown -R appuser:appuser /app

# Switch to non-root user
USER appuser

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]