

CREATE TABLE `block` (
  `blockID` int(11) NOT NULL,
  `blockerID` int(11) NOT NULL,
  `blockedID` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `blockOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `block` (`blockID`, `blockerID`, `blockedID`, `status`, `blockOn`) VALUES
(3, 10, 14, 0, '2020-01-14 01:40:35');


CREATE TABLE `comments` (
  `commentID` int(11) NOT NULL,
  `comment_parent_id` int(11) NOT NULL,
  `commentReplyID` decimal(20,0) NOT NULL,
  `replyID` decimal(20,0) NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `commentOn` int(11) NOT NULL,
  `commentBy` decimal(20,0) NOT NULL,
  `commentAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `follow` (
  `id` int(11) NOT NULL,
  `sender` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  `followOn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE `messages` (
  `messageID` int(11) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `messageTo` int(11) NOT NULL,
  `messageFrom` int(11) NOT NULL,
  `messageOn` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `notification` (
  `ID` int(11) NOT NULL,
  `notificationFor` int(11) NOT NULL,
  `notificationFrom` int(11) NOT NULL,
  `postid` int(11) NOT NULL,
  `type` enum('postReact','commentReact','comment','share','message','request','mention') NOT NULL,
  `notificationOn` datetime NOT NULL,
  `notificationCount` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `friendStatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `post` (
  `post_id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `post` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `postBy` int(11) DEFAULT NULL,
  `sharedFrom` int(11) DEFAULT NULL,
  `shareId` int(11) DEFAULT NULL,
  `sharedBy` int(11) DEFAULT NULL,
  `postImage` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `imageId` text DEFAULT NULL,
  `likesCount` int(11) DEFAULT NULL,
  `shareCount` int(11) DEFAULT NULL,
  `postedOn` datetime DEFAULT NULL,
  `shareText` text DEFAULT NULL,
  `profilePhoto` text DEFAULT NULL,
  `coverPhoto` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `currentCity` varchar(255) DEFAULT NULL,
  `shortBio` text DEFAULT NULL,
  `aboutYou` text DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `profilePic` text DEFAULT NULL,
  `coverPic` text DEFAULT NULL,
  `politicalViews` varchar(255) DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `highSchool` text DEFAULT NULL,
  `college` text DEFAULT NULL,
  `university` text DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `hometown` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `workplace` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `professional` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `otherPlace` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `socialLink` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `relationship` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `quotes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `otherName` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `lifeEvent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE `react` (
  `reactID` int(11) NOT NULL,
  `reactBy` int(11) NOT NULL,
  `reactOn` int(11) NOT NULL,
  `reactCommentOn` int(11) NOT NULL,
  `reactReplyOn` int(11) NOT NULL,
  `reactType` enum('like','love','haha','wow','sad','angry') CHARACTER SET utf8 NOT NULL,
  `reactTimeOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `request` (
  `requestid` int(11) NOT NULL,
  `reqtReceiver` int(11) NOT NULL,
  `reqtSender` int(11) NOT NULL,
  `reqStatus` int(11) NOT NULL,
  `requestOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `token` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `screenName` varchar(255) NOT NULL,
  `userLink` text NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `block`
  ADD PRIMARY KEY (`blockID`);


ALTER TABLE `comments`
  ADD PRIMARY KEY (`commentID`);


ALTER TABLE `follow`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `messages`
  ADD PRIMARY KEY (`messageID`);


ALTER TABLE `notification`
  ADD PRIMARY KEY (`ID`);


ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `postForien` (`userId`);


ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profileForein` (`userId`);


ALTER TABLE `react`
  ADD PRIMARY KEY (`reactID`);

ALTER TABLE `request`
  ADD PRIMARY KEY (`requestid`);


ALTER TABLE `token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_fk` (`user_id`);


ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);


ALTER TABLE `block`
  MODIFY `blockID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `comments`
  MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

ALTER TABLE `follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

ALTER TABLE `messages`
  MODIFY `messageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

ALTER TABLE `notification`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;


ALTER TABLE `post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;


ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;


ALTER TABLE `react`
  MODIFY `reactID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=292;


ALTER TABLE `request`
  MODIFY `requestid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;


ALTER TABLE `token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;


ALTER TABLE `post`
  ADD CONSTRAINT `postForien` FOREIGN KEY (`userId`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;


ALTER TABLE `profile`
  ADD CONSTRAINT `profileForein` FOREIGN KEY (`userId`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

ALTER TABLE `token`
  ADD CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;
COMMIT;
