
CREATE DATABASE instagramdb;


USE instagramdb;


CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    ProfilePictureURL VARCHAR(255),
    Bio TEXT
);


INSERT INTO Users (UserID, Username, Email, PasswordHash, ProfilePictureURL, Bio) VALUES
(1, 'john_doe', 'john@example.com', 'hashed_password1', 'http://example.com/john.jpg', 'Love traveling.'),
(2, 'jane_doe', 'jane@example.com', 'hashed_password2', 'http://example.com/jane.jpg', 'Photographer.'),
(3, 'mike_smith', 'mike@example.com', 'hashed_password3', 'http://example.com/mike.jpg', 'Fitness enthusiast.'),
(4, 'sarah_lee', 'sarah@example.com', 'hashed_password4', 'http://example.com/sarah.jpg', 'Tech lover.'),
(5, 'anna_jones', 'anna@example.com', 'hashed_password5', 'http://example.com/anna.jpg', 'Food blogger.'),
(6, 'mark_white', 'mark@example.com', 'hashed_password6', 'http://example.com/mark.jpg', 'Gamer.'),
(7, 'lucy_brown', 'lucy@example.com', 'hashed_password7', 'http://example.com/lucy.jpg', 'Traveling the world.');


SELECT * FROM Users;


CREATE TABLE Posts (
    PostID INT PRIMARY KEY,
    UserID INT,
    Content TEXT NOT NULL,
    ImageURL VARCHAR(255),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);


INSERT INTO Posts (PostID, UserID, Content, ImageURL) VALUES
(1, 1, 'Exploring the mountains today!', 'http://example.com/mountains.jpg'),
(2, 2, 'Just had an amazing photoshoot!', 'http://example.com/photoshoot.jpg'),
(3, 3, 'Completed a 10k run!', 'http://example.com/run.jpg'),
(4, 4, 'Building a new project.', 'http://example.com/project.jpg'),
(5, 5, 'Best recipe ever!', 'http://example.com/recipe.jpg'),
(6, 6, 'Just won a gaming tournament!', 'http://example.com/tournament.jpg'),
(7, 7, 'My latest adventure in Paris.', 'http://example.com/paris.jpg');


SELECT * FROM Posts;



CREATE TABLE Comments (
    CommentID INT PRIMARY KEY,
    PostID INT,
    UserID INT,
    CommentText TEXT NOT NULL,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);


INSERT INTO Comments (CommentID, PostID, UserID, CommentText) VALUES
(1, 1, 2, 'Looks amazing!'),
(2, 2, 3, 'Great shot!'),
(3, 3, 4, 'Congrats on the run!'),
(4, 4, 5, 'That project looks interesting!'),
(5, 5, 6, 'I need to try this recipe!'),
(6, 6, 7, 'Well done!'),
(7, 7, 1, 'Paris is beautiful!');


SELECT * FROM Comments;


CREATE TABLE Likes (
    LikeID INT PRIMARY KEY,
    PostID INT,
    UserID INT,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);


INSERT INTO Likes (LikeID, PostID, UserID) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 2, 1),
(4, 2, 4),
(5, 3, 2),
(6, 3, 5),
(7, 4, 6);


SELECT * FROM Likes;


CREATE TABLE Friends (
    FriendID INT PRIMARY KEY,
    UserID1 INT,
    UserID2 INT,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID1) REFERENCES Users(UserID),
    FOREIGN KEY (UserID2) REFERENCES Users(UserID)
);


INSERT INTO Friends (FriendID, UserID1, UserID2) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 2, 4),
(4, 3, 5),
(5, 4, 6),
(6, 5, 7),
(7, 6, 7);


SELECT * FROM Friends;


CREATE TABLE Messages (
    MessageID INT PRIMARY KEY,
    SenderID INT,
    ReceiverID INT,
    MessageText TEXT NOT NULL,
    SentAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (SenderID) REFERENCES Users(UserID),
    FOREIGN KEY (ReceiverID) REFERENCES Users(UserID)
);


INSERT INTO Messages (MessageID, SenderID, ReceiverID, MessageText) VALUES
(1, 1, 2, 'Hey, how are you?'),
(2, 2, 1, 'I am good, how about you?'),
(3, 3, 4, 'Wanna grab coffee?'),
(4, 4, 3, 'Sure, let’s do it!'),
(5, 5, 6, 'Check out this link!'),
(6, 6, 5, 'Thanks, I will!'),
(7, 7, 1, 'Long time no see!');


SELECT * FROM Messages;


CREATE TABLE Notifications (
    NotificationID INT PRIMARY KEY,
    UserID INT,
    NotificationText TEXT NOT NULL,
    IsRead BOOLEAN DEFAULT FALSE,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Insert data into Notifications
INSERT INTO Notifications (NotificationID, UserID, NotificationText) VALUES
(1, 1, 'You have a new friend request.'),
(2, 2, 'Someone liked your post.'),
(3, 3, 'You have a new message.'),
(4, 4, 'Your post received a comment.'),
(5, 5, 'You have a new friend request.'),
(6, 6, 'Someone mentioned you in a comment.'),
(7, 7, 'Your friend is online.');


SELECT * FROM Notifications;


CREATE TABLE Groupsinsta (
    GroupID INT PRIMARY KEY,
    GroupName VARCHAR(100) NOT NULL,
    Description TEXT,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO Groupsinsta (GroupID, GroupName, Description) VALUES
(1, 'Travel Enthusiasts', 'Group for people who love to travel.'),
(2, 'Photography', 'Share your photography skills.'),
(3, 'Fitness Fans', 'Group for fitness lovers.'),
(4, 'Tech Geeks', 'Discussion on the latest technology.'),
(5, 'Foodies', 'For people who love to eat and cook.'),
(6, 'Gamers United', 'Group for gamers.'),
(7, 'World Explorers', 'Share your travel experiences.');


SELECT * FROM Groupsinsta;


CREATE TABLE GroupMembers (
    GroupMemberID INT PRIMARY KEY,
    GroupID INT,
    UserID INT,
    JoinedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (GroupID) REFERENCES Groupsinsta(GroupID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);


INSERT INTO GroupMembers (GroupMemberID, GroupID, UserID) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5, 3, 5),
(6, 3, 6),
(7, 4, 7);


SELECT * FROM GroupMembers;




CREATE TABLE DirectMessages (
    DirectMessageID INT PRIMARY KEY,
    SenderID INT,
    ReceiverID INT,
    MessageText TEXT NOT NULL,
    SentAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (SenderID) REFERENCES Users(UserID),
    FOREIGN KEY (ReceiverID) REFERENCES Users(UserID)
);


INSERT INTO DirectMessages (DirectMessageID, SenderID, ReceiverID, MessageText) VALUES
(1, 1, 2, 'Are you coming to the event?'),
(2, 2, 1, 'Yes, I will be there.'),
(3, 3, 4, 'What time is the meetup?'),
(4, 4, 3, 'It starts at 10 AM.'),
(5, 5, 6, 'Can you share the recipe?'),
(6, 6, 5, 'Sure, I will send it to you.'),
(7, 7, 1, 'Can’t wait for the seminar!');


SELECT * FROM DirectMessages;


CREATE TABLE Hashtags (
    HashtagID INT PRIMARY KEY,
    HashtagName VARCHAR(100) NOT NULL
);


INSERT INTO Hashtags (HashtagID, HashtagName) VALUES
(1, '#travel'),
(2, '#photography'),
(3, '#fitness'),
(4, '#technology'),
(5, '#food'),
(6, '#gaming'),
(7, '#adventure');


SELECT * FROM Hashtags;


