from flask import Flask, request, jsonify
import subprocess

app = Flask(__name__)

@app.route('/marina', methods=['GET'])
def solve_sat():
    prop = request.args.get('laza')
    if not prop:
        return jsonify({"error": "Proposition manquante dans le paramètre 'laza'"}), 400
    prop = ''.join(prop.split())
    print(f"Proposition reçue : {prop}")  # Ajout pour débogage    
    try:
        result = subprocess.run(['./marina', prop], capture_output=True, text=True)
        return jsonify({"result": result.stdout, "error": result.stderr})
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
