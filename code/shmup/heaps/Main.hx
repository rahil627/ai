class Main extends hxd.App {
    override function init() {
        // Load assets, initialize game objects, and set up input handling here
    }

    override function update(dt: Float) {
    // Update game logic, handle collisions, and manage game state

    game.update(dt);

    // Check for player input and update player(s)
    if (Input.isKeyDown(hxd.Key.W)) {
        players[0].moveUp();
    }
    if (Input.isKeyDown(hxd.Key.A)) {
        players[0].moveLeft();
    }
    if (Input.isKeyDown(hxd.Key.S)) {
        players[0].moveDown();
    }
    if (Input.isKeyDown(hxd.Key.D)) {
        players[0].moveRight();
    }
    if (Input.isKeyDown(hxd.Key.SPACE)) {
        players[0].shoot();
    }
}


    static function main() {
        new Main();
    }
}
