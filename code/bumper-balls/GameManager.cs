using UnityEngine;
using UnityEngine.SceneManagement;

public class GameManager : MonoBehaviour {
    public GameObject playerPrefab;
    public Transform[] spawnPoints;
    public int lives = 3;

    private void Start() {
        SpawnPlayers();
    }

    private void SpawnPlayers() {
        for (int i = 0; i < spawnPoints.Length; i++) {
            GameObject player = Instantiate(playerPrefab, spawnPoints[i].position, Quaternion.identity);
            player.GetComponent<PlayerController>().moveSpeed = Random.Range(3f, 6f);
        }
    }

    public void PlayerDied() {
        lives--;
        if (lives <= 0) {
            // End the game or restart the scene
            SceneManager.LoadScene(SceneManager.GetActiveScene().name);
        }
        else {
            // Respawn players
            SpawnPlayers();
        }
    }
}
