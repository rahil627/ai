using UnityEngine;
using UnityEngine.UI;

public class UIManager : MonoBehaviour {
    public Text livesText;

    private void Update() {
        livesText.text = "Lives: " + FindObjectOfType<GameManager>().lives;
    }
}
