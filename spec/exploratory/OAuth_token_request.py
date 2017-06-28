import requests
import requests.auth

client_id = "_6Ql0Wm5PO_ABA"
app_secret = "asRLazsZt8mK1Q4tjqUevZxGSkU"

client_auth = requests.auth.HTTPBasicAuth(client_id, app_secret)
post_data = {"grant_type": "client_credentials"}
headers = {"User-Agent": "Goal_Highlights"}
response = requests.post("https://www.reddit.com/api/v1/access_token", auth=client_auth, data=post_data, headers=headers)
response.json()
print response
# <Response [200]>
