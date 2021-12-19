FROM python:3.7.4-slim-stretch
WORKDIR /app
COPY src/ /app

# build time arguments to pass to the container as environment variables.
ARG STARTING_NUM_SEQ
ARG ENDING_NUM_SEQ

# Environment variables to be passed
ENV STARTING_NUM_SEQ=$STARTING_NUM_SEQ
ENV ENDING_NUM_SEQ=$ENDING_NUM_SEQ

CMD ["python3", "/app/main.py"]