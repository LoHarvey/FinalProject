using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Ink.Runtime;
using TMPro;

public
    class ScriptReader : MonoBehaviour
{
    [SerializeField]
    private TextAsset _InkJsonFile;
    private Story _StoryScript;

    public TMP_Text dialogueBox;
    public TMP_Text nameTag;
    public Image characterIcon;
    public Image sceneBackground;

    [SerializeField]
    private GridLayoutGroup choiceHolder;

    [SerializeField]
    private Button choiceBasePrefab;

    void Start()
    {
        loadStory();
    }
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            DisplayNextLine();
        }
    }
    void loadStory()
    {
        _StoryScript = new Story(_InkJsonFile.text);

        _StoryScript.BindExternalFunction("Name", (string charName) => ChangeName(charName));
        _StoryScript.BindExternalFunction("Icon", (string charName) => CharacterIcon(charName));
        _StoryScript.BindExternalFunction("Background", (string charName) => SceneBackground(charName));

    }

    public void DisplayNextLine()


    {
        if (_StoryScript.canContinue)
        {
            string text = _StoryScript.Continue();
            text = text?.Trim();
            dialogueBox.text = text;
        }
        else if (_StoryScript.currentChoices.Count > 0)
        {
            DisplayChoices();
            
        }
        else
        {
            dialogueBox.text = "That's all"; //if there's nothing left to display
        }
    }
    private void DisplayChoices()
    {
        if (choiceHolder.GetComponentsInChildren<Button>().Length > 0) return;

        for (int i=0; i<_StoryScript.currentChoices.Count; i++)
        {
            var choice = _StoryScript.currentChoices[i];
            var button = CreateChoiceButton(choice.text); // creates a choice button

            button.onClick.AddListener(() => OnClickChoiceButton(choice));
        }
    }

    Button CreateChoiceButton(string text)
    {
        //Instantiate the button Prefab
        var choiceButton = Instantiate(choiceBasePrefab);
        choiceButton.transform.SetParent(choiceHolder.transform, false);

        //Change the text in the button Prefab
        var buttonText = choiceButton.GetComponentInChildren<TMP_Text>();
        buttonText.text = text;

        return choiceButton;
    }

    void OnClickChoiceButton(Choice choice)
    {
        _StoryScript.ChooseChoiceIndex(choice.index);
        RefreshChoiceView();
        DisplayNextLine();
    }

    void RefreshChoiceView()
    {
        if(choiceHolder!= null)
        {
            foreach(var button in choiceHolder.GetComponentsInChildren<Button>())
            {
                Destroy(button.gameObject);
            }
        }
    }
    public void ChangeName(string name)
    {
        string SpeakerName = name;

        nameTag.text = SpeakerName;
    }

    public void CharacterIcon(string name)
    {
        var charIcon = Resources.Load<Sprite>("charactericons/" + name);
        characterIcon.sprite = charIcon;
    }

    public void SceneBackground(string name)
    {
        var Background = Resources.Load<Sprite>("SceneBackgrounds/" + name);
        sceneBackground.sprite = Background;
    }


}
        
    

