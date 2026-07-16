
USE blog_platform;
DROP TABLE IF EXISTS `posts`;
DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `username` VARCHAR(50) NOT NULL UNIQUE,
  `email` VARCHAR(100) NOT NULL UNIQUE,
  `password` VARCHAR(100) NOT NULL, -- Simple plaintext password storage for demonstration purposes
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `posts` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `title` VARCHAR(150) NOT NULL,
  `content` TEXT NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `user_id` INT NOT NULL,
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `users` (`username`, `email`, `password`) VALUES
('john_doe', 'john@example.com', 'password123'),
('jane_smith', 'jane@example.com', 'securepass'),
('blog_enthusiast', 'enthusiast@example.com', 'blogging4life');

INSERT INTO `posts` (`title`, `content`, `user_id`, `created_at`) VALUES
('Getting Started with Spring Boot', 'Spring Boot makes it easy to create stand-alone, production-ready Spring-based applications that you can run. In this post, we will build a basic REST API using JPA and MySQL. We will walk through controllers, services, repositories, and entity mappings step by step.', 1, '2026-07-08 10:00:00'),
('Introduction to React Hooks', 'React Hooks let you use state and other React features without writing a class. The two most commonly used hooks are useState and useEffect. In this post, we will explore how they manage state and lifecycle hooks in modern functional components with clear examples.', 2, '2026-07-09 11:30:00'),
('Top 5 CSS Design Trends in 2026', 'Aesthetics matter! Modern web applications are moving towards bold gradients, smooth glassmorphism effects, variable typography, and complex layouts powered by CSS Grid and Flexbox. Let us take a deep dive into some design frameworks and custom animations that make your app feel alive.', 1, '2026-07-10 09:15:00'),
('Mastering MySQL Queries', 'Writing efficient MySQL queries is crucial for application performance. Learn the difference between INNER JOIN, LEFT JOIN, indexing columns for faster lookup, and how to write clean subqueries to fetch aggregated stats like total posts per user.', 3, '2026-07-10 14:00:00');

