using UnityEngine;

public class PlayerCollision : MonoBehaviour {
    private void OnCollisionEnter2D(Collision2D collision) {
        if (collision.gameObject.CompareTag("Player")) {
            // Push both players away from each other
            Rigidbody2D otherRB = collision.gameObject.GetComponent<Rigidbody2D>();
            Vector2 awayDirection = (otherRB.position - GetComponent<Rigidbody2D>().position).normalized;
            otherRB.AddForce(awayDirection * 10f, ForceMode2D.Impulse);
        }
    }
}
