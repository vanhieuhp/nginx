import aiohttp
import asyncio


async def send_request(session, api_url, headers=None, params=None):
    try:
        # Send the request asynchronously and immediately close the session
        async with session.get(api_url, headers=headers, params=params) as response:
            print(f"Request sent to {api_url} with status {response.status}. Closing connection.")
            # We are not waiting for or processing the response content.
    except Exception as e:
        print(f"Error occurred: {e}")


async def call_api_async(api_url, headers=None, params=None, call_count=100):
    """
    Sends asynchronous API requests without waiting for responses.

    Args:
    - api_url (str): The API endpoint URL.
    - headers (dict): Optional headers for the request.
    - params (dict): Optional query parameters.
    - call_count (int): Number of times to call the API.
    """
    async with aiohttp.ClientSession() as session:
        tasks = []
        for i in range(call_count):
            task = asyncio.create_task(send_request(session, api_url, headers=headers, params=params))
            tasks.append(task)

        # Execute all tasks concurrently without waiting for the responses.
        await asyncio.gather(*tasks)


# Example usage
if __name__ == "__main__":
    # Replace with your API endpoint
    api_url = "http://django.com/admin"

    # Optional headers (e.g., API keys)
    headers = {
        "Authorization": "Bearer YOUR_API_KEY"
    }

    # Optional query parameters
    params = {
        "query": "example",
        "limit": 10
    }

    # Call the async function to send 100 requests
    asyncio.run(call_api_async(api_url, headers=headers, params=params, call_count=10000))
