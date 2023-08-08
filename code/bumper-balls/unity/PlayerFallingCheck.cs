using UnityEngine;

public class PlayerFallingCheck : MonoBehaviour {
    private void Update() {
        if (transform.position.y < -10f) {
            FindObjectOfType<GameManager>().PlayerDied();
            Destroy(gameObject);
        }
    }
}
