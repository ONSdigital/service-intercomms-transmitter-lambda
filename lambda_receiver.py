import json

def handler(event, context):
    print("Logging JSON to cloudwatch")
    try:
        json = event['Records'][0]['body']
    except:
        # This will be hit if the receiver is tested in the console
        json = event
    
    print(json)
    
    return json