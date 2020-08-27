import json
import boto3
from datetime import datetime

def lambda_handler(event, context):

    # EventBridge client
    eventbridge_client = boto3.client('events')

    # Example event from your application
    my_application_event_example = {
        'service': 'myapp service',
        'status': 'restored'
    }

    # Structure of EventBridge Event
    eventbridge_event = {
        'Time': datetime.utcnow(),
        'Source': 'transmitter_lambda',
        'Detail': json.dumps(my_application_event_example),
        'DetailType': 'service_status'
    }

    # Send event to EventBridge
    response = eventbridge_client.put_events(
        Entries=[
            eventbridge_event
        ]
    )

    return json.dumps({"message":"This is a test message"})
