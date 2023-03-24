# AuthorisationScreen

In UIKit version Sign in and Login features are implemented using local storage (CoreData). 

To sign in user needs to enter their personal details and valid email (should contain @.hostName). 

If user with such credentials already exists, an alert will pop up sayng that sign in wasn't successfull.

"Sign in" button is inactive when at least one field is empty.

Login is possible ONLY when there is at least one user registered.

"Login" button is inactive when at least one field is empty.

To login user needs to provide firstname which was entered during the sign in step, and a valid password.

Valid password must contain at least 8 letters and 1 number without special symbols.

Example of a valid password: password1, logMeInn123.

You can test login with "Alex", "Anton" and "Jane". These names are already in local database.

В версии UIKit функции Sign in и Login реализованы с использованием локального хранилища (CoreData).

Для входа пользователю необходимо ввести свои личные данные и действующий адрес электронной почты (должен содержать @.hostName).

Если пользователь с такими учетными данными уже существует, появится предупреждение о том, что вход не выполнен.

Кнопка "Sign in" неактивна, если хотя бы одно поле не заполнено.

Вход возможен ТОЛЬКО при наличии хотя бы одного зарегистрированного пользователя.

Кнопка "Login" неактивна, если хотя бы одно поле не заполнено.

Для входа в систему пользователь должен указать имя, которое было введено на этапе входа, и действующий пароль.

Действительный пароль должен содержать не менее 8 букв и 1 цифру без специальных символов.

Пример действительного пароля: password1, logMeInn123.

Вы можете проверить вход с помощью «Alex», «Anton» и «Jane». Эти имена уже есть в локальной базе данных.

![Simulator Screen Shot - iPhone 14 - 2023-03-24 at 15 58 46](https://user-images.githubusercontent.com/105043706/227527755-866f26bd-3263-437e-a32d-ae483553bbbd.png)

![Simulator Screen Shot - iPhone 14 - 2023-03-24 at 15 58 55](https://user-images.githubusercontent.com/105043706/227527782-cc2d2808-1632-4768-bdb3-1983689e90fd.png)

![Simulator Screen Shot - iPhone 14 - 2023-03-24 at 15 59 17](https://user-images.githubusercontent.com/105043706/227527796-2e810672-3bcc-4907-9b4a-7cd777686d07.png)

![Simulator Screen Shot - iPhone 14 - 2023-03-24 at 15 59 24](https://user-images.githubusercontent.com/105043706/227527810-6d508f65-74c3-4ffb-a51e-d8bdaee20501.png)

