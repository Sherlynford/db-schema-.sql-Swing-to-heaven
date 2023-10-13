SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `Activity` (
  `id_activity` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `location` varchar(255) NOT NULL,
  `date_time_ac` datetime NOT NULL,
  `name_activity` varchar(255) NOT NULL,
  `details` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `History` (
  `id_activity` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_time_add` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `Participate` (
  `id_activity` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `Users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `faculty` varchar(255) NOT NULL,
  `Ty_user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `Activity`
  ADD PRIMARY KEY (`id_activity`);

ALTER TABLE `History`
  ADD PRIMARY KEY (`user_id`,`id_activity`),
  ADD KEY `id_activity` (`id_activity`);

ALTER TABLE `Participate`
  ADD PRIMARY KEY (`user_id`,`id_activity`),
  ADD KEY `id_activity` (`id_activity`);

ALTER TABLE `Users`
  ADD PRIMARY KEY (`user_id`);

ALTER TABLE `Activity`
  MODIFY `id_activity` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `Users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `History`
  ADD CONSTRAINT `History_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `History_ibfk_2` FOREIGN KEY (`id_activity`) REFERENCES `Activity` (`id_activity`);

ALTER TABLE `Participate`
  ADD CONSTRAINT `Participate_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  ADD CONSTRAINT `Participate_ibfk_2` FOREIGN KEY (`id_activity`) REFERENCES `Activity` (`id_activity`);
COMMIT;
