from flask import Flask, render_template, jsonify

app = Flask(__name__)

class Property:
    def __init__(self, address, current_owner, previous_owners, cost, latitude, longitude):
        self.address = address
        self.current_owner = current_owner
        self.previous_owners = previous_owners
        self.cost = cost
        self.latitude = latitude
        self.longitude = longitude

properties = [
    Property("123 Main St", "John Doe", ["Jane Smith", "Michael Johnson"], 250000.0, 37.7749, -122.4194),
    # Add more properties here...
]

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/script.js')
def script():
    return render_template('script.js')

@app.route('/properties')
def get_properties():
    return jsonify([property.__dict__ for property in properties])

if __name__ == '__main__':
    app.run(debug=True)
