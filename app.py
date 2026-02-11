from flask import Flask
import time
import os

app = Flask(__name__)

def get_delay(default=10):
    try:
        return float(os.getenv("DELAY", default))
    except (TypeError, ValueError):
        return default

@app.route("/")
def home():
    delay = get_delay(0)
    time.sleep(delay)
    return "Hello SRE"

@app.route("/health")
def health():
    return {"status": "ok"}, 200

@app.route("/slow")
def slow():
    delay = get_delay(10)
    time.sleep(delay)
    return f"Response delayed by {delay} seconds"

# Remove the dev server block when using Gunicorn
# if __name__ == "__main__":
#     app.run(host="0.0.0.0", port=5000)
