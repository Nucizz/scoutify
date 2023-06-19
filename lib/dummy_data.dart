import 'object/dlc.dart';
import 'object/user.dart';

class Dummy {
  static User user1 = User(
    username: "calvin03",
    emailAddress: "calvinanacia123@gmail.com",
    hashedToken: User.encoder("capekCode19"),
  );

  static Dlc content1 = Dlc(
    imagePath:
        "https://media.suara.com/pictures/653x366/2020/04/13/64402-jisoo-blackpink.jpg",
    title: "Sooyaaa___",
    contain:
        """Lorem ipsum dolor sit amet, consectetur 'adipiscing elit'. Vivamus id sapien nec felis pulvinar feugiat.""",
  );
}
