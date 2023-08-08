class Game {
    var players: Array<Player>;
    var enemies: Array<Enemy>;
    var bullets: Array<Bullet>;

    public function new() {
        players = [];
        enemies = [];
        bullets = [];
    }

    public function update(dt: Float) {
        for (player in players) {
            player.update(dt);
        }
        
        for (enemy in enemies) {
            enemy.update(dt);
        }
        
        for (bullet in bullets) {
            bullet.update(dt);
        }
        
        // Implement collision detection and game mechanics here
    }
}
