l#AskMowgli

####Team Project: Seth, Rhonda, Dan, Chae

####Models
-  Users
  -  template
  -  has many surveys
  -  has many responses
-  Surveys
  -  has many questions
  -  title
-  Questions
  -  has many Responses
  -  has many ResposeChoices
  -  prompt (question)
  -  description (question subtitle)
  -  type (multile choice, text, etc)
-  Responses
  -  belogs to users
  - value
-  Response Choices
  -  belongs to questions
  - value

####Use Cases:
-  can create account
-  can log in/log out
-  can create survey
-  see their surveys
-  see their public surveys
  -  can give responses
-  can access private surveys
  -  can give responses
- can see aggregate data for their own sureys
