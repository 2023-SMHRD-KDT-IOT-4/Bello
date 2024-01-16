# streaming_server.py

from flask import Flask, render_template, request
import websockets
import asyncio

app = Flask(__name__)

class WebSocketServer:
    def __init__(self, host, port):
        self.host = host
        self.port = port
        self.server = None

    async def handler(self, websocket, path):
        print(f"Connection from {websocket.remote_address}")
        while True:
            data = await websocket.recv()
            print(f"Received message: {data}")
            # Process data or perform any actions needed

    async def start_server(self):
        self.server = await websockets.serve(
            self.handler, self.host, self.port, ping_interval=None
        )
        print(f"WebSocket server started at ws://{self.host}:{self.port}")

    def stop_server(self):
        if self.server:
            self.server.close()
            asyncio.get_event_loop().run_until_complete(self.server.wait_closed())
            print("WebSocket server stopped")

    async def send_message(self, message):
        if self.server:
            for ws in self.server.connections:
                await ws.send(message)

@app.route('/')
def lcd_page():
    return render_template('LCDpage.html')

if __name__ == '__main__':
    ws_server = WebSocketServer('172.30.1.6', 8001)
    asyncio.run(ws_server.start_server())

    # Start Flask with SocketIO
    app.run(host='172.30.1.6', port=8000, use_reloader=False, debug=False)

    ws_server.stop_server()
