class Input {
    static var keys: hxd.KeyManager = hxd.KeyManager.instance;
    
    static function isKeyDown(keyCode: Int): Bool {
        return keys.isDown(keyCode);
    }
}
