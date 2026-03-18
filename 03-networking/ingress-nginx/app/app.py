from flask import Flask

# Create Flask app instance
app = Flask(__name__)

# Route: Home page
@app.route('/')
def home():
    return "Hello, Flask! 🚀"

# Route: About page
@app.route('/about')
def about():
    return "This is a simple Flask app."

# Run the app
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)