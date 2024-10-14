import base64
import datetime
import hashlib
import time


def generate_secure_link(secret, url, expire):
    link = f"{secret}{url}{expire}"

    hash = hashlib.md5(str(link).encode('utf-8')).digest()
    base64_hash = base64.urlsafe_b64encode(hash)
    str_hash = base64_hash.decode('utf-8').rstrip('=')

    return f"{url}?md5={str_hash}&expires={expire}"

# Example usage
secret = "123459876"
url = "/file/test.mp3"
# expire = 3600  # 1 hour
date_time = datetime.datetime.now() + datetime.timedelta(seconds=10)
new_expire = int(time.mktime(date_time.timetuple()))
secure_link = generate_secure_link(secret, url, new_expire)
print(secure_link)
