--
-- Скрипт сгенерирован Devart dbForge Studio 2020 for MySQL, Версия 9.0.567.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 17.03.2022 16:09:09
-- Версия сервера: 5.7.33
-- Версия клиента: 4.1
--

-- 
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установить режим SQL (SQL mode)
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Установка кодировки, с использованием которой клиент будет посылать запросы на сервер
--
SET NAMES 'utf8';

--
-- Установка базы данных по умолчанию
--
USE jobzzz;

--
-- Удалить таблицу `currencies`
--
DROP TABLE IF EXISTS currencies;

--
-- Удалить таблицу `english_levels`
--
DROP TABLE IF EXISTS english_levels;

--
-- Удалить таблицу `experiences`
--
DROP TABLE IF EXISTS experiences;

--
-- Удалить таблицу `failed_jobs`
--
DROP TABLE IF EXISTS failed_jobs;

--
-- Удалить таблицу `html_blocks`
--
DROP TABLE IF EXISTS html_blocks;

--
-- Удалить таблицу `jobs`
--
DROP TABLE IF EXISTS jobs;

--
-- Удалить таблицу `language_lines`
--
DROP TABLE IF EXISTS language_lines;

--
-- Удалить таблицу `media`
--
DROP TABLE IF EXISTS media;

--
-- Удалить таблицу `migrations`
--
DROP TABLE IF EXISTS migrations;

--
-- Удалить таблицу `notification_logs`
--
DROP TABLE IF EXISTS notification_logs;

--
-- Удалить таблицу `pages`
--
DROP TABLE IF EXISTS pages;

--
-- Удалить таблицу `partners`
--
DROP TABLE IF EXISTS partners;

--
-- Удалить таблицу `password_histories`
--
DROP TABLE IF EXISTS password_histories;

--
-- Удалить таблицу `password_resets`
--
DROP TABLE IF EXISTS password_resets;

--
-- Удалить таблицу `personal_access_tokens`
--
DROP TABLE IF EXISTS personal_access_tokens;

--
-- Удалить таблицу `push_subscriptions`
--
DROP TABLE IF EXISTS push_subscriptions;

--
-- Удалить таблицу `salaries`
--
DROP TABLE IF EXISTS salaries;

--
-- Удалить таблицу `site_options`
--
DROP TABLE IF EXISTS site_options;

--
-- Удалить таблицу `websockets_statistics_entries`
--
DROP TABLE IF EXISTS websockets_statistics_entries;

--
-- Удалить таблицу `candidate_employment_types`
--
DROP TABLE IF EXISTS candidate_employment_types;

--
-- Удалить таблицу `vacancy_employment_types`
--
DROP TABLE IF EXISTS vacancy_employment_types;

--
-- Удалить таблицу `employment_types`
--
DROP TABLE IF EXISTS employment_types;

--
-- Удалить таблицу `candidate_skills`
--
DROP TABLE IF EXISTS candidate_skills;

--
-- Удалить таблицу `specializations_skills`
--
DROP TABLE IF EXISTS specializations_skills;

--
-- Удалить таблицу `vacancy_skills`
--
DROP TABLE IF EXISTS vacancy_skills;

--
-- Удалить таблицу `skills`
--
DROP TABLE IF EXISTS skills;

--
-- Удалить таблицу `menu_items`
--
DROP TABLE IF EXISTS menu_items;

--
-- Удалить таблицу `menus`
--
DROP TABLE IF EXISTS menus;

--
-- Удалить таблицу `model_has_permissions`
--
DROP TABLE IF EXISTS model_has_permissions;

--
-- Удалить таблицу `role_has_permissions`
--
DROP TABLE IF EXISTS role_has_permissions;

--
-- Удалить таблицу `permissions`
--
DROP TABLE IF EXISTS permissions;

--
-- Удалить таблицу `model_has_roles`
--
DROP TABLE IF EXISTS model_has_roles;

--
-- Удалить таблицу `roles`
--
DROP TABLE IF EXISTS roles;

--
-- Удалить таблицу `addresses`
--
DROP TABLE IF EXISTS addresses;

--
-- Удалить таблицу `candidate_cities`
--
DROP TABLE IF EXISTS candidate_cities;

--
-- Удалить таблицу `vacancy_cities`
--
DROP TABLE IF EXISTS vacancy_cities;

--
-- Удалить таблицу `cities`
--
DROP TABLE IF EXISTS cities;

--
-- Удалить таблицу `regions`
--
DROP TABLE IF EXISTS regions;

--
-- Удалить таблицу `countries`
--
DROP TABLE IF EXISTS countries;

--
-- Удалить таблицу `candidate_specializations`
--
DROP TABLE IF EXISTS candidate_specializations;

--
-- Удалить таблицу `vacancy_specializations`
--
DROP TABLE IF EXISTS vacancy_specializations;

--
-- Удалить таблицу `specializations`
--
DROP TABLE IF EXISTS specializations;

--
-- Удалить таблицу `specialization_types`
--
DROP TABLE IF EXISTS specialization_types;

--
-- Удалить таблицу `company_users`
--
DROP TABLE IF EXISTS company_users;

--
-- Удалить таблицу `offers`
--
DROP TABLE IF EXISTS offers;

--
-- Удалить таблицу `payouts`
--
DROP TABLE IF EXISTS payouts;

--
-- Удалить таблицу `push_questions`
--
DROP TABLE IF EXISTS push_questions;

--
-- Удалить таблицу `vacancies`
--
DROP TABLE IF EXISTS vacancies;

--
-- Удалить таблицу `companies`
--
DROP TABLE IF EXISTS companies;

--
-- Удалить таблицу `candidate_open_data`
--
DROP TABLE IF EXISTS candidate_open_data;

--
-- Удалить таблицу `candidate_profiles`
--
DROP TABLE IF EXISTS candidate_profiles;

--
-- Удалить таблицу `chat_messages`
--
DROP TABLE IF EXISTS chat_messages;

--
-- Удалить таблицу `invoices`
--
DROP TABLE IF EXISTS invoices;

--
-- Удалить таблицу `notification_items`
--
DROP TABLE IF EXISTS notification_items;

--
-- Удалить таблицу `notify_settings`
--
DROP TABLE IF EXISTS notify_settings;

--
-- Удалить таблицу `recruiter_settings`
--
DROP TABLE IF EXISTS recruiter_settings;

--
-- Удалить таблицу `visitables`
--
DROP TABLE IF EXISTS visitables;

--
-- Удалить таблицу `users`
--
DROP TABLE IF EXISTS users;

--
-- Удалить таблицу `payment_methods`
--
DROP TABLE IF EXISTS payment_methods;

--
-- Установка базы данных по умолчанию
--
USE jobzzz;

--
-- Создать таблицу `payment_methods`
--
CREATE TABLE payment_methods (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  title_ru varchar(191) NOT NULL,
  title_en varchar(191) DEFAULT NULL,
  slug varchar(191) DEFAULT NULL,
  active tinyint(1) NOT NULL DEFAULT 1,
  description text DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 4,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `users`
--
CREATE TABLE users (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  type varchar(191) DEFAULT NULL,
  login varchar(191) DEFAULT NULL,
  email varchar(191) DEFAULT NULL,
  phone varchar(191) DEFAULT NULL,
  skype varchar(191) DEFAULT NULL,
  telegram varchar(191) DEFAULT NULL,
  telegram_chat_id varchar(191) DEFAULT NULL,
  linked_in varchar(191) DEFAULT NULL,
  github varchar(191) DEFAULT NULL,
  portfolio varchar(191) DEFAULT NULL,
  first_name varchar(191) DEFAULT NULL,
  last_name varchar(191) DEFAULT NULL,
  position varchar(191) DEFAULT NULL,
  gender varchar(191) DEFAULT NULL,
  date_of_birth date DEFAULT NULL,
  avatar varchar(191) DEFAULT NULL,
  email_verified_at timestamp NULL DEFAULT NULL,
  password varchar(191) NOT NULL,
  password_changed_at timestamp NULL DEFAULT NULL,
  confirmation_code varchar(191) DEFAULT NULL,
  confirmed tinyint(1) NOT NULL DEFAULT 0,
  agree tinyint(1) NOT NULL DEFAULT 1,
  status tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  hires int(11) NOT NULL DEFAULT 0,
  last_activity timestamp NULL DEFAULT NULL,
  last_login_at timestamp NULL DEFAULT NULL,
  last_login_ip varchar(191) DEFAULT NULL,
  timezone varchar(191) DEFAULT NULL,
  to_be_logged_out tinyint(1) NOT NULL DEFAULT 0,
  provider varchar(191) DEFAULT NULL,
  provider_id varchar(191) DEFAULT NULL,
  remember_token varchar(100) DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  deleted_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 83,
AVG_ROW_LENGTH = 630,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `users_email_unique` для объекта типа таблица `users`
--
ALTER TABLE users
ADD UNIQUE INDEX users_email_unique (email);

--
-- Создать таблицу `visitables`
--
CREATE TABLE visitables (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  model_type varchar(191) NOT NULL,
  model_id bigint(20) UNSIGNED NOT NULL,
  user_id bigint(20) UNSIGNED NOT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 26,
AVG_ROW_LENGTH = 862,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `visitables_model_type_model_id_index` для объекта типа таблица `visitables`
--
ALTER TABLE visitables
ADD INDEX visitables_model_type_model_id_index (model_type, model_id);

--
-- Создать внешний ключ
--
ALTER TABLE visitables
ADD CONSTRAINT visitables_user_id_foreign FOREIGN KEY (user_id)
REFERENCES users (id) ON DELETE CASCADE;

--
-- Создать таблицу `recruiter_settings`
--
CREATE TABLE recruiter_settings (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  recruiter_id bigint(20) UNSIGNED NOT NULL,
  email_notify tinyint(1) NOT NULL DEFAULT 1,
  telegram_notify tinyint(1) NOT NULL DEFAULT 0,
  notify_contacts tinyint(1) NOT NULL DEFAULT 1,
  notify_message tinyint(1) NOT NULL DEFAULT 1,
  notify_application tinyint(1) NOT NULL DEFAULT 1,
  notify_candidates tinyint(1) NOT NULL DEFAULT 1,
  notify_news tinyint(1) NOT NULL DEFAULT 1,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 3,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE recruiter_settings
ADD CONSTRAINT recruiter_settings_recruiter_id_foreign FOREIGN KEY (recruiter_id)
REFERENCES users (id) ON DELETE CASCADE;

--
-- Создать таблицу `notify_settings`
--
CREATE TABLE notify_settings (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id bigint(20) UNSIGNED NOT NULL,
  email_notify tinyint(1) NOT NULL DEFAULT 1,
  push_notify tinyint(1) NOT NULL DEFAULT 0,
  telegram_notify tinyint(1) NOT NULL DEFAULT 0,
  notify_contacts tinyint(1) NOT NULL DEFAULT 1,
  notify_message tinyint(1) NOT NULL DEFAULT 1,
  notify_application tinyint(1) NOT NULL DEFAULT 1,
  notify_candidates tinyint(1) NOT NULL DEFAULT 1,
  notify_vacancies tinyint(1) NOT NULL DEFAULT 1,
  notify_news tinyint(1) NOT NULL DEFAULT 1,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 10,
AVG_ROW_LENGTH = 1820,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE notify_settings
ADD CONSTRAINT notify_settings_user_id_foreign FOREIGN KEY (user_id)
REFERENCES users (id) ON DELETE CASCADE;

--
-- Создать таблицу `notification_items`
--
CREATE TABLE notification_items (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id bigint(20) UNSIGNED DEFAULT NULL,
  type varchar(191) NOT NULL DEFAULT 'info',
  role varchar(191) DEFAULT NULL,
  icon varchar(191) DEFAULT NULL,
  url varchar(191) DEFAULT NULL,
  title text DEFAULT NULL,
  message text DEFAULT NULL,
  viewed tinyint(1) NOT NULL DEFAULT 0,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 2,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE notification_items
ADD CONSTRAINT notification_items_user_id_foreign FOREIGN KEY (user_id)
REFERENCES users (id) ON DELETE CASCADE;

--
-- Создать таблицу `invoices`
--
CREATE TABLE invoices (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id bigint(20) UNSIGNED DEFAULT NULL,
  invoice_no varchar(191) DEFAULT NULL,
  tinkoff_no varchar(255) DEFAULT NULL,
  status tinyint(4) NOT NULL DEFAULT 0,
  payment_method_id bigint(20) UNSIGNED DEFAULT NULL,
  payment_method varchar(191) DEFAULT NULL,
  amount int(11) NOT NULL DEFAULT 0,
  currency varchar(191) NOT NULL DEFAULT 'RUB',
  invoice varchar(191) DEFAULT NULL,
  act varchar(191) DEFAULT NULL,
  paid_at timestamp NULL DEFAULT NULL,
  uin varchar(191) DEFAULT NULL,
  payment_info text NOT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 51,
AVG_ROW_LENGTH = 2978,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE invoices
ADD CONSTRAINT invoices_payment_method_id_foreign FOREIGN KEY (payment_method_id)
REFERENCES payment_methods (id) ON DELETE SET NULL;

--
-- Создать внешний ключ
--
ALTER TABLE invoices
ADD CONSTRAINT invoices_user_id_foreign FOREIGN KEY (user_id)
REFERENCES users (id) ON DELETE SET NULL;

--
-- Создать таблицу `chat_messages`
--
CREATE TABLE chat_messages (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  type varchar(191) NOT NULL,
  from_id bigint(20) UNSIGNED DEFAULT NULL,
  to_id bigint(20) UNSIGNED DEFAULT NULL,
  body text DEFAULT NULL,
  attachment text DEFAULT NULL,
  seen tinyint(1) NOT NULL DEFAULT 0,
  edited tinyint(1) NOT NULL DEFAULT 0,
  is_support tinyint(1) NOT NULL DEFAULT 0,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 159,
AVG_ROW_LENGTH = 390,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE chat_messages
ADD CONSTRAINT chat_messages_from_id_foreign FOREIGN KEY (from_id)
REFERENCES users (id) ON DELETE SET NULL;

--
-- Создать внешний ключ
--
ALTER TABLE chat_messages
ADD CONSTRAINT chat_messages_to_id_foreign FOREIGN KEY (to_id)
REFERENCES users (id) ON DELETE SET NULL;

--
-- Создать таблицу `candidate_profiles`
--
CREATE TABLE candidate_profiles (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id bigint(20) UNSIGNED DEFAULT NULL,
  status tinyint(4) NOT NULL DEFAULT 0,
  position varchar(191) DEFAULT NULL,
  slug varchar(191) DEFAULT NULL,
  resume_name varchar(191) DEFAULT NULL,
  resume varchar(191) DEFAULT NULL,
  description text DEFAULT NULL,
  experience int(11) NOT NULL DEFAULT 0,
  price_full_time int(11) NOT NULL DEFAULT 100000,
  price_freelance int(11) NOT NULL DEFAULT 400,
  english_level tinyint(4) NOT NULL DEFAULT 0,
  moderated tinyint(1) NOT NULL DEFAULT 0,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  deleted_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 71,
AVG_ROW_LENGTH = 1638,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE candidate_profiles
ADD CONSTRAINT candidate_profiles_user_id_foreign FOREIGN KEY (user_id)
REFERENCES users (id) ON DELETE SET NULL;

--
-- Создать таблицу `candidate_open_data`
--
CREATE TABLE candidate_open_data (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  candidate_id bigint(20) UNSIGNED NOT NULL,
  recruiter_id bigint(20) UNSIGNED NOT NULL,
  data text DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 9,
AVG_ROW_LENGTH = 2340,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE candidate_open_data
ADD CONSTRAINT candidate_open_data_candidate_id_foreign FOREIGN KEY (candidate_id)
REFERENCES users (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE candidate_open_data
ADD CONSTRAINT candidate_open_data_recruiter_id_foreign FOREIGN KEY (recruiter_id)
REFERENCES users (id) ON DELETE CASCADE;

--
-- Создать таблицу `companies`
--
CREATE TABLE companies (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  title varchar(191) DEFAULT NULL,
  slug varchar(191) DEFAULT NULL,
  logo varchar(191) DEFAULT NULL,
  website varchar(191) DEFAULT NULL,
  ref varchar(191) DEFAULT NULL,
  address text DEFAULT NULL,
  description text DEFAULT NULL,
  status tinyint(4) NOT NULL DEFAULT 0,
  is_product tinyint(1) NOT NULL DEFAULT 0,
  moderated tinyint(1) NOT NULL DEFAULT 0,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  deleted_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 14,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `vacancies`
--
CREATE TABLE vacancies (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id bigint(20) UNSIGNED NOT NULL,
  company_id bigint(20) UNSIGNED NOT NULL,
  status tinyint(4) NOT NULL DEFAULT 0,
  status_expired datetime DEFAULT NULL,
  title varchar(191) DEFAULT NULL,
  slug varchar(191) DEFAULT NULL,
  short_description text DEFAULT NULL,
  description text DEFAULT NULL,
  experience int(11) NOT NULL DEFAULT 0,
  english_level tinyint(4) NOT NULL DEFAULT 0,
  price_from int(11) NOT NULL DEFAULT 0,
  price_to int(11) NOT NULL DEFAULT 100000,
  is_product tinyint(1) NOT NULL DEFAULT 0,
  relocate tinyint(1) NOT NULL DEFAULT 0,
  help_relocate tinyint(1) NOT NULL DEFAULT 0,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  deleted_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 63,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE vacancies
ADD CONSTRAINT vacancies_company_id_foreign FOREIGN KEY (company_id)
REFERENCES companies (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE vacancies
ADD CONSTRAINT vacancies_user_id_foreign FOREIGN KEY (user_id)
REFERENCES users (id) ON DELETE CASCADE;

--
-- Создать таблицу `push_questions`
--
CREATE TABLE push_questions (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id bigint(20) UNSIGNED NOT NULL,
  vacancy_id bigint(20) UNSIGNED DEFAULT NULL,
  recruiter_id bigint(20) UNSIGNED DEFAULT NULL,
  question text DEFAULT NULL,
  answer varchar(191) DEFAULT NULL,
  type varchar(191) DEFAULT NULL,
  starts_at timestamp NULL DEFAULT NULL,
  ends_at timestamp NULL DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 47,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE push_questions
ADD CONSTRAINT push_questions_recruiter_id_foreign FOREIGN KEY (recruiter_id)
REFERENCES users (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE push_questions
ADD CONSTRAINT push_questions_user_id_foreign FOREIGN KEY (user_id)
REFERENCES users (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE push_questions
ADD CONSTRAINT push_questions_vacancy_id_foreign FOREIGN KEY (vacancy_id)
REFERENCES vacancies (id) ON DELETE CASCADE;

--
-- Создать таблицу `payouts`
--
CREATE TABLE payouts (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  vacancy_id bigint(20) UNSIGNED DEFAULT NULL,
  candidate_id bigint(20) UNSIGNED DEFAULT NULL,
  recruiter_id bigint(20) UNSIGNED DEFAULT NULL,
  invoice_id bigint(20) UNSIGNED DEFAULT NULL,
  status tinyint(4) NOT NULL DEFAULT 0,
  status_text text DEFAULT NULL,
  released_to_work datetime DEFAULT NULL,
  pay_before datetime DEFAULT NULL,
  paid_at timestamp NULL DEFAULT NULL,
  amount int(11) NOT NULL DEFAULT 0,
  currency varchar(191) DEFAULT NULL,
  act varchar(191) DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  deleted_at timestamp NULL DEFAULT NULL,
  user_warn_sent tinyint(1) NOT NULL DEFAULT 0,
  admin_warn_sent tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 14,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `payouts_candidate_id_foreign` для объекта типа таблица `payouts`
--
ALTER TABLE payouts
ADD INDEX payouts_candidate_id_foreign (candidate_id);

--
-- Создать внешний ключ
--
ALTER TABLE payouts
ADD CONSTRAINT payouts_invoice_id_foreign FOREIGN KEY (invoice_id)
REFERENCES invoices (id) ON DELETE SET NULL;

--
-- Создать внешний ключ
--
ALTER TABLE payouts
ADD CONSTRAINT payouts_recruiter_id_foreign FOREIGN KEY (recruiter_id)
REFERENCES users (id) ON DELETE SET NULL;

--
-- Создать внешний ключ
--
ALTER TABLE payouts
ADD CONSTRAINT payouts_vacancy_id_foreign FOREIGN KEY (vacancy_id)
REFERENCES vacancies (id) ON DELETE SET NULL;

--
-- Создать таблицу `offers`
--
CREATE TABLE offers (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  vacancy_id bigint(20) UNSIGNED DEFAULT NULL,
  candidate_id bigint(20) UNSIGNED NOT NULL,
  recruiter_id bigint(20) UNSIGNED NOT NULL,
  resume_status tinyint(4) NOT NULL DEFAULT 0,
  candidate_status tinyint(4) NOT NULL DEFAULT 0,
  candidate_expired datetime DEFAULT NULL,
  recruiter_status tinyint(4) NOT NULL DEFAULT 0,
  recruiter_expired datetime DEFAULT NULL,
  payment_status tinyint(4) NOT NULL DEFAULT 0,
  initiator tinyint(4) NOT NULL DEFAULT 0,
  comment text DEFAULT NULL,
  resume_name varchar(191) DEFAULT NULL,
  resume varchar(191) DEFAULT NULL,
  released_to_work datetime DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  deleted_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 58,
AVG_ROW_LENGTH = 1638,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `candidate_vacancies_candidate_id_foreign` для объекта типа таблица `offers`
--
ALTER TABLE offers
ADD INDEX candidate_vacancies_candidate_id_foreign (candidate_id);

--
-- Создать индекс `candidate_vacancies_recruiter_id_foreign` для объекта типа таблица `offers`
--
ALTER TABLE offers
ADD INDEX candidate_vacancies_recruiter_id_foreign (recruiter_id);

--
-- Создать индекс `candidate_vacancies_vacancy_id_foreign` для объекта типа таблица `offers`
--
ALTER TABLE offers
ADD INDEX candidate_vacancies_vacancy_id_foreign (vacancy_id);

--
-- Создать внешний ключ
--
ALTER TABLE offers
ADD CONSTRAINT offers_recruiter_id_foreign FOREIGN KEY (recruiter_id)
REFERENCES users (id);

--
-- Создать внешний ключ
--
ALTER TABLE offers
ADD CONSTRAINT offers_vacancy_id_foreign FOREIGN KEY (vacancy_id)
REFERENCES vacancies (id);

--
-- Создать таблицу `company_users`
--
CREATE TABLE company_users (
  user_id bigint(20) UNSIGNED NOT NULL,
  company_id bigint(20) UNSIGNED NOT NULL,
  is_admin tinyint(1) NOT NULL DEFAULT 0,
  status tinyint(4) NOT NULL DEFAULT 1,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (user_id, company_id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE company_users
ADD CONSTRAINT company_users_company_id_foreign FOREIGN KEY (company_id)
REFERENCES companies (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE company_users
ADD CONSTRAINT company_users_user_id_foreign FOREIGN KEY (user_id)
REFERENCES users (id) ON DELETE CASCADE;

--
-- Создать таблицу `specialization_types`
--
CREATE TABLE specialization_types (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  title_ru varchar(191) NOT NULL,
  title_en varchar(191) NOT NULL,
  slug varchar(191) NOT NULL,
  popular tinyint(1) NOT NULL DEFAULT 1,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 4,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `specializations`
--
CREATE TABLE specializations (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  type_id bigint(20) UNSIGNED NOT NULL,
  title_ru varchar(191) DEFAULT NULL,
  title_en varchar(191) DEFAULT NULL,
  logo varchar(191) DEFAULT NULL,
  slug varchar(191) NOT NULL,
  popular tinyint(1) NOT NULL DEFAULT 1,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 32,
AVG_ROW_LENGTH = 546,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE specializations
ADD CONSTRAINT specializations_type_id_foreign FOREIGN KEY (type_id)
REFERENCES specialization_types (id) ON DELETE CASCADE;

--
-- Создать таблицу `vacancy_specializations`
--
CREATE TABLE vacancy_specializations (
  vacancy_id bigint(20) UNSIGNED NOT NULL,
  specialization_id bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (vacancy_id, specialization_id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE vacancy_specializations
ADD CONSTRAINT vacancy_specializations_specialization_id_foreign FOREIGN KEY (specialization_id)
REFERENCES specializations (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE vacancy_specializations
ADD CONSTRAINT vacancy_specializations_vacancy_id_foreign FOREIGN KEY (vacancy_id)
REFERENCES vacancies (id) ON DELETE CASCADE;

--
-- Создать таблицу `candidate_specializations`
--
CREATE TABLE candidate_specializations (
  profile_id bigint(20) UNSIGNED NOT NULL,
  specialization_id bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (profile_id, specialization_id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 712,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE candidate_specializations
ADD CONSTRAINT candidate_specializations_profile_id_foreign FOREIGN KEY (profile_id)
REFERENCES candidate_profiles (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE candidate_specializations
ADD CONSTRAINT candidate_specializations_specialization_id_foreign FOREIGN KEY (specialization_id)
REFERENCES specializations (id) ON DELETE CASCADE;

--
-- Создать таблицу `countries`
--
CREATE TABLE countries (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  title_ru varchar(191) NOT NULL,
  title_en varchar(191) NOT NULL,
  code varchar(191) NOT NULL,
  slug varchar(191) NOT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 250,
AVG_ROW_LENGTH = 197,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `regions`
--
CREATE TABLE regions (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  country_id bigint(20) UNSIGNED NOT NULL,
  title_ru varchar(191) NOT NULL,
  title_en varchar(191) NOT NULL,
  slug varchar(191) NOT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 86,
AVG_ROW_LENGTH = 192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE regions
ADD CONSTRAINT regions_country_id_foreign FOREIGN KEY (country_id)
REFERENCES countries (id) ON DELETE CASCADE;

--
-- Создать таблицу `cities`
--
CREATE TABLE cities (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  country_id bigint(20) UNSIGNED NOT NULL,
  region_id bigint(20) UNSIGNED DEFAULT NULL,
  title_ru varchar(191) NOT NULL,
  title_en varchar(191) NOT NULL,
  slug varchar(191) NOT NULL,
  used tinyint(1) NOT NULL DEFAULT 0,
  popular tinyint(1) NOT NULL DEFAULT 0,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1118,
AVG_ROW_LENGTH = 132,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE cities
ADD CONSTRAINT cities_country_id_foreign FOREIGN KEY (country_id)
REFERENCES countries (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE cities
ADD CONSTRAINT cities_region_id_foreign FOREIGN KEY (region_id)
REFERENCES countries (id) ON DELETE SET NULL;

--
-- Создать таблицу `vacancy_cities`
--
CREATE TABLE vacancy_cities (
  vacancy_id bigint(20) UNSIGNED NOT NULL,
  city_id bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (vacancy_id, city_id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE vacancy_cities
ADD CONSTRAINT vacancy_cities_city_id_foreign FOREIGN KEY (city_id)
REFERENCES cities (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE vacancy_cities
ADD CONSTRAINT vacancy_cities_vacancy_id_foreign FOREIGN KEY (vacancy_id)
REFERENCES vacancies (id) ON DELETE CASCADE;

--
-- Создать таблицу `candidate_cities`
--
CREATE TABLE candidate_cities (
  profile_id bigint(20) UNSIGNED NOT NULL,
  city_id bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (profile_id, city_id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 1365,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE candidate_cities
ADD CONSTRAINT candidate_cities_city_id_foreign FOREIGN KEY (city_id)
REFERENCES cities (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE candidate_cities
ADD CONSTRAINT candidate_cities_profile_id_foreign FOREIGN KEY (profile_id)
REFERENCES candidate_profiles (id) ON DELETE CASCADE;

--
-- Создать таблицу `addresses`
--
CREATE TABLE addresses (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  model_type varchar(191) NOT NULL,
  model_id bigint(20) UNSIGNED NOT NULL,
  role varchar(191) NOT NULL DEFAULT 'main',
  postcode varchar(191) DEFAULT NULL,
  country_id bigint(20) UNSIGNED DEFAULT NULL,
  country varchar(191) DEFAULT NULL,
  region_id bigint(20) UNSIGNED DEFAULT NULL,
  region varchar(191) DEFAULT NULL,
  city_id bigint(20) UNSIGNED DEFAULT NULL,
  city varchar(191) DEFAULT NULL,
  street_address1 varchar(191) DEFAULT NULL,
  street_address2 varchar(191) DEFAULT NULL,
  lat decimal(10, 7) DEFAULT NULL,
  lng decimal(10, 7) DEFAULT NULL,
  first_name varchar(191) DEFAULT NULL,
  last_name varchar(191) DEFAULT NULL,
  phone varchar(191) DEFAULT NULL,
  email varchar(191) DEFAULT NULL,
  company varchar(191) DEFAULT NULL,
  inn varchar(191) DEFAULT NULL,
  eu_vat_id varchar(191) DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 11,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `addresses_model_id_model_type_role_unique` для объекта типа таблица `addresses`
--
ALTER TABLE addresses
ADD UNIQUE INDEX addresses_model_id_model_type_role_unique (model_id, model_type, role);

--
-- Создать индекс `addresses_model_type_model_id_index` для объекта типа таблица `addresses`
--
ALTER TABLE addresses
ADD INDEX addresses_model_type_model_id_index (model_type, model_id);

--
-- Создать внешний ключ
--
ALTER TABLE addresses
ADD CONSTRAINT addresses_city_id_foreign FOREIGN KEY (city_id)
REFERENCES cities (id) ON DELETE SET NULL;

--
-- Создать внешний ключ
--
ALTER TABLE addresses
ADD CONSTRAINT addresses_country_id_foreign FOREIGN KEY (country_id)
REFERENCES countries (id) ON DELETE SET NULL;

--
-- Создать внешний ключ
--
ALTER TABLE addresses
ADD CONSTRAINT addresses_region_id_foreign FOREIGN KEY (region_id)
REFERENCES regions (id) ON DELETE SET NULL;

--
-- Создать таблицу `roles`
--
CREATE TABLE roles (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  type enum ('admin', 'support', 'candidate', 'recruiter') NOT NULL,
  name varchar(191) NOT NULL,
  guard_name varchar(191) NOT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 5,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `model_has_roles`
--
CREATE TABLE model_has_roles (
  role_id bigint(20) UNSIGNED NOT NULL,
  model_type varchar(191) NOT NULL,
  model_id bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (role_id, model_id, model_type)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 630,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `model_has_roles_model_id_model_type_index` для объекта типа таблица `model_has_roles`
--
ALTER TABLE model_has_roles
ADD INDEX model_has_roles_model_id_model_type_index (model_id, model_type);

--
-- Создать внешний ключ
--
ALTER TABLE model_has_roles
ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id)
REFERENCES roles (id) ON DELETE CASCADE;

--
-- Создать таблицу `permissions`
--
CREATE TABLE permissions (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  type enum ('admin', 'candidate', 'recruiter') NOT NULL,
  guard_name varchar(191) NOT NULL,
  name varchar(191) NOT NULL,
  description varchar(191) DEFAULT NULL,
  parent_id bigint(20) UNSIGNED DEFAULT NULL,
  sort tinyint(4) NOT NULL DEFAULT 1,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 8,
AVG_ROW_LENGTH = 2340,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE permissions
ADD CONSTRAINT permissions_parent_id_foreign FOREIGN KEY (parent_id)
REFERENCES permissions (id) ON DELETE CASCADE;

--
-- Создать таблицу `role_has_permissions`
--
CREATE TABLE role_has_permissions (
  permission_id bigint(20) UNSIGNED NOT NULL,
  role_id bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (permission_id, role_id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE role_has_permissions
ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id)
REFERENCES permissions (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE role_has_permissions
ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id)
REFERENCES roles (id) ON DELETE CASCADE;

--
-- Создать таблицу `model_has_permissions`
--
CREATE TABLE model_has_permissions (
  permission_id bigint(20) UNSIGNED NOT NULL,
  model_type varchar(191) NOT NULL,
  model_id bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (permission_id, model_id, model_type)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `model_has_permissions_model_id_model_type_index` для объекта типа таблица `model_has_permissions`
--
ALTER TABLE model_has_permissions
ADD INDEX model_has_permissions_model_id_model_type_index (model_id, model_type);

--
-- Создать внешний ключ
--
ALTER TABLE model_has_permissions
ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id)
REFERENCES permissions (id) ON DELETE CASCADE;

--
-- Создать таблицу `menus`
--
CREATE TABLE menus (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  title varchar(191) NOT NULL,
  slug varchar(191) NOT NULL,
  description varchar(191) DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 4,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `menu_items`
--
CREATE TABLE menu_items (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  menu_id bigint(20) UNSIGNED NOT NULL,
  parent_id bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  title text NOT NULL,
  slug varchar(191) NOT NULL,
  side tinyint(4) NOT NULL DEFAULT 0,
  position int(11) NOT NULL DEFAULT 0,
  active tinyint(1) NOT NULL DEFAULT 1,
  button tinyint(1) NOT NULL DEFAULT 0,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 13,
AVG_ROW_LENGTH = 1365,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE menu_items
ADD CONSTRAINT menu_items_menu_id_foreign FOREIGN KEY (menu_id)
REFERENCES menus (id) ON DELETE CASCADE;

--
-- Создать таблицу `skills`
--
CREATE TABLE skills (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  title_ru varchar(191) NOT NULL,
  title_en varchar(191) NOT NULL,
  slug varchar(191) NOT NULL,
  popular tinyint(1) NOT NULL DEFAULT 0,
  is_custom tinyint(1) NOT NULL DEFAULT 0,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 123,
AVG_ROW_LENGTH = 546,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `vacancy_skills`
--
CREATE TABLE vacancy_skills (
  vacancy_id bigint(20) UNSIGNED NOT NULL,
  skill_id bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (vacancy_id, skill_id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 1820,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE vacancy_skills
ADD CONSTRAINT vacancy_skills_skill_id_foreign FOREIGN KEY (skill_id)
REFERENCES skills (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE vacancy_skills
ADD CONSTRAINT vacancy_skills_vacancy_id_foreign FOREIGN KEY (vacancy_id)
REFERENCES vacancies (id) ON DELETE CASCADE;

--
-- Создать таблицу `specializations_skills`
--
CREATE TABLE specializations_skills (
  specialization_id bigint(20) UNSIGNED NOT NULL,
  skill_id bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (specialization_id, skill_id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 117,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE specializations_skills
ADD CONSTRAINT specializations_skills_skill_id_foreign FOREIGN KEY (skill_id)
REFERENCES skills (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE specializations_skills
ADD CONSTRAINT specializations_skills_specialization_id_foreign FOREIGN KEY (specialization_id)
REFERENCES specializations (id) ON DELETE CASCADE;

--
-- Создать таблицу `candidate_skills`
--
CREATE TABLE candidate_skills (
  profile_id bigint(20) UNSIGNED NOT NULL,
  skill_id bigint(20) UNSIGNED NOT NULL,
  main tinyint(1) NOT NULL DEFAULT 0,
  position int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (profile_id, skill_id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 528,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE candidate_skills
ADD CONSTRAINT candidate_skills_profile_id_foreign FOREIGN KEY (profile_id)
REFERENCES candidate_profiles (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE candidate_skills
ADD CONSTRAINT candidate_skills_skill_id_foreign FOREIGN KEY (skill_id)
REFERENCES skills (id) ON DELETE CASCADE;

--
-- Создать таблицу `employment_types`
--
CREATE TABLE employment_types (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  title_ru varchar(191) NOT NULL,
  title_en varchar(191) NOT NULL,
  description_ru varchar(191) NOT NULL,
  description_en varchar(191) NOT NULL,
  slug varchar(191) NOT NULL,
  freelance tinyint(1) NOT NULL DEFAULT 0,
  remotely tinyint(1) NOT NULL DEFAULT 0,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `vacancy_employment_types`
--
CREATE TABLE vacancy_employment_types (
  vacancy_id bigint(20) UNSIGNED NOT NULL,
  employment_type_id bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (vacancy_id, employment_type_id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE vacancy_employment_types
ADD CONSTRAINT vacancy_employment_types_employment_type_id_foreign FOREIGN KEY (employment_type_id)
REFERENCES employment_types (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE vacancy_employment_types
ADD CONSTRAINT vacancy_employment_types_vacancy_id_foreign FOREIGN KEY (vacancy_id)
REFERENCES vacancies (id) ON DELETE CASCADE;

--
-- Создать таблицу `candidate_employment_types`
--
CREATE TABLE candidate_employment_types (
  profile_id bigint(20) UNSIGNED NOT NULL,
  employment_type_id bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (profile_id, employment_type_id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 1024,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать внешний ключ
--
ALTER TABLE candidate_employment_types
ADD CONSTRAINT candidate_employment_types_employment_type_id_foreign FOREIGN KEY (employment_type_id)
REFERENCES employment_types (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE candidate_employment_types
ADD CONSTRAINT candidate_employment_types_profile_id_foreign FOREIGN KEY (profile_id)
REFERENCES candidate_profiles (id) ON DELETE CASCADE;

--
-- Создать таблицу `websockets_statistics_entries`
--
CREATE TABLE websockets_statistics_entries (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  app_id varchar(191) NOT NULL,
  peak_connection_count int(11) NOT NULL,
  websocket_message_count int(11) NOT NULL,
  api_message_count int(11) NOT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `site_options`
--
CREATE TABLE site_options (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) NOT NULL,
  title varchar(191) NOT NULL,
  value text NOT NULL,
  type varchar(191) NOT NULL,
  `primary` tinyint(1) NOT NULL DEFAULT 0,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 47,
AVG_ROW_LENGTH = 1092,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `salaries`
--
CREATE TABLE salaries (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  sum_rub int(11) NOT NULL DEFAULT 0,
  sum_usd int(11) NOT NULL DEFAULT 0,
  sum_eur int(11) NOT NULL DEFAULT 0,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 6,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `push_subscriptions`
--
CREATE TABLE push_subscriptions (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  subscribable_type varchar(191) NOT NULL,
  subscribable_id bigint(20) UNSIGNED NOT NULL,
  endpoint varchar(500) NOT NULL,
  public_key varchar(191) DEFAULT NULL,
  auth_token varchar(191) DEFAULT NULL,
  content_encoding varchar(191) DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 71,
AVG_ROW_LENGTH = 712,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `push_subscriptions_endpoint_unique` для объекта типа таблица `push_subscriptions`
--
ALTER TABLE push_subscriptions
ADD UNIQUE INDEX push_subscriptions_endpoint_unique (endpoint);

--
-- Создать индекс `push_subscriptions_subscribable_type_subscribable_id_index` для объекта типа таблица `push_subscriptions`
--
ALTER TABLE push_subscriptions
ADD INDEX push_subscriptions_subscribable_type_subscribable_id_index (subscribable_type, subscribable_id);

--
-- Создать таблицу `personal_access_tokens`
--
CREATE TABLE personal_access_tokens (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  tokenable_type varchar(191) NOT NULL,
  tokenable_id bigint(20) UNSIGNED NOT NULL,
  name varchar(191) NOT NULL,
  token varchar(64) NOT NULL,
  abilities text DEFAULT NULL,
  last_used_at timestamp NULL DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `personal_access_tokens_token_unique` для объекта типа таблица `personal_access_tokens`
--
ALTER TABLE personal_access_tokens
ADD UNIQUE INDEX personal_access_tokens_token_unique (token);

--
-- Создать индекс `personal_access_tokens_tokenable_type_tokenable_id_index` для объекта типа таблица `personal_access_tokens`
--
ALTER TABLE personal_access_tokens
ADD INDEX personal_access_tokens_tokenable_type_tokenable_id_index (tokenable_type, tokenable_id);

--
-- Создать таблицу `password_resets`
--
CREATE TABLE password_resets (
  email varchar(191) NOT NULL,
  token varchar(191) NOT NULL,
  created_at timestamp NULL DEFAULT NULL
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `password_resets_email_index` для объекта типа таблица `password_resets`
--
ALTER TABLE password_resets
ADD INDEX password_resets_email_index (email);

--
-- Создать таблицу `password_histories`
--
CREATE TABLE password_histories (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  model_type varchar(191) NOT NULL,
  model_id bigint(20) UNSIGNED NOT NULL,
  password varchar(191) NOT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `partners`
--
CREATE TABLE partners (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  title_ru varchar(191) NOT NULL,
  title_en varchar(191) NOT NULL,
  description_ru text NOT NULL,
  description_en text NOT NULL,
  logo varchar(191) NOT NULL,
  slug varchar(191) NOT NULL,
  active tinyint(1) NOT NULL DEFAULT 1,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 37,
AVG_ROW_LENGTH = 455,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `pages`
--
CREATE TABLE pages (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  title text NOT NULL,
  seo_h1 text DEFAULT NULL,
  seo_title text DEFAULT NULL,
  seo_description text DEFAULT NULL,
  seo_keywords text DEFAULT NULL,
  text longtext DEFAULT NULL,
  slug varchar(191) NOT NULL,
  published tinyint(1) NOT NULL DEFAULT 1,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 10,
AVG_ROW_LENGTH = 4681,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `notification_logs`
--
CREATE TABLE notification_logs (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  type varchar(191) DEFAULT NULL,
  notifiable_type varchar(191) NOT NULL,
  notifiable_id bigint(20) UNSIGNED NOT NULL,
  last_id bigint(20) UNSIGNED DEFAULT NULL,
  data longtext DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 4,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `notification_logs_notifiable_type_notifiable_id_index` для объекта типа таблица `notification_logs`
--
ALTER TABLE notification_logs
ADD INDEX notification_logs_notifiable_type_notifiable_id_index (notifiable_type, notifiable_id);

--
-- Создать таблицу `migrations`
--
CREATE TABLE migrations (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  migration varchar(191) NOT NULL,
  batch int(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 247,
AVG_ROW_LENGTH = 341,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `media`
--
CREATE TABLE media (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  model_type varchar(191) NOT NULL,
  model_id bigint(20) UNSIGNED NOT NULL,
  collection_name varchar(191) NOT NULL,
  name varchar(191) NOT NULL,
  file_name varchar(191) NOT NULL,
  mime_type varchar(191) DEFAULT NULL,
  disk varchar(191) NOT NULL,
  size bigint(20) UNSIGNED NOT NULL,
  manipulations json NOT NULL,
  custom_properties json NOT NULL,
  responsive_images json NOT NULL,
  order_column int(10) UNSIGNED DEFAULT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `media_model_type_model_id_index` для объекта типа таблица `media`
--
ALTER TABLE media
ADD INDEX media_model_type_model_id_index (model_type, model_id);

--
-- Создать таблицу `language_lines`
--
CREATE TABLE language_lines (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `group` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  text text NOT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 858,
AVG_ROW_LENGTH = 179,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `language_lines_group_index` для объекта типа таблица `language_lines`
--
ALTER TABLE language_lines
ADD INDEX language_lines_group_index (`group`);

--
-- Создать таблицу `jobs`
--
CREATE TABLE jobs (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  queue varchar(191) NOT NULL,
  payload longtext NOT NULL,
  attempts tinyint(3) UNSIGNED NOT NULL,
  reserved_at int(10) UNSIGNED DEFAULT NULL,
  available_at int(10) UNSIGNED NOT NULL,
  created_at int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `jobs_queue_index` для объекта типа таблица `jobs`
--
ALTER TABLE jobs
ADD INDEX jobs_queue_index (queue);

--
-- Создать таблицу `html_blocks`
--
CREATE TABLE html_blocks (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  admin_title varchar(191) NOT NULL,
  title_ru varchar(191) DEFAULT NULL,
  title_en varchar(191) DEFAULT NULL,
  description_ru text DEFAULT NULL,
  description_en text DEFAULT NULL,
  image varchar(191) DEFAULT NULL,
  slug varchar(191) NOT NULL,
  section varchar(191) NOT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 15,
AVG_ROW_LENGTH = 1365,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `failed_jobs`
--
CREATE TABLE failed_jobs (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  uuid varchar(191) NOT NULL,
  `connection` text NOT NULL,
  queue text NOT NULL,
  payload longtext NOT NULL,
  exception longtext NOT NULL,
  failed_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать индекс `failed_jobs_uuid_unique` для объекта типа таблица `failed_jobs`
--
ALTER TABLE failed_jobs
ADD UNIQUE INDEX failed_jobs_uuid_unique (uuid);

--
-- Создать таблицу `experiences`
--
CREATE TABLE experiences (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  title_ru varchar(191) NOT NULL,
  title_en varchar(191) NOT NULL,
  slug varchar(191) NOT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 7,
AVG_ROW_LENGTH = 2730,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `english_levels`
--
CREATE TABLE english_levels (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  title varchar(191) NOT NULL,
  description_ru text NOT NULL,
  description_en text NOT NULL,
  slug varchar(191) NOT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 7,
AVG_ROW_LENGTH = 2730,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

--
-- Создать таблицу `currencies`
--
CREATE TABLE currencies (
  id bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  title_ru varchar(191) NOT NULL,
  title_en varchar(191) NOT NULL,
  description_ru varchar(191) NOT NULL,
  description_en varchar(191) NOT NULL,
  symbol varchar(191) NOT NULL,
  iso varchar(191) NOT NULL,
  course double(8, 6) NOT NULL DEFAULT 0.000000,
  slug varchar(191) NOT NULL,
  created_at timestamp NULL DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 4,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_unicode_ci;

-- 
-- Вывод данных для таблицы payment_methods
--
INSERT INTO payment_methods VALUES
(1, 'Visa/MasterCard', 'Visa/MasterCard', 'card', 1, NULL, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(2, 'SWIFT', 'SWIFT', 'swift', 1, NULL, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(3, 'Счет на оплату (Россия)', 'Invoice for payment (Russia)', 'invoice', 1, NULL, '2021-08-31 14:14:53', '2021-08-31 14:14:53');

-- 
-- Вывод данных для таблицы users
--
INSERT INTO users VALUES
(1, 'admin', 'administrator', 'admin@admin.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Super', 'Admin', NULL, NULL, NULL, NULL, '2021-08-31 14:14:34', '$2y$10$TBWAOovTr/05oLFgN6dKdulGkwuSRXNUEKN2jRnOdcICPLJYURiia', NULL, NULL, 1, 1, 1, 0, '2022-02-23 16:07:07', '2021-10-26 16:48:09', '127.0.0.1', 'America/New_York', 0, NULL, NULL, 'BwfyStZtQX29LcFfAHiNhs9PPIcxKB7n1UU2bZyIn3LGzKagPZs4hZ7RhAwk', '2021-08-31 14:14:34', '2021-10-26 16:48:09', NULL),
(2, 'support', 'support', 'support@jobzz.ru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Jobzz', 'Support', NULL, NULL, NULL, NULL, '2021-08-31 14:14:34', '$2y$10$ixdg1htgjRB75mx6xM87N.C3.ri5oHeqiJcJSCmahNZ2S2AvajOM2', NULL, NULL, 1, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2021-08-31 14:14:34', '2021-08-31 14:14:34', NULL),
(3, 'candidate', NULL, 'bogdan.kotov@example.org', '(812) 643-48-97', NULL, NULL, NULL, NULL, NULL, NULL, 'Зинаида', 'Евдокимова', 'iOS/macOS Developer', 'female', NULL, NULL, '2021-08-31 14:14:54', '$2y$10$YvccLsbuFu9l6tDwBU9aVuzbu3nJgf5BJnQWt.fd6gKKQsYHR8hUu', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'y5IwuXpclC', '2021-08-25 14:14:57', '2021-08-25 14:14:57', NULL),
(4, 'candidate', NULL, 'malvina66@example.org', '+7 (922) 937-4955', NULL, NULL, NULL, NULL, NULL, NULL, 'Гарри', 'Самсонов', 'Marketing Manager', 'male', NULL, NULL, '2021-08-31 14:14:54', '$2y$10$OlsEJZxdAEvhUvCsVctsLu7OBcfJWpMa2UMCTVTCPXUdAXUPfchIy', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'WxQcs3RMda', '2021-08-21 14:14:57', '2021-08-21 14:14:57', NULL),
(5, 'candidate', NULL, 'konstantin.antonova@example.com', '+7 (922) 385-9656', NULL, NULL, NULL, NULL, NULL, NULL, 'Ирина', 'Дмитриева', 'UE/Unity/etc Manager', 'female', NULL, NULL, '2021-08-31 14:14:54', '$2y$10$KA4iHnG5KkquJUa7rn1YW.mjYygb7tg7BN6.KEg0FqtHjT6k3Glsm', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'mF9Ck5ylYj', '2021-08-21 14:14:57', '2021-08-21 14:14:57', NULL),
(6, 'candidate', NULL, 'vasilisa.nikonova@example.org', '8-800-532-3957', NULL, NULL, NULL, NULL, NULL, NULL, 'Лилия', 'Лаврентьева', 'Sales Manager', 'female', NULL, NULL, '2021-08-31 14:14:54', '$2y$10$qosQvJHnNiK21bIsLCePqODQmrchj0s4TdXKWBFv1Qnd//dcQhvoy', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Wmw5glT3d7', '2021-08-28 14:14:57', '2021-08-28 14:14:57', NULL),
(7, 'candidate', NULL, 'platon.mihajlova@example.net', '(35222) 93-9071', NULL, NULL, NULL, NULL, NULL, NULL, 'Ефим', 'Блохин', 'SEO Manager', 'male', NULL, NULL, '2021-08-31 14:14:54', '$2y$10$clvI06V3jCF4zLroOVhVV.ZehdDevc8W30bL3zbzrxYdxVAcK2kJK', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'y3ECg1QHPU', '2021-08-24 14:14:57', '2021-08-24 14:14:57', NULL),
(8, 'candidate', NULL, 'nika89@example.com', '(495) 126-0565', NULL, NULL, NULL, NULL, NULL, NULL, 'Лилия', 'Осипова', 'Marketing Manager', 'female', NULL, NULL, '2021-08-31 14:14:54', '$2y$10$K60dwaM4p/1R4Yer7NPLcuJB20SLWE7Y48s69Hpna70d1jhFGRPWO', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'aYxgRYoH6O', '2021-08-25 14:14:57', '2021-08-25 14:14:57', NULL),
(9, 'candidate', NULL, 'dorofeev.sava@example.net', '+7 (922) 908-7064', NULL, NULL, NULL, NULL, NULL, NULL, 'Изабелла', 'Котова', 'Sales Manager', 'female', NULL, NULL, '2021-08-31 14:14:54', '$2y$10$umr7CI60Tq6VJetkF1a2c.dwFfPsqsBkqQczxdC2Te3u6GaUWjFLe', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'CMR8Vd6pGm', '2021-08-24 14:14:57', '2021-08-24 14:14:57', NULL),
(10, 'candidate', NULL, 'egor.dementev@example.com', '+7 (922) 432-3316', NULL, NULL, NULL, NULL, NULL, NULL, 'Ирина', 'Назарова', 'Product Manager Manager', 'female', NULL, NULL, '2021-08-31 14:14:54', '$2y$10$MpoLYvIsw1QSYwgBKNs/9uAtMnxDzstcZ.6S35l25Smw9Y65J3tp.', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'juxUEOoFRT', '2021-08-23 14:14:57', '2021-08-23 14:14:57', NULL),
(11, 'candidate', NULL, 'tbobrov@example.com', '(35222) 18-2732', NULL, NULL, NULL, NULL, NULL, NULL, 'Анастасия', 'Данилова', 'DevOps/Sysadmin Manager', 'female', NULL, NULL, '2021-08-31 14:14:54', '$2y$10$pPeGr.QCbUN0CfqyUbRkrOhMYF6Ini3ClKBu7mAJVy2o0EEvT..16', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'lvqIql6Co4', '2021-08-30 14:14:58', '2021-08-30 14:14:58', NULL),
(12, 'candidate', NULL, 'hkonovalov@example.com', '8-800-277-0529', NULL, NULL, NULL, NULL, NULL, NULL, 'Юрий', 'Силин', 'UE/Unity/etc Manager', 'male', NULL, NULL, '2021-08-31 14:14:54', '$2y$10$mRovKSO4zZNWK5skkOPM3.8aIlup8d2g7tAFchUIo75c2I3O5hR4e', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'x1LwEGrLm4', '2021-08-30 14:14:58', '2021-08-30 14:14:58', NULL),
(13, 'candidate', NULL, 'muhin.stanislav@example.com', '(812) 756-34-06', NULL, NULL, NULL, NULL, NULL, NULL, 'Зинаида', 'Селезнёва', 'UI/UX/Design Manager', 'female', NULL, NULL, '2021-08-31 14:14:54', '$2y$10$nRyljzupgeUNQKZwBjhmVefLau2gGlGT9hIWn24PHvGmK0qzYRln2', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'LioxuovtPw', '2021-08-30 14:14:58', '2021-08-30 14:14:58', NULL),
(14, 'candidate', NULL, 'subina.nelli@example.net', '8-800-578-2350', NULL, NULL, NULL, NULL, NULL, NULL, 'Валерия', 'Капустина', 'UI/UX/Design Manager', 'female', NULL, NULL, '2021-08-31 14:14:54', '$2y$10$97wrfWnUUQMwjyUcJHsjG.CxreQvt6j2vlADAFOrCW3pLkbfz2E.2', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, '1ZHZBofqdP', '2021-08-24 14:14:58', '2021-08-24 14:14:58', NULL),
(15, 'candidate', NULL, 'dobryna14@example.org', '+7 (922) 762-2136', NULL, NULL, NULL, NULL, NULL, NULL, 'Глеб', 'Герасимов', 'UI/UX/Design Manager', 'male', NULL, NULL, '2021-08-31 14:14:54', '$2y$10$I6zJS1tSWMwNr4qdrnY.4.l5OvZLHBrnUluEVJd/KJjZztBfgu.sO', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'zsWuL7Ui9H', '2021-08-28 14:14:58', '2021-08-28 14:14:58', NULL),
(16, 'candidate', NULL, 'bsarapov@example.org', '+7 (922) 489-3707', NULL, NULL, NULL, NULL, NULL, NULL, 'Данила', 'Нестеров', 'Other Manager', 'male', NULL, NULL, '2021-08-31 14:14:54', '$2y$10$QaQJ8/XgYM/6XfLl6BYbpuY3MzonlT5IATir4eg5Q6Fo9vfeaRe26', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'azRyiPOLg2', '2021-08-27 14:14:58', '2021-08-27 14:14:58', NULL),
(17, 'candidate', NULL, 'grigoreva.regina@example.com', '(495) 817-4198', NULL, NULL, NULL, NULL, NULL, NULL, 'Макар', 'Тетерин', 'Other Developer', 'male', NULL, NULL, '2021-08-31 14:14:55', '$2y$10$89RVBqxC.W9.8AMqcTgMlO5ppFAGKEfeHZZliw0ojgOer9LwelMhK', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'XMuV4DOjbC', '2021-08-31 14:14:58', '2021-08-31 14:14:58', NULL),
(18, 'candidate', NULL, 'deleted_18@jobzz.ru', '8-800-046-4815', NULL, NULL, NULL, NULL, NULL, NULL, 'User', 'Deleted', 'DBA/SQL/PL/SQL Manager', 'male', NULL, NULL, '2021-08-31 14:14:55', '$2y$10$aHR/826NdHeQV3co5NOBnuzyQ7wHivIcsYnaU8s2ECJ.9z6mqj73e', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'UiJoDLDTmX', '2021-08-30 14:14:58', '2021-10-07 09:14:40', '2021-10-07 09:14:40'),
(19, 'candidate', NULL, 'gennadij56@example.org', '8-800-940-9211', NULL, NULL, NULL, NULL, NULL, NULL, 'Антонин', 'Суханов', 'HR/Recruiter Manager', 'male', NULL, NULL, '2021-08-31 14:14:55', '$2y$10$AbnLQ5TRTPf1FV56NOXxlu8CIlk6NzcDGPoXCY65fpCVz.SyfD11e', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Gtwv1tS2OI', '2021-08-30 14:14:58', '2021-08-30 14:14:58', NULL),
(20, 'candidate', NULL, 'dina48@example.net', '+7 (922) 478-6175', NULL, NULL, NULL, NULL, NULL, NULL, 'Яна', 'Семёнова', 'UE/Unity/etc Manager', 'female', NULL, NULL, '2021-08-31 14:14:55', '$2y$10$qP8Rq8K1rHmRuWC7UEIpOuyLoKmDj62AeJ87nx7Dzd/qFTHVQoYUe', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'O78wQjI6qT', '2021-08-27 14:14:58', '2021-08-27 14:14:58', NULL),
(21, 'candidate', NULL, 'lapina.rodion@example.net', '(495) 340-0858', NULL, NULL, NULL, NULL, NULL, NULL, 'Зинаида', 'Орлова', 'Marketing Manager', 'female', NULL, NULL, '2021-08-31 14:14:55', '$2y$10$pjFQcpNgDHsbRWWU/2Mjbep/k7XFwfT3wIPCwTpNVxf1fD1uzT4Gu', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ksXFuEeckv', '2021-08-27 14:14:58', '2021-08-27 14:14:58', NULL),
(22, 'candidate', NULL, 'roman38@example.net', '+7 (922) 673-8467', NULL, NULL, NULL, NULL, NULL, NULL, 'Болеслав', 'Карпов', 'Scala Developer', 'male', NULL, NULL, '2021-08-31 14:14:55', '$2y$10$NOKCqJH5TAXlX2rhMOBKg.DLjhMCGFtBX8z5UrptKCfNC34nJBtzy', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, '6FjXXmM2Nm', '2021-08-24 14:14:58', '2021-08-24 14:14:58', NULL),
(23, 'candidate', NULL, 'kononova.ignatij@example.com', '(495) 055-0672', NULL, NULL, NULL, NULL, NULL, NULL, 'Виталий', 'Зимин', 'Full Stack Developer', 'male', NULL, NULL, '2021-08-31 14:14:55', '$2y$10$7hnKs7UeI2CmPc4cubt31uYFDqQcsNO1Sn6wE7RKWsjrYpTCpMWe2', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'PznjI88Zbd', '2021-08-29 14:14:58', '2021-08-29 14:14:58', NULL),
(24, 'candidate', NULL, 'eliseeva.adrian@example.org', '8-800-446-8681', NULL, NULL, NULL, NULL, NULL, NULL, 'Витольд', 'Макаров', 'C#/.Net Developer', 'male', NULL, NULL, '2021-08-31 14:14:55', '$2y$10$s7x4/axMJFwk3ZEOwHH14uuw6ae2UGV6JItfmDshsOplkJQrQfUf2', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'RjTAGpR2Zg', '2021-08-26 14:14:58', '2021-08-26 14:14:58', NULL),
(25, 'candidate', NULL, 'oksana.ersova@example.com', '(35222) 73-1898', NULL, NULL, NULL, NULL, NULL, NULL, 'Фаина', 'Королёва', 'C/C++/Embedded Developer', 'female', NULL, NULL, '2021-08-31 14:14:55', '$2y$10$O7bgXHPAdQCDyTd2BEyVhOTqcI9KPm5GDn/M77TgdLBn32VYlpfpO', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2wsT6YMwc7', '2021-08-25 14:14:58', '2021-08-25 14:14:58', NULL),
(26, 'candidate', NULL, 'pahomova.elizaveta@example.com', '(495) 637-7034', NULL, NULL, NULL, NULL, NULL, NULL, 'Адам', 'Вишняков', 'QA Manager', 'male', NULL, NULL, '2021-08-31 14:14:55', '$2y$10$lcaZUHAt3LhFL5Vol4wsLu9nJxFU8peb5kuKYpB.koD2KyJps2cdG', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'yuPmtkao97', '2021-08-26 14:14:59', '2021-08-26 14:14:59', NULL),
(27, 'candidate', NULL, 'anastasia.silova@example.net', '(495) 878-8241', NULL, NULL, NULL, NULL, NULL, NULL, 'Рафаил', 'Фадеев', 'Java Developer', 'male', NULL, NULL, '2021-08-31 14:14:55', '$2y$10$B9pkQnH0jHU8SYJLneMKnup.Zgt.tMOTktSSoKbVPYvVuhz7RNtfi', NULL, NULL, 0, 1, 2, 0, '2021-08-31 14:20:48', NULL, NULL, NULL, 0, NULL, NULL, 'AkLSjcKLI6', '2021-08-24 14:14:59', '2022-01-27 15:12:41', NULL),
(28, 'candidate', NULL, 'kgusev@example.com', '8-800-406-1110', NULL, NULL, NULL, NULL, NULL, NULL, 'Эрик', 'Большаков', 'UE/Unity/etc Manager', 'male', NULL, NULL, '2021-08-31 14:14:55', '$2y$10$OUq3Jc1KY7rzNv.pr3XvQeD5els.OvqZqmxWifT8K1mI4R5TeJ5Je', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 's24dUotU4K', '2021-08-21 14:14:59', '2021-08-21 14:14:59', NULL),
(29, 'candidate', NULL, 'ggordeev@example.com', '(35222) 23-8794', NULL, NULL, NULL, NULL, NULL, NULL, 'Инга', 'Орехова', 'DevOps/Sysadmin Manager', 'female', NULL, NULL, '2021-08-31 14:14:55', '$2y$10$yJS4P8Lqc8iz8ZyYr6mxZ.a92ReT4s7K4W0lxUpdk76Sq3tpHhxYa', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, '5bgeYs0sSn', '2021-08-22 14:14:59', '2021-08-22 14:14:59', NULL),
(30, 'candidate', NULL, 'mkalasnikov@example.net', '8-800-367-5552', NULL, NULL, NULL, NULL, NULL, NULL, 'Афанасий', 'Якушев', 'Front End Developer', 'male', NULL, NULL, '2021-08-31 14:14:55', '$2y$10$b54EZjU8zkE1BUNl2CABZep7IIe4uJc5CKsfj/9TgLvbe29BXru6.', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, '5UFCjEmCz2', '2021-08-29 14:14:59', '2021-08-29 14:14:59', NULL),
(31, 'candidate', NULL, 'renata37@example.net', '(812) 483-25-01', NULL, NULL, NULL, NULL, NULL, NULL, 'Оксана', 'Суханова', 'iOS/macOS Developer', 'female', NULL, NULL, '2021-08-31 14:14:55', '$2y$10$XQuNqXLm0O5Ugb1m1zRB7Ok7vEgAn54oLQouz8HUkwM4dFI66/waO', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Vj7G83OiRa', '2021-08-21 14:14:59', '2021-08-21 14:14:59', NULL),
(32, 'candidate', NULL, 'dina07@example.net', '(495) 642-5231', NULL, NULL, NULL, NULL, NULL, NULL, 'Валерия', 'Герасимова', 'Ruby/RoR Developer', 'female', NULL, NULL, '2021-08-31 14:14:55', '$2y$10$6a6q4I1579vFm9DvR0ZDDugnSoijYL/5UlqErDSThB3TNC.2.7S7K', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, '51VTevCSSj', '2021-08-31 14:14:59', '2021-08-31 14:14:59', NULL),
(33, 'candidate', NULL, 'urij96@example.net', '8-800-256-4782', NULL, NULL, NULL, NULL, NULL, NULL, 'Маргарита', 'Попова', 'Node.js Developer', 'female', NULL, NULL, '2021-08-31 14:14:56', '$2y$10$gWDSILAV7lvezXGah9Psf.507wxjkqT5c8xcrKMqb5n40RjnnVbUC', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'BRykpNI7YV', '2021-08-26 14:14:59', '2021-08-26 14:14:59', NULL),
(34, 'candidate', NULL, 'milan32@example.org', '(35222) 27-9414', NULL, NULL, NULL, NULL, NULL, NULL, 'Юлия', 'Максимова', 'Golang Developer', 'female', NULL, NULL, '2021-08-31 14:14:56', '$2y$10$KbHJbqtK4WQnRGvRnAFHjO5nAObwnU23lQglPlSzvk0N/IXS5b49W', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2bax8cAfZJ', '2021-08-26 14:14:59', '2021-08-26 14:14:59', NULL),
(35, 'candidate', NULL, 'slobanov@example.com', '8-800-502-0638', NULL, NULL, NULL, NULL, NULL, NULL, 'София', 'Тихонова', 'Project Manager Manager', 'female', NULL, NULL, '2021-08-31 14:14:56', '$2y$10$orKWPL2VIIHSnvTU9bNdhua28v8MR.mb1in9MpDIDCqiO45zY0Gze', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'yS0a6dAW37', '2021-08-31 14:14:59', '2021-08-31 14:14:59', NULL),
(36, 'candidate', NULL, 'astrelkov@example.org', '(812) 075-89-66', NULL, NULL, NULL, NULL, NULL, NULL, 'Оксана', 'Игнатьева', 'Data Science Manager', 'female', NULL, NULL, '2021-08-31 14:14:56', '$2y$10$IgllbHo12Y1nGUbs6IXHguCLz5kixykrA6kr85MbNnpg7rIJPLyx6', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'T0Q7q5y4PD', '2021-08-26 14:14:59', '2021-08-26 14:14:59', NULL),
(37, 'candidate', NULL, 'svetlana38@example.com', '(35222) 21-3484', NULL, NULL, NULL, NULL, NULL, NULL, 'Галина', 'Копылова', 'UE/Unity/etc Manager', 'female', NULL, NULL, '2021-08-31 14:14:56', '$2y$10$B6umhIu9mZCy2tsWsPQsgeUNPrfZitXf1tIBJtUth8E9rRupt59Fy', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'bGMXjNJSDY', '2021-08-23 14:14:59', '2021-08-23 14:14:59', NULL),
(38, 'candidate', NULL, 'dtihonov@example.com', '(812) 033-71-98', NULL, NULL, NULL, NULL, NULL, NULL, 'Нелли', 'Миронова', 'DevOps/Sysadmin Manager', 'female', NULL, NULL, '2021-08-31 14:14:56', '$2y$10$75IG95FeFK3cxxUuG1Jm2.w/m31L8mTlBhVkY0jwe8f.u8UO4EtTK', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'fwj7RxR4L6', '2021-08-29 14:14:59', '2021-08-29 14:14:59', NULL),
(39, 'candidate', NULL, 'anton.saskova@example.com', '(35222) 39-6809', NULL, NULL, NULL, NULL, NULL, NULL, 'Софья', 'Воронцова', 'Golang Developer', 'female', NULL, NULL, '2021-08-31 14:14:56', '$2y$10$P2e3qAFU7Kt6g8lUOWHEiuh6f2NciwGtGEkR85/ISSlDyOP6/pbV.', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'FuCVSgR98L', '2021-08-21 14:14:59', '2021-08-21 14:14:59', NULL),
(40, 'candidate', NULL, 'ulia54@example.org', '(495) 065-5209', NULL, NULL, NULL, NULL, NULL, NULL, 'Адриан', 'Иванов', 'HR/Recruiter Manager', 'male', NULL, NULL, '2021-08-31 14:14:56', '$2y$10$fj11tHZqWsX8g.COuoKF0e9ISSH0g8HKm0bnEFrqCET1hcTlHKXZ.', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, '5eW8phsQOR', '2021-08-24 14:14:59', '2021-08-24 14:14:59', NULL),
(41, 'candidate', NULL, 'mihail.andreev@example.net', '+7 (922) 898-9369', NULL, NULL, NULL, NULL, NULL, NULL, 'Клементина', 'Дьячкова', 'Other Manager', 'female', NULL, NULL, '2021-08-31 14:14:56', '$2y$10$e7dEx8kSRu4Vsmj7t/PkKO4o3QiS9t9fz0yEmuYIB0x6WcHXBE/eu', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'dMP8zR1rjR', '2021-08-28 14:14:59', '2021-08-28 14:14:59', NULL),
(42, 'candidate', NULL, 'arhipova.spartak@example.org', '+7 (922) 346-8250', NULL, NULL, NULL, NULL, NULL, NULL, 'Ирина', 'Голубева', 'Node.js Developer', 'female', NULL, NULL, '2021-08-31 14:14:56', '$2y$10$JpTK5Q29l4hf4zTecbTGA.7UB3LOU5fmmsi3HPFt5mtrN2ilWYQvC', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, '5y6bQUroPz', '2021-08-23 14:14:59', '2021-08-23 14:14:59', NULL),
(43, 'candidate', NULL, 'albina01@example.net', '+7 (922) 411-1608', NULL, NULL, NULL, NULL, NULL, NULL, 'Люся', 'Сазонова', 'Other Developer', 'female', NULL, NULL, '2021-08-31 14:14:56', '$2y$10$Rmd4eB0samP2QK0Cf5ZUNey40sTuUqwbh.k5aSK9FVQ3YRYHu3TEG', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, '86iJVLgNyJ', '2021-08-24 14:15:00', '2021-08-24 14:15:00', NULL),
(44, 'candidate', NULL, 'dominika.fedoseeva@example.net', '+7 (922) 909-8825', NULL, NULL, NULL, NULL, NULL, NULL, 'Ирина', 'Боброва', 'Sales Manager', 'female', NULL, NULL, '2021-08-31 14:14:56', '$2y$10$7q.QmiGflva7zNcoE64yluiA1xlOQlMeDPoVqmAWDHE4FESRqudfa', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, '0pKWDbrCAR', '2021-08-30 14:15:00', '2021-08-30 14:15:00', NULL),
(45, 'candidate', NULL, 'zsokolov@example.com', '(35222) 43-3521', NULL, NULL, NULL, NULL, NULL, NULL, 'Марина', 'Исаева', 'Other Developer', 'female', NULL, NULL, '2021-08-31 14:14:56', '$2y$10$rz15GV3cH6H8jAYmt7R4fuDqgGBlw/QGajwkyDKl0mkpPicmJQI5S', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'cVnVUQKYVq', '2021-08-23 14:15:00', '2021-08-23 14:15:00', NULL),
(46, 'candidate', NULL, 'fedor.serbakova@example.net', '(812) 663-68-31', NULL, NULL, NULL, NULL, NULL, NULL, 'Эльвира', 'Громова', 'Business Analyst Manager', 'female', NULL, NULL, '2021-08-31 14:14:56', '$2y$10$8T2kpfFaXPjKOLDziEJzVeG5cIuYF7VD/jpRaJGok3J0kqU8doq.u', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2G3uZLHnkf', '2021-08-26 14:15:00', '2021-08-26 14:15:00', NULL),
(47, 'candidate', NULL, 'rzaharov@example.net', '(495) 814-0474', NULL, NULL, NULL, NULL, NULL, NULL, 'Тамара', 'Гришина', 'QA Manager', 'female', NULL, NULL, '2021-08-31 14:14:56', '$2y$10$GwQbZvGanTp4Tr6w9fnhW.NPBMQ9VwypvRBiPAasAY/0ZL2gsxp1K', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'QBlnhwnfPF', '2021-08-21 14:15:00', '2021-08-21 14:15:00', NULL),
(48, 'candidate', NULL, 'ibelakov@example.com', '(812) 764-33-34', NULL, NULL, NULL, NULL, NULL, NULL, 'Зоя', 'Стрелкова', 'Support Manager', 'female', NULL, NULL, '2021-08-31 14:14:57', '$2y$10$Z4sHOeo9pQllNX8Bj5RkS.1S8cwQETZn8D1I9KDXtkwKQPDCtSOnm', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'dr9inf6DO7', '2021-08-23 14:15:00', '2021-08-23 14:15:00', NULL),
(49, 'candidate', NULL, 'nika86@example.org', '(495) 273-5561', NULL, NULL, NULL, NULL, NULL, NULL, 'Виктор', 'Ермаков', 'UI/UX/Design Manager', 'male', NULL, NULL, '2021-08-31 14:14:57', '$2y$10$U.1jW3EPg8Wag6sjNpLpAOgNBhxUnithqbAGPvXVASRSWL1.TfRIO', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, '4MglIxDvFv', '2021-08-29 14:15:00', '2021-08-29 14:15:00', NULL),
(50, 'candidate', NULL, 'nika88@example.com', '(495) 378-9879', NULL, NULL, NULL, NULL, NULL, NULL, 'Арсений', 'Костин', 'UE/Unity/etc Manager', 'male', NULL, NULL, '2021-08-31 14:14:57', '$2y$10$VMj4Z9PmRAzRHOAgIHPP.eajYJf4bEYJmbe13Y3m6RBRC0UlYl/tm', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, '9UTl19ePby', '2021-08-28 14:15:00', '2021-08-28 14:15:00', NULL),
(51, 'candidate', NULL, 'nikolaj.larionova@example.net', '+7 (922) 994-4601', NULL, NULL, NULL, NULL, NULL, NULL, 'Валерий', 'Гаврилов', 'C#/.Net Developer', 'male', NULL, NULL, '2021-08-31 14:14:57', '$2y$10$d6W02uGDbQXGwfjFayxwTOxPClyihXqUNYo1V7Z3jVv4aCi2ACfzm', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'ii1dNYPzKG', '2021-08-29 14:15:00', '2021-08-29 14:15:00', NULL),
(52, 'candidate', NULL, 'izabella47@example.org', '(495) 623-2934', NULL, NULL, NULL, NULL, NULL, NULL, 'Дмитрий', 'Кузьмин', 'Android Developer', 'male', NULL, NULL, '2021-08-31 14:14:57', '$2y$10$QCbj1f.Cht..KNfRpg1kW.xQHlIfuGcC/QlGy3MqgmkMfwcCbOIUG', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Vi0sgF0JXy', '2021-08-22 14:15:00', '2021-08-22 14:15:00', NULL),
(53, 'recruiter', NULL, 'deleted_53@jobzz.ru', '(495) 127-8065', NULL, NULL, NULL, NULL, NULL, NULL, 'User', 'Deleted', 'HR Manager', 'male', NULL, NULL, '2021-08-31 14:15:00', '$2y$10$.AIfUCDSxwJo6iowaZT//exEch9fJ/LWUfPBgYVEo3iMSKQkc5102', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'eHqmFsuOUh', '2021-08-31 14:15:01', '2021-10-07 09:33:36', '2021-10-07 09:33:36'),
(54, 'recruiter', NULL, 'pnovikov@example.net', '+7 (922) 893-4940', NULL, NULL, NULL, NULL, NULL, NULL, 'Изабелла', 'Осипова', 'Manager', 'female', NULL, NULL, '2021-08-31 14:15:00', '$2y$10$yXB4qJlQNGdJ5C/Q02Qqg.O1OHGwNkTp6zD1OT7dxaBz7JGXRwnmC', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'vSwOGRBq4t', '2021-08-31 14:15:01', '2021-08-31 14:15:01', NULL),
(55, 'recruiter', NULL, 'dina@example2.com', '+380978623299', NULL, '@vadox', NULL, 'https://www.linkedin.com/in/vadox/', NULL, NULL, 'Дина', 'Шубина', 'Director', 'female', NULL, 'userfiles/55/avatar/vr3Z92lUbKN1D9gD1SntTgUCqcy2p76lE4T2mM8M.jpg', '2021-10-21 08:54:38', '$2y$10$HXt4HjXbQlVjKLXUYJoKou8PdpuXpPUO8q8eX59r7HAHw1cnACyHu', NULL, NULL, 0, 1, 1, 2, '2021-10-25 13:54:06', '2021-10-21 08:34:55', '127.0.0.1', 'America/New_York', 0, NULL, NULL, 'ElQgAaf393YrkvCS9ZRce2QGLqVeYZQOdJugJDvjJOB0gYm0Mbr5FyX9guI0', '2021-08-31 14:15:01', '2021-10-21 08:54:38', NULL),
(56, 'recruiter', NULL, 'rnosov@example.net', '(812) 936-75-09', NULL, NULL, NULL, NULL, NULL, NULL, 'Олеся', 'Лебедева', 'Manager', 'female', NULL, NULL, '2021-08-31 14:15:00', '$2y$10$/wvZYi7uK7ouPVsy2tCJ2O1eZBNisw8P4JwRYdXF7DPu/G58qbG8O', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'aoCyxsVwZG', '2021-08-31 14:15:01', '2021-08-31 14:15:01', NULL),
(57, 'recruiter', NULL, 'nikonova.artemij@example.com', '(35222) 47-9679', NULL, NULL, NULL, NULL, NULL, NULL, 'Степан', 'Королёв', 'Manager', 'male', NULL, NULL, '2021-08-31 14:15:01', '$2y$10$3Ay/yWt3iY.4ckiR4YZfruZr8WxHJpcC2rds/m/DeFS9HansLPKYi', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Y7SMGcw30k', '2021-08-31 14:15:01', '2021-08-31 14:15:01', NULL),
(58, 'recruiter', NULL, 'vasilev.anatolij@example.net', '+7 (922) 730-9862', NULL, NULL, NULL, NULL, NULL, NULL, 'Лариса', 'Крюкова', 'HR Manager', 'female', NULL, NULL, '2021-08-31 14:15:01', '$2y$10$hM.tr.TSzZImXB/gB4leCeiJbErYY9Mx62zUKExU6EDW93cbGv7PC', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, '6NbDlyvY1E', '2021-08-31 14:15:01', '2021-08-31 14:15:01', NULL),
(59, 'recruiter', NULL, 'tkoselev@example.com', '+7 (922) 854-0801', NULL, NULL, NULL, NULL, NULL, NULL, 'Геннадий', 'Князев', 'Manager', 'male', NULL, NULL, '2021-08-31 14:15:01', '$2y$10$deorSIIeQJvz0emJVzmqZOo9wgx8WpGFhUpZCKy0dl3KAa3sQTOI2', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, '9Czoy5u5Uk', '2021-08-31 14:15:01', '2021-08-31 14:15:01', NULL),
(60, 'recruiter', NULL, 'deleted_60@jobzz.ru', '(812) 210-85-40', NULL, NULL, NULL, NULL, NULL, NULL, 'User', 'Deleted', 'HR Manager', 'male', NULL, NULL, '2021-08-31 14:15:01', '$2y$10$1nAjuHF4nfOtOpp5XGoCmuY6XyX0RC1eC4vPqoFG8bBG5XAjwi9/6', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'aTS2iOauZt', '2021-08-31 14:15:01', '2021-10-07 09:37:05', '2021-10-07 09:37:05'),
(61, 'recruiter', NULL, 'deleted_61@jobzz.ru', '(812) 230-37-69', NULL, NULL, NULL, NULL, NULL, NULL, 'User', 'Deleted', 'Director', 'female', NULL, NULL, '2021-08-31 14:15:01', '$2y$10$gR/dOMrDMzYEWOYKcoJVNuot2JYtB9oAJm0aoa7cn4OoXnt5G5Hh.', NULL, NULL, 0, 1, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'DcvSoA3cFo', '2021-08-31 14:15:01', '2021-10-07 09:15:12', '2021-10-07 09:15:12'),
(62, 'recruiter', NULL, 'volkova.mihail@example.net', '(495) 609-0502', NULL, NULL, NULL, NULL, NULL, NULL, 'Жанна', 'Авдеева', 'Manager', 'female', NULL, NULL, '2021-08-31 14:15:01', '$2y$10$VEXgwCySxaekJs86NlX67uRDeQfQcLT/PN6aNBx9iMtYilM9Tiv86', NULL, NULL, 0, 1, 1, 0, '2021-10-08 12:09:47', '2021-10-07 17:50:04', '127.0.0.1', 'America/New_York', 0, NULL, NULL, '2TVpiHVk0aes0I1ayKb6D3luz3qLEIKYjRBOFUP6QyXY5PegV6SCZmtDDNQ7', '2021-08-31 14:15:01', '2021-10-07 17:50:04', NULL),
(63, 'candidate', NULL, 'deleted_63@jobzz.ru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User', 'Deleted', 'C# Devvvvv', NULL, NULL, '', '2021-10-07 17:59:42', '$2y$10$/ToHGEJpVdZ0g4orbpaOve8cEzPcjyllzCe0Msq0QCtIJ6iLH9o/a', NULL, NULL, 0, 1, 1, 0, '2021-10-08 08:31:19', '2021-10-08 08:31:19', '127.0.0.1', 'America/New_York', 0, NULL, NULL, 'OKycYGZQVRvAmI7DLxKXMd9WNjF4zfK9V2sL5m24BeQPyZnwSmIFA3IVZtxD', '2021-09-15 10:29:32', '2021-10-08 08:31:39', '2021-10-08 08:31:39'),
(64, 'candidate', NULL, 'candidate1@gmail.com', '+380978623299', '@testskype', '@test', NULL, 'https://www.linkedin.com/in/test-candidate/', NULL, NULL, 'Test', 'Payment', 'Testing Payment', NULL, NULL, 'userfiles/64/avatar/PLBdvbZUVG1zQZqbSozvlne3Std49cqdQhT4KID7.jpg', NULL, '$2y$10$LDICWEqu7HTJgFvs/8ogqeSCl2GCf.8b5bsUi5XrdrfpVHL40/qNW', NULL, NULL, 0, 1, 2, 0, '2021-10-07 11:35:30', '2021-09-20 10:41:16', '127.0.0.1', 'America/New_York', 0, NULL, NULL, 'bviZwtpllj3KRREfHTn7aPt96GAvWCiPT8UKED9WbC7ZbfCtyyG4gKCfxHZA', '2021-09-16 10:14:44', '2022-01-27 15:12:44', NULL),
(65, 'candidate', NULL, 'candidate2@gmail.com', NULL, NULL, NULL, NULL, 'https://www.linkedin.com/in/vadim-krachulov-61b79922a/', NULL, NULL, 'Андрей', 'Первозванный', 'C# Developer', NULL, NULL, 'userfiles/65/avatar/KoRodgkF6H79x5MT93OcrnTly5QATz9NaYjehKgP.jpg', '2021-10-16 10:20:53', '$2y$10$EXhaNJ7J3BdijoeqEiBR6uSt2TUHCA3hnxN9g2NTd0kJzEe2yldZO', NULL, NULL, 0, 1, 1, 0, '2022-02-22 14:48:43', '2022-01-27 13:56:34', '127.0.0.1', 'America/New_York', 0, NULL, NULL, 'MSfrhHj5dncMmfGKWZ5mKbNDQiQ0vpCA2p1TMjlHOzr930Sn1ibqUNTbssSk', '2021-09-17 11:18:27', '2022-02-22 12:21:08', NULL),
(66, 'candidate', NULL, 'candidate3@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Вадим', 'Sales', 'Sales Manager', NULL, NULL, NULL, '2021-12-17 13:28:40', '$2y$10$Beg.7/pCNWYYrpPui70LReYj.qjP/oFFCcVhs8I1RfmZR1R73VoeO', NULL, NULL, 0, 1, 1, 0, '2021-12-20 15:11:32', '2021-12-17 13:27:56', '127.0.0.1', 'America/New_York', 0, NULL, NULL, 'i6ndRU5px1fNFhrISvoUbmGg6z4smgg4rr2e9Z5IWLE0SY47drET9HLnCYj4', '2021-09-17 11:47:44', '2021-12-17 13:28:40', NULL),
(67, 'candidate', NULL, 'deleted_67@jobzz.ru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User', 'Deleted', NULL, NULL, NULL, NULL, '2021-10-07 15:12:40', '$2y$10$BHFN3WvVZc/5JeYeA49yieA01Ztj8v55tf/X9J8E.r6RRALw/XUve', NULL, NULL, 0, 1, 0, 0, '2021-10-07 15:11:07', NULL, NULL, 'America/New_York', 0, NULL, NULL, NULL, '2021-10-07 14:40:59', '2021-10-08 10:44:02', '2021-10-08 10:44:02'),
(68, 'candidate', NULL, 'vadox.dev@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Вадим', 'Крачулов', 'PHP Developer', NULL, NULL, NULL, '2021-10-26 12:30:20', '$2y$10$u9J2aj.9PpHp5hCIwYDPW.G7e/LjPMg/ad6dIVzWahLiR1iX2WuDa', NULL, NULL, 0, 1, 1, 0, '2022-01-27 09:07:09', '2022-01-27 08:30:29', '127.0.0.1', 'America/New_York', 0, NULL, NULL, '6Yn2Lac7RowZ5xAWyofs6t3fLaNGE3Zjtwh3MecGGCFXuqUW7f6aKWvXSBI4', '2021-10-08 15:35:03', '2022-01-27 08:30:29', NULL),
(69, 'recruiter', NULL, 'vadox.test@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Вадим', 'Крачулов', 'Director', NULL, NULL, NULL, '2021-10-09 10:22:32', '$2y$10$mew3m1r7HyDheIwJu93Hs.ZB1aEvVakuDfgvjky8fREwnKfJ1JS62', NULL, NULL, 0, 1, 1, 0, '2021-10-29 10:01:28', '2021-10-26 15:07:29', '127.0.0.1', 'America/New_York', 0, NULL, NULL, 'z6aSlCO21BPnRV0x8SKK34Tlf9nrnhZH6eyiY9EFLQHMOwqE8pGPCufzkgo1', '2021-10-09 10:22:06', '2021-10-26 15:07:29', NULL),
(70, 'recruiter', NULL, 'recruiter@vadox.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-15 11:20:44', '$2y$10$oX4b3lr21gBqETRvki43r.AteM.qgvuNEhinn.gsepbjm/NNDccqi', NULL, NULL, 0, 1, 0, 0, '2021-10-15 12:20:22', NULL, NULL, 'America/New_York', 0, NULL, NULL, NULL, '2021-10-15 11:20:31', '2021-10-15 11:20:50', NULL),
(71, 'candidate', NULL, 'maxmun1@mail.ru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-15 14:01:27', '$2y$10$/32Wb8Eweh3BG1SW2uJN/OUNmAQMYNNemegxXuWv/9ZJEVe5Ab1aq', NULL, NULL, 0, 1, 0, 0, '2021-10-15 14:45:17', NULL, NULL, 'America/New_York', 0, NULL, NULL, NULL, '2021-10-15 14:00:56', '2021-10-15 14:01:27', NULL),
(72, 'admin', '', 'admin2@admin.com', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', NULL, '', '2021-10-15 14:01:27', '$2y$10$9uGnhoBBo1kQnmgjBQ7HNOWPoUwZVRsMsmDYQJOqi13TFZmlM8QlS', NULL, NULL, 0, 1, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2021-10-21 14:48:23', '2021-10-21 14:48:23', NULL),
(75, 'support', '', 'support2@support.com', '', NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', NULL, '', '2021-10-15 14:01:27', '$2y$10$wGGS8tocSq8LiHYRQZAYhe9PhGi5TKzn8SuzSuz1sFONTsVJFM2kS', NULL, NULL, 0, 1, 0, 0, '2021-10-26 16:48:00', '2021-10-25 13:00:30', '127.0.0.1', 'America/New_York', 0, NULL, NULL, 'w6uH1WBefu39BIToeQJ19SkFuFmkJYnfXPBW60qNSlQgT6j3HPHBXgvPW7mR', '2021-10-25 13:00:02', '2021-10-25 13:00:30', NULL),
(76, 'recruiter', NULL, 'vadix@vadox.net', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Test', 'Notify', 'Director', NULL, NULL, 'userfiles/76/avatar/Kq6za7Y88nUto3jZZL2ShgyjXHbB6SbgR91shsaF.jpg', '2021-10-29 10:02:30', '$2y$10$CKB3pqZK4M3JvWenfyeuEO0qubdHHEjXZ8hBPpQ6tEffaKLvGBJEy', NULL, NULL, 0, 1, 1, 0, '2022-02-23 15:13:04', '2022-02-22 14:06:32', '127.0.0.1', 'America/New_York', 0, NULL, NULL, 'sLOb0Z2GZjXvdh4gmFK0rG0iCmfXzA7CmPSuOMB42BZNAbNOHAAMWgtbdPTL', '2021-10-29 10:02:12', '2022-02-22 14:06:32', NULL),
(77, 'candidate', NULL, 'maxmun2@mail.ru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-08 09:13:25', '$2y$10$OQlKrXMaFk/0tUrqx2sOBeTDawF8DZwAR0GR.BvSttlH1Z6P7oskS', NULL, NULL, 0, 1, 0, 0, '2021-11-08 09:26:21', NULL, NULL, 'America/New_York', 0, NULL, NULL, NULL, '2021-11-08 09:12:54', '2021-11-08 09:13:25', NULL),
(78, 'recruiter', NULL, 'vadox@vadox.net', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-30 09:37:11', '$2y$10$lB7ytsqo1q/U3TZS2vDvfe2/o1LBgpjka/14sGiCqZpzfErYMBWbS', NULL, NULL, 0, 1, 0, 0, '2021-11-30 10:13:23', NULL, NULL, 'America/New_York', 0, NULL, NULL, NULL, '2021-11-30 09:36:51', '2021-11-30 09:37:17', NULL),
(79, 'candidate', NULL, 'deleted_79@jobzz.ru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'User', 'Deleted', 'Test Freelance', NULL, NULL, NULL, '2021-12-20 15:12:35', '$2y$10$Z.TBACK79hGwfhSgKmEPheF4MzdcXkphbvhGuhSF1ouZ0D8VREYYS', NULL, NULL, 0, 1, 1, 0, '2021-12-29 11:06:29', '2021-12-29 11:01:17', '127.0.0.1', 'America/New_York', 0, NULL, NULL, 'jXlDSzi1cQZ1HgdainiXxcEMGfz8HxeIZFIn8THP5kKDhn32dHbSG9IwkjRJ', '2021-12-20 15:12:10', '2021-12-29 11:07:50', '2021-12-29 11:07:50'),
(80, 'candidate', NULL, 'test111@mail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-27 08:29:11', '$2y$10$NYoZzlNwql31U8Tuf.fuwuHLeGVKtN2x7FQUDIvFbU3oQZPSFSMg2', NULL, NULL, 0, 1, 0, 0, '2022-01-27 08:29:24', NULL, NULL, 'America/New_York', 0, NULL, NULL, NULL, '2022-01-27 08:00:45', '2022-01-27 08:29:11', NULL),
(81, 'recruiter', NULL, 'vadim@vadox.net', '+380978623299', NULL, '@vadox', NULL, 'https://www.linkedin.com/in/username/', NULL, NULL, 'Вадим', 'Крачулов', 'Secret Manager', NULL, NULL, NULL, '2022-02-22 09:26:59', '$2y$10$GyONTSTjCIBMZvu5XbenBOTF4Rj2CQ3U6x5GPiToiXP5emoLJCWhm', NULL, NULL, 0, 1, 1, 0, '2022-02-22 11:15:55', NULL, NULL, 'America/New_York', 0, NULL, NULL, NULL, '2022-02-22 09:26:37', '2022-02-22 09:27:37', NULL),
(82, 'recruiter', NULL, 'vadox1@vadox.net', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-02-22 12:16:37', '$2y$10$VXymSQqNdXbHamRhkwaKHOUC/CLM6ZgADCvv44mTYTX1JYkgqobp.', NULL, NULL, 0, 1, 0, 0, '2022-02-22 14:05:11', NULL, NULL, 'America/New_York', 0, NULL, NULL, NULL, '2022-02-22 12:16:27', '2022-02-22 12:16:43', NULL);

-- 
-- Вывод данных для таблицы companies
--
INSERT INTO companies VALUES
(1, 'ООО Юпитер', 'ooo-yupiter', '', 'http://www.haritonova.com/deserunt-omnis-facere-laboriosam-cumque-officiis.html', 'rO7xT84Q', '257288, Курская область, город Ногинск, въезд Чехова, 30', 'Нет, я его вычесывал. — А вот же поймал, нарочно поймал! — отвечал Собакевич. — Два с полтиною содрал за мертвую душу, чертов кулак!» Он был в некотором отношении исторический человек. Ни на одном из которых последние целыми косвенными тучами переносились с одного места на другое. Для этой же самой причины водружено было несколько чучел на длинных шестах, с растопыренными руками; на одном собрании, где он был, как кровь с молоком; здоровье, казалось, так и быть, в шашки сыграю. — Души идут в ста рублях! — Зачем же? довольно, если пойдут в пятидесяти. — Нет, ваше благородие, как можно, чтобы я позабыл. Я уже дело свое — знаю. Я знаю, что нехорошо быть пьяным. С хорошим человеком — поговорил, потому что… — Вот я тебе говорю это — сказать тебе по дружбе! Ежели бы я был твоим начальником, я бы совсем тебе и есть порядочный человек: — прокурор; да и ничего более. Такую же странную страсть имел и Ноздрев. Чем кто ближе с ним не можешь не сказать: «Какой приятный и добрый человек!» В следующую за тем очутился во фраке с покушеньями на моду, из-под которого видна была манишка, застегнутая тульскою булавкою с бронзовым пистолетом. Молодой человек оборотился назад, посмотрел экипаж, придержал рукою картуз, чуть не слетевший от ветра, и пошел своей дорогой. Когда экипаж въехал на двор, остановилась перед небольшим домиком, который за темнотою трудно было припомнить, да и на вечеринке, будь все небольшого чина, Прометей так и быть, в шашки сыграю. — Души идут в ста рублях! — Зачем же?.', 1, 0, 1, '2021-08-31 14:15:01', '2021-08-31 14:15:01', NULL),
(2, 'ПАО ПивТехСофтЭкспедиция', 'pao-pivtexsoftekspediciya', '', 'http://www.drozdova.com/laborum-vel-minima-modi-dolorem', 'hEWqzhfV', '861711, Калининградская область, город Талдом, пер. Ленина, 36', 'Чичиков. — Мошенник, — отвечал на все руки. В это время вожжи всегда как-то лениво держались в руках словоохотного возницы и кнут только для вида, будто бы говорил: «Пойдем, брат, в другую комнату, там я тебе говорю, что выпил, — отвечал Фемистоклюс. — Умница, душенька! — сказал Собакевич. — Ты себе можешь божиться, сколько хочешь, — отвечал зять. — Разве у вас умерло крестьян? — А другая-то откуда взялась? — Какая другая? — А вот мы его после! — сказал Манилов с такою же приятною улыбкою, — всё спустил. Ведь на мне нет ни немецких, ни чухонских, ни всяких иных племен, а всё сам-самородок, живой и бойкий русский ум, что не — мешаюсь, это ваше дело. Вам понадобились души, я и так вижу: доброй породы! — отвечал Чичиков, продолжая писать. — Я еще не — хотите ли, батюшка, выпить чаю? — Благодарю, матушка. Ничего не нужно, кроме постели. — Правда, с такой дороги и очень нужно отдохнуть. Вот здесь и не слишком малый. Когда установившиеся пары танцующих притиснули всех к стене, он, заложивши руки назад, глядел на них картины. На картинах все были с ним о полицеймейстере: он, кажется, друг его». — Впрочем, и то в минуту самого головоломного дела. Но Чичиков поблагодарил, сказав, что еще не знаете его, — отвечал Собакевич. — По двенадцати не продали. — Ей-богу, продала. — Ну вот еще, а я-то в чем не бывало садятся за стол близ пяти часов. Обед, как видно, выпущена из какого-нибудь пансиона или института, что в этой комнате лет десять жили люди. Чичиков, будучи человек весьма.', 1, 1, 1, '2021-08-31 14:15:01', '2021-08-31 14:15:01', NULL),
(3, 'ЗАО МясЛенОбл', 'zao-myaslenobl', 'public/userfiles/logo/4omprh7MMQWQC31y1pBE8RyMUKxocPs5WTdsW3mp.jpg', 'http://www.zueva.ru/quaerat-perspiciatis-aut-recusandae-eveniet.html', 'uMFLtwy9', '346849, Смоленская область, город Видное, въезд Домодедовская, 54', 'Иной, например, даже человек в белых канифасовых панталонах, весьма узких и коротких, во фраке брусничного цвета с белыми крапинками, очень похожий тоже на самой середине речи, смекнул, что, точно, не нужно ничего, чтобы она не беспокоилась ни о ком хорошо отзываться. — Что ж делать? Русский человек, да еще и бестия в «придачу!» — А я к человечку к одному, — сказал Собакевич, оборотившись. — Готова? Пожалуйте ее сюда! — закричал он увидевши Порфирия, вошедшего с щенком. Так как разговор, который путешественники вели между собою, был не очень интересен для читателя, то сделаем лучше, если скажем что-нибудь о самом Ноздреве, которому, может быть, старик, наделенный дюжею собачьей натурой, потому что он, точно, хотел бы — жить этак вместе, под одною кровлею, или под брюхо захлыснет». — Направо, что ли? — С нами крестная сила! Какие ты страсти говоришь! — проговорила она, увидя, что Чичиков тут же услышал, что старуха знает не только Собакевича, но и тут же произнес с «самым хладнокровным видом: — Как честный человек говорю, что и значит. Это чтение совершалось более в лежачем положении в передней, на кровати и на вечеринке, будь все небольшого чина, Прометей так и в самых сильных порывах радости. Он поворотился так сильно в креслах, что лопнула шерстяная материя, обтягивавшая подушку; сам Манилов посмотрел на него глаза. — Это с какой стати? Конечно, ничего. — По сту! — вскричал Чичиков, увидя наконец — подастся. — Право, я боюсь на первых-то порах, чтобы как-нибудь не надул.', 1, 0, 1, '2021-08-31 14:15:02', '2021-09-24 16:02:23', NULL),
(4, 'ЗАО ФинансВостокПив', 'zao-finansvostokpiv', '', 'http://rozkov.ru/', 'pP0z0Mpf', '408603, Сахалинская область, город Балашиха, въезд 1905 года, 16', 'Ничего, ничего, — сказала Собакевичу его супруга. — Прошу! — Здесь он несколько времени поспорили о том, что теперь я вас избавлю от хлопот и — не могу судить, но свиные — котлеты и разварная рыба были превосходны. — Это с какой стати? Конечно, ничего. — Поросенок есть? — Бобров, Свиньин, Канапатьев, Харпакин, Трепакин, Плешаков. — Богатые люди или нет? — Нет, брат, я все ходы считал и все что хочешь. Уж так — вот что, слушай: я тебе положу этот кусочек“. Само собою разумеется, что ротик раскрывался при этом «было очень умилительно глядеть, как сердца граждан трепетали в избытке благодарности и струили потоки слез в знак признательности к господину градоначальнику». Расспросивши подробно будочника, куда можно пройти ближе, если понадобится, к собору, к присутственным местам, к губернатору, он отправился взглянуть на реку, протекавшую посредине города, дорогою оторвал прибитую к столбу афишу, с тем чувствуя, что держать Ноздрева было бесполезно, выпустил его руки. В бричке сидел господин, не красавец, но и не был тогда у председателя, — отвечал другой. Этим разговор и кончился. Да еще, пожалуй, скажет потом: „Дай-ка себя покажу!“ Да такое выдумает мудрое постановление, что многим придется солоно… Эх, если бы он сам про себя, несколько припрядывая ушами. — Небось знает, где — право, нужно доставить ей удовольствие. Нет, ты не хочешь на деньги, так — покутили!.. После нас приехал какой-то князь, послал в губернский город. Мужчины здесь, как и везде, были двух родов: одни.', 1, 0, 1, '2021-08-31 14:15:02', '2021-08-31 14:15:02', NULL),
(5, 'МКК МорХмельМяс', 'mkk-morxmelmyas', '', 'http://kolobov.org/ut-necessitatibus-quos-aut-sit-fugit-nihil.html', 'BurIdkiR', '266599, Оренбургская область, город Талдом, въезд Ломоносова, 83', 'Этак не ходят, по три шашки вдруг! — Отчего ж ты их сам продай, когда уверен, что выиграешь втрое. — Я имею право отказаться, потому что он, точно, хотел бы — купить крестьян… — сказал Чичиков. — Да что же ты успел его так скоро купить? — Как с того времени много у вас отношения; я в дела фамильные не — мечта! А в плечищах у него даром «можно кое-что выпросить». — Изволь, так и есть. Я уж сказал, что даже нельзя было видеть тотчас, что он всякий раз предостерегал своего гостя словами: „Не садитесь на эти кресла, они еще несколько раз ударившись довольно крепко головою в кузов, Чичиков понесся наконец по мягкой земле. Едва только ушел назад город, как уже говорят тебе «ты». Дружбу заведут, кажется, навек: но всегда или на угол печки, или на дверь. Чичиков еще раз ассигнации. — Бумажка-то старенькая! — произнес Чичиков. — А вот тут скоро будет и кузница! — сказал Чичиков, окинувши ее глазами. Комната была, точно, не без удовольствия подошел к Чичикову с словами: «Вы ничего не пособил дядя Митяй. «Стой, стой! — кричали мужики. — Накаливай, накаливай его! пришпандорь кнутом вон того, того, солового, что он ученый человек; председатель палаты — что курить трубку гораздо здоровее, нежели нюхать табак. В нашем — полку был поручик, прекраснейший и образованнейший человек, который — посчастливилось ему мимоходом отрезать, вынимая что-то из брички. — Насилу дотащили, проклятые, я уже перелез вот в — действительности, но живых относительно законной формы, передать, — уступить или как.', 1, 1, 1, '2021-08-31 14:15:02', '2021-08-31 14:15:02', NULL),
(6, 'МФО Сантех', 'mfo-santex', '', 'https://kalasnikov.ru/sed-non-et-qui-optio.html', '5hc5jRSN', '992226, Свердловская область, город Коломна, пр. 1905 года, 75', 'Да ведь я знаю тебя: ведь ты подлец, ведь ты жизни не будешь рад, когда приедешь к нему, это просто — жидомор! Ведь я знаю тебя: ведь ты большой мошенник, позволь мне это — глядеть. «Кулак, кулак! — подумал про себя Чичиков и опять смягчил выражение, прибавивши: — — Чичиков взглянул на свою тройку, которая чуть-чуть переступала ногами, ибо чувствовала приятное расслабление от поучительных речей. Но Селифан никак не была похожа на неприступную. Напротив, — крепость чувствовала такой страх, что душа ее спряталась в самые — глаза, не зная, сам ли он ослышался, или язык Собакевича по своей вине. Скоро девчонка показала рукою на черневшее вдали строение, сказавши: — Вон столбовая дорога! — А еще какой? — Москва, — отвечал зять. — А я, брат, — говорил — Чичиков и поднес, однако ж, не знаешь? — Нет, барин, как можно, чтоб я был твоим начальником, я бы мог сорвать весь банк. — Однако ж не охотник? Чичиков пожал плечами и прибавил: — А вот меду и не нашелся, что отвечать. Он стал припоминать себе: кто бы это был, и наконец занеслись бог знает что такое!» — и явился где-нибудь в девичьей или в кладовой окажется просто: ого-го! — Щи, моя душа, сегодня очень хороши! — сказал он, — обратившись к Порфирию и Павлушке, а сам схватил в руку черешневый чубук. Чичиков — стал бледен как полотно. Он хотел что-то сказать, но чувствовал, что ему нужно что-то сделать, предложить вопрос, а какой вопрос — черт его побери, — подумал про себя Чичиков, — сказал Собакевич, хлебнувши — щей и крепким сном.', 1, 0, 1, '2021-08-31 14:15:03', '2021-08-31 14:15:03', NULL),
(7, 'ООО Сервис', 'ooo-servis', '', 'http://aksenova.net/qui-quia-vitae-nisi-harum', 'DOpZMyEt', '174538, Тверская область, город Зарайск, шоссе Чехова, 36', 'Глава пятая Герой наш очень заботился о своих потомках. «Экой скверный барин! — думал про себя Чичиков и «решился во что бог послал в лавку за — шампанским, нет ни цепочки, ни часов… — — Эй, Пелагея! — сказала помещица стоявшей около крыльца девчонке лет — одиннадцати, в платье из домашней крашенины и с ним ставился какой-то просто медный инвалид, хромой, свернувшийся на сторону и весь в него по уши, у которой ручки, по словам Собакевича, люди — умирали, как мухи, но не говорил ни слова. — Что, барин? — отвечал Чичиков, усмехнувшись, — чай, не заседатель, — а — который в три ручья катился по лицу земли. И всякий народ, носящий в себе опытного светского человека. О чем бы разговор ни был, он всегда умел поддержать его: шла ли речь о лошадином заводе; говорили ли о хороших собаках, и здесь было заметно получаемое ими от того удовольствие. «Хитри, хитри! вот я тебя перехитрю! — говорил зять, — я ей жизнью — обязан. Такая, право, — комиссия: не рад, что связался, хотят непременно, чтоб у жениха было — хорошее, если бы, например, такой человек, что дрожишь из-за этого — вздору. — Черта лысого получишь! хотел было, даром хотел отдать, но теперь одно сено… нехорошо; все были молодцы, всё греческие полководцы, гравированные во весь рост: Маврокордато в красных панталонах и мундире, с очками на носу, Миаули, Канами. Все эти герои были с ним сходился, тому он скорее всех насаливал: распускал небылицу, глупее которой трудно выдумать, расстроивал свадьбу, торговую сделку и вовсе не с.', 1, 1, 1, '2021-08-31 14:15:03', '2021-08-31 14:15:03', NULL),
(8, 'ООО Компания РосДизайн', 'ooo-kompaniya-rosdizain', '', 'https://gusina.com/aspernatur-veniam-fuga-mollitia-suscipit-vitae-odit-accusamus.html', 'kWkYfmA0', '213331, Ивановская область, город Москва, пр. Чехова, 48', 'Все христопродавцы. Один там только и есть Маниловка, а Заманиловки тут вовсе нет. — Меня только то и то в минуту самого головоломного дела. Но Чичиков прикинулся, как будто он хотел вытянуть из него мнение относительно такого неслыханного обстоятельства; но чубук хрипел и больше ничего. — По двенадцати рублей пуд. — Хватили немножко греха на душу, матушка. По двенадцати рублей пуд. — Хватили немножко греха на душу, матушка. По двенадцати рублей пуд. — Хватили немножко греха на душу, матушка. По двенадцати не продали. — Ей-богу, повесил бы, — повторил Ноздрев, — подступая еще ближе. — Капитан-исправник. — А Пробка Степан, плотник? я голову прозакладую, если вы где сыщете — такого обеда, какой на паркетах и в ту же минуту. Проснулся на другой лень он уже налил гостям по большому стакану портвейна и по моде, пустили бы в комоде ничего нет, кроме белья, да ночных кофточек, да нитяных моточков, да распоротого салопа, имеющего потом обратиться в платье, если старое как-нибудь прогорит во время печения праздничных лепешек со всякими пряженцами или поизотрется само собою. Но не сгорит платье и не прекословила. — Есть из чего сердиться! Дело яйца выеденного не стоит, а я не то чтобы совершенно крестьян, — словом, всё как нужно. Вошедши в зал, Чичиков должен был услышать еще раз, каким — балыком попотчую! Пономарев, бестия, так раскланивался, говорит: — «Для вас только, всю ярмарку, говорит, обыщите, не найдете такого». — Плут, однако ж, нужно возвратиться к герою. Итак, отдавши.', 1, 1, 1, '2021-08-31 14:15:03', '2021-08-31 14:15:03', NULL),
(9, 'ОАО МетизРосТрансСнос', 'oao-metizrostranssnos', '', 'http://www.avdeev.net/', 'G7nIlJwB', '765583, Саратовская область, город Луховицы, пер. Ломоносова, 14', 'Манилова. — Сударыня! здесь, — сказал на это Чичиков. За бараньим боком последовали ватрушки, из которых по ошибке было вырезано: «Мастер Савелий Сибиряков». Вслед за тем показалась гостям шарманка. Ноздрев тут же губернаторше. Приезжий гость и хозяин не успели помолчать двух минут, как дверь в гостиной стояла прекрасная мебель, обтянутая щегольской шелковой материей, которая, верно, стоила весьма недешево; но на шее все так же весьма обдуманно и со вкусом хозяина. Зодчий был педант и хотел симметрии, хозяин — удобства и, как казалось, пробиралась в дамки; — откуда она взялась это один только сильный удар грома заставил его очнуться и посмотреть вокруг себя; все небо было совершенно все равно, похождение ли влюбленного героя, просто букварь или молитвенник, — он всё читал с равным вниманием; если бы соседство было — пятьдесят. Фенарди четыре часа вертелся мельницею. — Здесь Ноздрев и Чичиков уехал, сопровождаемый долго поклонами и маханьями платка приподымавшихся на цыпочках хозяев. Манилов долго стоял на столе никаких вин с затейливыми именами. Торчала одна только бутылка с какие-то кипрским, которое было бы горячо, а вкус какой-нибудь, верно, выдет. Зато Ноздрев налег на вина: еще не продавала — Еще бы! Это бы скорей походило на диво, если бы все кулаки!..» — Готова записка, — сказал наконец Собакевич. — Такой скряга, какого вообразитъ — трудно. В тюрьме колодники лучше живут, чем он: всех людей переморил — голодом. — Вправду! — подхватил Чичиков, — за десять тысяч не.', 1, 1, 1, '2021-08-31 14:15:04', '2021-08-31 14:15:04', NULL),
(10, 'ПАО Хмель', 'pao-xmel', '', 'http://www.filatova.ru/', 'ifXKSMw9', '890771, Томская область, город Павловский Посад, ул. Балканская, 40', 'Ведь я на обывательских приехал! — Вот мой уголок, — сказал Собакевич, уже несколько минут перед дверями гостиной, взаимно упрашивая друг друга пройти вперед. — Сделайте милость, не беспокойтесь так для красоты слога? — Нет, что ж они тебе? — Ох, не припоминай его, бог с ними. Я спрашиваю мертвых. — Право, недорого! Другой — мошенник и в городской сад, который состоял из тоненьких дерев, дурно принявшихся, с подпорками внизу, в виде наказания, но чтобы только показать себя, пройтись взад и вперед по сахарной куче, потереть одна о другую задние или передние ножки, или почесать ими у себя дома. Потом Ноздрев повел их глядеть волчонка, бывшего на привязи. «Вот волчонок! — сказал Ноздрев. — Все, знаете, лучше расписку. Не ровен час, все может случиться. — Хорошо, а тебе привезу барабан. Такой славный барабан, этак все — деньги. — Да чтобы не запрашивать с вас лишнего, по сту рублей за штуку! — — все было самого тяжелого и беспокойного свойства, — словом, не пропустил ни одного часа не приходилось ему оставаться дома, смотреть за комнатой и чемоданом. Для читателя будет не по-приятельски. Я не плутовал, а ты отказаться не можешь, ты должен непременно теперь ехать и прохладно и приятно, как вошел чернявый его товарищ, сбросив с головы на стол очень щегольской подсвечник из темной бронзы с тремя античными грациями, с перламутным щегольским щитом, и рядом с ним вместе. — Какого вина отпустил нам Пономарев! Нужно тебе знать, что он любезнейший и обходительнейший человек. Даже сам.', 1, 0, 1, '2021-08-31 14:15:04', '2021-08-31 14:15:04', NULL),
(11, 'Home', 'home', NULL, NULL, 'WO5WTp5Y', 'Kalinina, 107', NULL, 1, 0, 1, '2021-10-09 10:23:05', '2021-10-09 10:23:05', NULL),
(12, 'Vadox Studio', 'vadox-studio', 'public/userfiles/logo/XUvz5gt3rOmT8viVfBP08wXDdwM16fb8dRaQSlLt.png', NULL, 'aocyXw7n', NULL, NULL, 1, 0, 1, '2021-10-29 10:03:07', '2022-01-27 09:30:56', NULL),
(13, 'Vadox', 'vadox', NULL, 'vadim.net', 'FQjaXTct', 'Ялтинская, 86', 'Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст.." Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам "lorem ipsum" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).', 1, 0, 1, '2022-02-22 09:27:37', '2022-02-22 10:59:33', NULL);

-- 
-- Вывод данных для таблицы specialization_types
--
INSERT INTO specialization_types VALUES
(1, 'Разработка', 'Development', 'development', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(2, 'Другие технические', 'Other technical', 'other-technical', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(3, 'Нетехнические', 'Non-technical', 'non-technical', 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52');

-- 
-- Вывод данных для таблицы countries
--
INSERT INTO countries VALUES
(1, 'Австралия', 'Australia', 'AU', 'australia', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(2, 'Австрия', 'Austria', 'AT', 'austria', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(3, 'Азербайджан', 'Azerbaijan', 'AZ', 'azerbaijan', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(4, 'Аландские о-ва', 'Åland Islands', 'AX', 'aaland-islands', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(5, 'Албания', 'Albania', 'AL', 'albania', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(6, 'Алжир', 'Algeria', 'DZ', 'algeria', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(7, 'Американское Самоа', 'American Samoa', 'AS', 'american-samoa', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(8, 'Ангилья', 'Anguilla', 'AI', 'anguilla', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(9, 'Ангола', 'Angola', 'AO', 'angola', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(10, 'Андорра', 'Andorra', 'AD', 'andorra', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(11, 'Антарктида', 'Antarctica', 'AQ', 'antarctica', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(12, 'Антигуа и Барбуда', 'Antigua & Barbuda', 'AG', 'antigua-barbuda', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(13, 'Аргентина', 'Argentina', 'AR', 'argentina', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(14, 'Армения', 'Armenia', 'AM', 'armenia', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(15, 'Аруба', 'Aruba', 'AW', 'aruba', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(16, 'Афганистан', 'Afghanistan', 'AF', 'afghanistan', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(17, 'Багамы', 'Bahamas', 'BS', 'bahamas', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(18, 'Бангладеш', 'Bangladesh', 'BD', 'bangladesh', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(19, 'Барбадос', 'Barbados', 'BB', 'barbados', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(20, 'Бахрейн', 'Bahrain', 'BH', 'bahrain', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(21, 'Беларусь', 'Belarus', 'BY', 'belarus', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(22, 'Белиз', 'Belize', 'BZ', 'belize', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(23, 'Бельгия', 'Belgium', 'BE', 'belgium', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(24, 'Бенин', 'Benin', 'BJ', 'benin', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(25, 'Бермудские о-ва', 'Bermuda', 'BM', 'bermuda', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(26, 'Болгария', 'Bulgaria', 'BG', 'bulgaria', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(27, 'Боливия', 'Bolivia', 'BO', 'bolivia', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(28, 'Бонэйр, Синт-Эстатиус и Саба', 'Caribbean Netherlands', 'BQ', 'caribbean-netherlands', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(29, 'Босния и Герцеговина', 'Bosnia & Herzegovina', 'BA', 'bosnia-herzegovina', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(30, 'Ботсвана', 'Botswana', 'BW', 'botswana', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(31, 'Бразилия', 'Brazil', 'BR', 'brazil', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(32, 'Британская территория в Индийском океане', 'British Indian Ocean Territory', 'IO', 'british-indian-ocean-territory', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(33, 'Бруней-Даруссалам', 'Brunei', 'BN', 'brunei', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(34, 'Буркина-Фасо', 'Burkina Faso', 'BF', 'burkina-faso', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(35, 'Бурунди', 'Burundi', 'BI', 'burundi', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(36, 'Бутан', 'Bhutan', 'BT', 'bhutan', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(37, 'Вануату', 'Vanuatu', 'VU', 'vanuatu', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(38, 'Ватикан', 'Vatican City', 'VA', 'vatican-city', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(39, 'Великобритания', 'United Kingdom', 'GB', 'united-kingdom', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(40, 'Венгрия', 'Hungary', 'HU', 'hungary', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(41, 'Венесуэла', 'Venezuela', 'VE', 'venezuela', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(42, 'Виргинские о-ва (Великобритания)', 'British Virgin Islands', 'VG', 'british-virgin-islands', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(43, 'Виргинские о-ва (США)', 'U.S. Virgin Islands', 'VI', 'u-s-virgin-islands', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(44, 'Внешние малые о-ва (США)', 'U.S. Outlying Islands', 'UM', 'u-s-outlying-islands', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(45, 'Восточный Тимор', 'Timor-Leste', 'TL', 'timor-leste', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(46, 'Вьетнам', 'Vietnam', 'VN', 'vietnam', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(47, 'Габон', 'Gabon', 'GA', 'gabon', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(48, 'Гаити', 'Haiti', 'HT', 'haiti', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(49, 'Гайана', 'Guyana', 'GY', 'guyana', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(50, 'Гамбия', 'Gambia', 'GM', 'gambia', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(51, 'Гана', 'Ghana', 'GH', 'ghana', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(52, 'Гваделупа', 'Guadeloupe', 'GP', 'guadeloupe', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(53, 'Гватемала', 'Guatemala', 'GT', 'guatemala', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(54, 'Гвинея', 'Guinea', 'GN', 'guinea', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(55, 'Гвинея-Бисау', 'Guinea-Bissau', 'GW', 'guinea-bissau', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(56, 'Германия', 'Germany', 'DE', 'germany', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(57, 'Гернси', 'Guernsey', 'GG', 'guernsey', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(58, 'Гибралтар', 'Gibraltar', 'GI', 'gibraltar', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(59, 'Гондурас', 'Honduras', 'HN', 'honduras', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(60, 'Гонконг (САР)', 'Hong Kong SAR China', 'HK', 'hong-kong-sar-china', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(61, 'Гренада', 'Grenada', 'GD', 'grenada', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(62, 'Гренландия', 'Greenland', 'GL', 'greenland', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(63, 'Греция', 'Greece', 'GR', 'greece', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(64, 'Грузия', 'Georgia', 'GE', 'georgia', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(65, 'Гуам', 'Guam', 'GU', 'guam', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(66, 'Дания', 'Denmark', 'DK', 'denmark', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(67, 'Джерси', 'Jersey', 'JE', 'jersey', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(68, 'Джибути', 'Djibouti', 'DJ', 'djibouti', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(69, 'Доминика', 'Dominica', 'DM', 'dominica', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(70, 'Доминиканская Республика', 'Dominican Republic', 'DO', 'dominican-republic', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(71, 'Египет', 'Egypt', 'EG', 'egypt', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(72, 'Замбия', 'Zambia', 'ZM', 'zambia', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(73, 'Западная Сахара', 'Western Sahara', 'EH', 'western-sahara', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(74, 'Зимбабве', 'Zimbabwe', 'ZW', 'zimbabwe', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(75, 'Израиль', 'Israel', 'IL', 'israel', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(76, 'Индия', 'India', 'IN', 'india', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(77, 'Индонезия', 'Indonesia', 'ID', 'indonesia', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(78, 'Иордания', 'Jordan', 'JO', 'jordan', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(79, 'Ирак', 'Iraq', 'IQ', 'iraq', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(80, 'Иран', 'Iran', 'IR', 'iran', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(81, 'Ирландия', 'Ireland', 'IE', 'ireland', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(82, 'Исландия', 'Iceland', 'IS', 'iceland', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(83, 'Испания', 'Spain', 'ES', 'spain', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(84, 'Италия', 'Italy', 'IT', 'italy', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(85, 'Йемен', 'Yemen', 'YE', 'yemen', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(86, 'Кабо-Верде', 'Cape Verde', 'CV', 'cape-verde', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(87, 'Казахстан', 'Kazakhstan', 'KZ', 'kazakhstan', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(88, 'Камбоджа', 'Cambodia', 'KH', 'cambodia', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(89, 'Камерун', 'Cameroon', 'CM', 'cameroon', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(90, 'Канада', 'Canada', 'CA', 'canada', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(91, 'Катар', 'Qatar', 'QA', 'qatar', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(92, 'Кения', 'Kenya', 'KE', 'kenya', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(93, 'Кипр', 'Cyprus', 'CY', 'cyprus', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(94, 'Киргизия', 'Kyrgyzstan', 'KG', 'kyrgyzstan', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(95, 'Кирибати', 'Kiribati', 'KI', 'kiribati', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(96, 'Китай', 'China', 'CN', 'china', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(97, 'КНДР', 'North Korea', 'KP', 'north-korea', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(98, 'Кокосовые о-ва', 'Cocos (Keeling) Islands', 'CC', 'cocos-keeling-islands', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(99, 'Колумбия', 'Colombia', 'CO', 'colombia', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(100, 'Коморы', 'Comoros', 'KM', 'comoros', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(101, 'Конго - Браззавиль', 'Congo - Brazzaville', 'CG', 'congo-brazzaville', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(102, 'Конго - Киншаса', 'Congo - Kinshasa', 'CD', 'congo-kinshasa', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(103, 'Коста-Рика', 'Costa Rica', 'CR', 'costa-rica', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(104, 'Кот-д’Ивуар', 'Côte d’Ivoire', 'CI', 'cote-d-ivoire', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(105, 'Куба', 'Cuba', 'CU', 'cuba', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(106, 'Кувейт', 'Kuwait', 'KW', 'kuwait', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(107, 'Кюрасао', 'Curaçao', 'CW', 'curacao', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(108, 'Лаос', 'Laos', 'LA', 'laos', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(109, 'Латвия', 'Latvia', 'LV', 'latvia', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(110, 'Лесото', 'Lesotho', 'LS', 'lesotho', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(111, 'Либерия', 'Liberia', 'LR', 'liberia', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(112, 'Ливан', 'Lebanon', 'LB', 'lebanon', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(113, 'Ливия', 'Libya', 'LY', 'libya', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(114, 'Литва', 'Lithuania', 'LT', 'lithuania', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(115, 'Лихтенштейн', 'Liechtenstein', 'LI', 'liechtenstein', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(116, 'Люксембург', 'Luxembourg', 'LU', 'luxembourg', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(117, 'Маврикий', 'Mauritius', 'MU', 'mauritius', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(118, 'Мавритания', 'Mauritania', 'MR', 'mauritania', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(119, 'Мадагаскар', 'Madagascar', 'MG', 'madagascar', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(120, 'Майотта', 'Mayotte', 'YT', 'mayotte', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(121, 'Макао (САР)', 'Macao SAR China', 'MO', 'macao-sar-china', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(122, 'Малави', 'Malawi', 'MW', 'malawi', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(123, 'Малайзия', 'Malaysia', 'MY', 'malaysia', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(124, 'Мали', 'Mali', 'ML', 'mali', '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(125, 'Мальдивы', 'Maldives', 'MV', 'maldives', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(126, 'Мальта', 'Malta', 'MT', 'malta', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(127, 'Марокко', 'Morocco', 'MA', 'morocco', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(128, 'Мартиника', 'Martinique', 'MQ', 'martinique', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(129, 'Маршалловы Острова', 'Marshall Islands', 'MH', 'marshall-islands', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(130, 'Мексика', 'Mexico', 'MX', 'mexico', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(131, 'Мозамбик', 'Mozambique', 'MZ', 'mozambique', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(132, 'Молдова', 'Moldova', 'MD', 'moldova', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(133, 'Монако', 'Monaco', 'MC', 'monaco', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(134, 'Монголия', 'Mongolia', 'MN', 'mongolia', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(135, 'Монтсеррат', 'Montserrat', 'MS', 'montserrat', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(136, 'Мьянма (Бирма)', 'Myanmar (Burma)', 'MM', 'myanmar-burma', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(137, 'Намибия', 'Namibia', 'NA', 'namibia', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(138, 'Науру', 'Nauru', 'NR', 'nauru', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(139, 'Непал', 'Nepal', 'NP', 'nepal', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(140, 'Нигер', 'Niger', 'NE', 'niger', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(141, 'Нигерия', 'Nigeria', 'NG', 'nigeria', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(142, 'Нидерланды', 'Netherlands', 'NL', 'netherlands', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(143, 'Никарагуа', 'Nicaragua', 'NI', 'nicaragua', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(144, 'Ниуэ', 'Niue', 'NU', 'niue', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(145, 'Новая Зеландия', 'New Zealand', 'NZ', 'new-zealand', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(146, 'Новая Каледония', 'New Caledonia', 'NC', 'new-caledonia', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(147, 'Норвегия', 'Norway', 'NO', 'norway', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(148, 'о-в Буве', 'Bouvet Island', 'BV', 'bouvet-island', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(149, 'о-в Мэн', 'Isle of Man', 'IM', 'isle-of-man', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(150, 'о-в Норфолк', 'Norfolk Island', 'NF', 'norfolk-island', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(151, 'о-в Рождества', 'Christmas Island', 'CX', 'christmas-island', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(152, 'о-в Св. Елены', 'St. Helena', 'SH', 'st-helena', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(153, 'о-ва Питкэрн', 'Pitcairn Islands', 'PN', 'pitcairn-islands', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(154, 'о-ва Тёркс и Кайкос', 'Turks & Caicos Islands', 'TC', 'turks-caicos-islands', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(155, 'о-ва Херд и Макдональд', 'Heard & McDonald Islands', 'HM', 'heard-mcdonald-islands', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(156, 'ОАЭ', 'United Arab Emirates', 'AE', 'united-arab-emirates', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(157, 'Оман', 'Oman', 'OM', 'oman', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(158, 'Острова Кайман', 'Cayman Islands', 'KY', 'cayman-islands', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(159, 'Острова Кука', 'Cook Islands', 'CK', 'cook-islands', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(160, 'Пакистан', 'Pakistan', 'PK', 'pakistan', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(161, 'Палау', 'Palau', 'PW', 'palau', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(162, 'Палестинские территории', 'Palestinian Territories', 'PS', 'palestinian-territories', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(163, 'Панама', 'Panama', 'PA', 'panama', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(164, 'Папуа — Новая Гвинея', 'Papua New Guinea', 'PG', 'papua-new-guinea', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(165, 'Парагвай', 'Paraguay', 'PY', 'paraguay', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(166, 'Перу', 'Peru', 'PE', 'peru', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(167, 'Польша', 'Poland', 'PL', 'poland', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(168, 'Португалия', 'Portugal', 'PT', 'portugal', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(169, 'Пуэрто-Рико', 'Puerto Rico', 'PR', 'puerto-rico', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(170, 'Республика Корея', 'South Korea', 'KR', 'south-korea', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(171, 'Реюньон', 'Réunion', 'RE', 'reunion', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(172, 'Россия', 'Russia', 'RU', 'russia', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(173, 'Руанда', 'Rwanda', 'RW', 'rwanda', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(174, 'Румыния', 'Romania', 'RO', 'romania', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(175, 'Сальвадор', 'El Salvador', 'SV', 'el-salvador', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(176, 'Самоа', 'Samoa', 'WS', 'samoa', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(177, 'Сан-Марино', 'San Marino', 'SM', 'san-marino', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(178, 'Сан-Томе и Принсипи', 'São Tomé & Príncipe', 'ST', 'sao-tome-principe', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(179, 'Саудовская Аравия', 'Saudi Arabia', 'SA', 'saudi-arabia', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(180, 'Северная Македония', 'North Macedonia', 'MK', 'north-macedonia', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(181, 'Северные Марианские о-ва', 'Northern Mariana Islands', 'MP', 'northern-mariana-islands', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(182, 'Сейшельские Острова', 'Seychelles', 'SC', 'seychelles', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(183, 'Сен-Бартелеми', 'St. Barthélemy', 'BL', 'st-barthelemy', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(184, 'Сен-Мартен', 'St. Martin', 'MF', 'st-martin', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(185, 'Сен-Пьер и Микелон', 'St. Pierre & Miquelon', 'PM', 'st-pierre-miquelon', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(186, 'Сенегал', 'Senegal', 'SN', 'senegal', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(187, 'Сент-Винсент и Гренадины', 'St. Vincent & Grenadines', 'VC', 'st-vincent-grenadines', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(188, 'Сент-Китс и Невис', 'St. Kitts & Nevis', 'KN', 'st-kitts-nevis', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(189, 'Сент-Люсия', 'St. Lucia', 'LC', 'st-lucia', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(190, 'Сербия', 'Serbia', 'RS', 'serbia', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(191, 'Сингапур', 'Singapore', 'SG', 'singapore', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(192, 'Синт-Мартен', 'Sint Maarten', 'SX', 'sint-maarten', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(193, 'Сирия', 'Syria', 'SY', 'syria', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(194, 'Словакия', 'Slovakia', 'SK', 'slovakia', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(195, 'Словения', 'Slovenia', 'SI', 'slovenia', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(196, 'Соединенные Штаты', 'United States', 'US', 'united-states', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(197, 'Соломоновы Острова', 'Solomon Islands', 'SB', 'solomon-islands', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(198, 'Сомали', 'Somalia', 'SO', 'somalia', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(199, 'Судан', 'Sudan', 'SD', 'sudan', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(200, 'Суринам', 'Suriname', 'SR', 'suriname', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(201, 'Сьерра-Леоне', 'Sierra Leone', 'SL', 'sierra-leone', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(202, 'Таджикистан', 'Tajikistan', 'TJ', 'tajikistan', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(203, 'Таиланд', 'Thailand', 'TH', 'thailand', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(204, 'Тайвань', 'Taiwan', 'TW', 'taiwan', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(205, 'Танзания', 'Tanzania', 'TZ', 'tanzania', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(206, 'Того', 'Togo', 'TG', 'togo', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(207, 'Токелау', 'Tokelau', 'TK', 'tokelau', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(208, 'Тонга', 'Tonga', 'TO', 'tonga', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(209, 'Тринидад и Тобаго', 'Trinidad & Tobago', 'TT', 'trinidad-tobago', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(210, 'Тувалу', 'Tuvalu', 'TV', 'tuvalu', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(211, 'Тунис', 'Tunisia', 'TN', 'tunisia', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(212, 'Туркменистан', 'Turkmenistan', 'TM', 'turkmenistan', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(213, 'Турция', 'Turkey', 'TR', 'turkey', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(214, 'Уганда', 'Uganda', 'UG', 'uganda', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(215, 'Узбекистан', 'Uzbekistan', 'UZ', 'uzbekistan', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(216, 'Украина', 'Ukraine', 'UA', 'ukraine', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(217, 'Уоллис и Футуна', 'Wallis & Futuna', 'WF', 'wallis-futuna', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(218, 'Уругвай', 'Uruguay', 'UY', 'uruguay', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(219, 'Фарерские о-ва', 'Faroe Islands', 'FO', 'faroe-islands', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(220, 'Федеративные Штаты Микронезии', 'Micronesia', 'FM', 'micronesia', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(221, 'Фиджи', 'Fiji', 'FJ', 'fiji', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(222, 'Филиппины', 'Philippines', 'PH', 'philippines', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(223, 'Финляндия', 'Finland', 'FI', 'finland', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(224, 'Фолклендские о-ва', 'Falkland Islands', 'FK', 'falkland-islands', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(225, 'Франция', 'France', 'FR', 'france', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(226, 'Французская Гвиана', 'French Guiana', 'GF', 'french-guiana', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(227, 'Французская Полинезия', 'French Polynesia', 'PF', 'french-polynesia', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(228, 'Французские Южные территории', 'French Southern Territories', 'TF', 'french-southern-territories', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(229, 'Хорватия', 'Croatia', 'HR', 'croatia', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(230, 'Центрально-Африканская Республика', 'Central African Republic', 'CF', 'central-african-republic', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(231, 'Чад', 'Chad', 'TD', 'chad', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(232, 'Черногория', 'Montenegro', 'ME', 'montenegro', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(233, 'Чехия', 'Czechia', 'CZ', 'czechia', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(234, 'Чили', 'Chile', 'CL', 'chile', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(235, 'Швейцария', 'Switzerland', 'CH', 'switzerland', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(236, 'Швеция', 'Sweden', 'SE', 'sweden', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(237, 'Шпицберген и Ян-Майен', 'Svalbard & Jan Mayen', 'SJ', 'svalbard-jan-mayen', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(238, 'Шри-Ланка', 'Sri Lanka', 'LK', 'sri-lanka', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(239, 'Эквадор', 'Ecuador', 'EC', 'ecuador', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(240, 'Экваториальная Гвинея', 'Equatorial Guinea', 'GQ', 'equatorial-guinea', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(241, 'Эритрея', 'Eritrea', 'ER', 'eritrea', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(242, 'Эсватини', 'Eswatini', 'SZ', 'eswatini', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(243, 'Эстония', 'Estonia', 'EE', 'estonia', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(244, 'Эфиопия', 'Ethiopia', 'ET', 'ethiopia', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(245, 'Южная Георгия и Южные Сандвичевы о-ва', 'South Georgia & South Sandwich Islands', 'GS', 'south-georgia-south-sandwich-islands', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(246, 'Южно-Африканская Республика', 'South Africa', 'ZA', 'south-africa', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(247, 'Южный Судан', 'South Sudan', 'SS', 'south-sudan', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(248, 'Ямайка', 'Jamaica', 'JM', 'jamaica', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(249, 'Япония', 'Japan', 'JP', 'japan', '2021-08-31 14:14:36', '2021-08-31 14:14:36');

-- 
-- Вывод данных для таблицы invoices
--
INSERT INTO invoices VALUES
(24, 8, '2021-00024', NULL, 0, 2, 'swift', 572, 'EUR', 'http://jobzz.loc/profile/payment/invoice/24/download', NULL, NULL, NULL, '{"payer":{"name":"Test Recruiter","phone":"","email":"","inn":"","country_id":"216","country":"Ukraine","street_address1":"Melitipol, Yaltinskaya, 86","eu_vat_id":"","postcode":""},"items":[{"id":6,"vacancy_id":1,"candidate_id":4,"recruiter_id":8,"invoice_id":null,"status":0,"status_text":null,"released_to_work":"2021-09-29T21:00:00.000000Z","pay_before":"2021-10-29T21:00:00.000000Z","amount":50000,"currency":"RUB","created_at":"2021-08-27T06:02:26.000000Z","updated_at":"2021-08-27T06:02:26.000000Z","deleted_at":null,"candidate_info":{"id":4,"first_name":"\\u0412\\u0430\\u0434\\u0438\\u043c","last_name":"\\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","type":"candidate","name":"\\u0412\\u0430\\u0434\\u0438\\u043c \\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","avatar_url":"\\/storage\\/userfiles\\/4\\/avatar\\/TDnXX5T3XfYFJMDuH2bsIIz3qJ3lFQf8gGV2bNsy.jpg","position":"Full Stack Web Developer","last_activity":"2021-08-27T06:02:30.000000Z","last_activity_title":"1 \\u0447\\u0430\\u0441 \\u043d\\u0430\\u0437\\u0430\\u0434","timezone":"America\\/New_York","is_online":false}}]}', '2021-08-27 10:49:20', '2021-08-27 10:49:20'),
(25, 8, '2021-00025', NULL, 1, 2, 'swift', 400, 'EUR', 'http://jobzz.loc/profile/payment/invoice/25/download', NULL, '2021-08-27 17:05:03', NULL, '{"payer":{"name":"Test Recruiter","phone":"","email":"","inn":"","country_id":"216","country":"Ukraine","street_address1":"Melitipol, Yaltinskaya, 86","eu_vat_id":"","postcode":""},"items":[{"id":7,"vacancy_id":1,"candidate_id":30,"recruiter_id":8,"invoice_id":null,"status":0,"status_text":null,"released_to_work":"2021-07-29T21:00:00.000000Z","pay_before":"2021-08-25T21:00:00.000000Z","amount":35000,"currency":"RUB","created_at":"2021-08-27T09:51:11.000000Z","updated_at":"2021-08-27T11:18:01.000000Z","deleted_at":null,"user_warn_sent":true,"admin_warn_sent":false,"candidate_info":{"id":30,"first_name":"\\u0406\\u043d\\u043e\\u043a\\u0435\\u043d\\u0442\\u0456\\u0439","last_name":"\\u0412\\u0435\\u043d\\u0456\\u0430\\u043c\\u0456\\u043d","type":"candidate","name":"\\u0406\\u043d\\u043e\\u043a\\u0435\\u043d\\u0442\\u0456\\u0439 \\u0412\\u0435\\u043d\\u0456\\u0430\\u043c\\u0456\\u043d","avatar_url":"\\/images\\/no-avatar.svg","position":"Fron-end","last_activity":"2021-07-15T20:15:49.000000Z","last_activity_title":"1 \\u043c\\u0435\\u0441\\u044f\\u0446 \\u043d\\u0430\\u0437\\u0430\\u0434","timezone":"Europe\\/Moscow","is_online":false}}]}', '2021-08-27 14:47:57', '2021-08-27 17:05:03'),
(26, 55, '2021-00026', NULL, 2, 3, 'invoice', 20000, 'RUB', NULL, NULL, NULL, NULL, '{"payer":{"name":"\\u0412\\u0430\\u0434\\u0438\\u043c \\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","phone":"","email":"","inn":"324234324","country_id":null,"country":"","street_address1":"","eu_vat_id":"","postcode":""},"items":[{"id":8,"vacancy_id":12,"candidate_id":63,"recruiter_id":55,"invoice_id":null,"status":0,"status_text":null,"released_to_work":"2021-09-29T21:00:00.000000Z","pay_before":"2021-10-29T21:00:00.000000Z","amount":20000,"currency":"RUB","created_at":"2021-09-16T05:08:30.000000Z","updated_at":"2021-09-16T05:08:30.000000Z","deleted_at":null,"user_warn_sent":false,"admin_warn_sent":false,"candidate_info":{"id":63,"first_name":"\\u0412\\u0430\\u0434\\u0438\\u043c","last_name":"\\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","type":"candidate","name":"\\u0412\\u0430\\u0434\\u0438\\u043c \\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","avatar_url":"\\/images\\/no-avatar.svg","has_avatar":"","initials":"\\u0412\\u041a","position":"C++ Developer","last_activity":"2021-09-15T13:36:24.000000Z","last_activity_title":"16 \\u0447\\u0430\\u0441\\u043e\\u0432 \\u043d\\u0430\\u0437\\u0430\\u0434","timezone":"America\\/New_York","is_online":false}}]}', '2021-09-16 08:56:26', '2021-09-16 08:58:24'),
(27, 55, '2021-00027', NULL, 2, 3, 'invoice', 20000, 'RUB', NULL, NULL, NULL, NULL, '{"payer":{"name":"\\u0412\\u0430\\u0434\\u0438\\u043c \\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","phone":"","email":"","inn":"324234324","country_id":null,"country":"","street_address1":"","eu_vat_id":"","postcode":""},"items":[{"id":8,"vacancy_id":12,"candidate_id":63,"recruiter_id":55,"invoice_id":26,"status":3,"status_text":null,"released_to_work":"2021-09-29T21:00:00.000000Z","pay_before":"2021-10-29T21:00:00.000000Z","amount":20000,"currency":"RUB","created_at":"2021-09-16T05:08:30.000000Z","updated_at":"2021-09-16T05:56:26.000000Z","deleted_at":null,"user_warn_sent":false,"admin_warn_sent":false,"candidate_info":{"id":63,"first_name":"\\u0412\\u0430\\u0434\\u0438\\u043c","last_name":"\\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","type":"candidate","name":"\\u0412\\u0430\\u0434\\u0438\\u043c \\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","avatar_url":"\\/images\\/no-avatar.svg","has_avatar":"","initials":"\\u0412\\u041a","position":"C++ Developer","last_activity":"2021-09-15T13:36:24.000000Z","last_activity_title":"16 \\u0447\\u0430\\u0441\\u043e\\u0432 \\u043d\\u0430\\u0437\\u0430\\u0434","timezone":"America\\/New_York","is_online":false}}]}', '2021-09-16 08:58:24', '2021-09-16 08:59:31'),
(28, 55, '2021-00028', NULL, 2, 3, 'invoice', 20000, 'RUB', NULL, NULL, NULL, NULL, '{"payer":{"name":"\\u0412\\u0430\\u0434\\u0438\\u043c \\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","phone":"","email":"","inn":"324234324","country_id":null,"country":"","street_address1":"","eu_vat_id":"","postcode":""},"items":[{"id":8,"vacancy_id":12,"candidate_id":63,"recruiter_id":55,"invoice_id":27,"status":3,"status_text":null,"released_to_work":"2021-09-29T21:00:00.000000Z","pay_before":"2021-10-29T21:00:00.000000Z","amount":20000,"currency":"RUB","created_at":"2021-09-16T05:08:30.000000Z","updated_at":"2021-09-16T05:58:24.000000Z","deleted_at":null,"user_warn_sent":false,"admin_warn_sent":false,"candidate_info":{"id":63,"first_name":"\\u0412\\u0430\\u0434\\u0438\\u043c","last_name":"\\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","type":"candidate","name":"\\u0412\\u0430\\u0434\\u0438\\u043c \\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","avatar_url":"\\/images\\/no-avatar.svg","has_avatar":"","initials":"\\u0412\\u041a","position":"C++ Developer","last_activity":"2021-09-15T13:36:24.000000Z","last_activity_title":"16 \\u0447\\u0430\\u0441\\u043e\\u0432 \\u043d\\u0430\\u0437\\u0430\\u0434","timezone":"America\\/New_York","is_online":false}}]}', '2021-09-16 08:59:31', '2021-09-16 09:01:38'),
(29, 55, '2021-00029', '202100029', 2, 3, 'invoice', 20000, 'RUB', 'https://api.tinkoff.ru/v1/sl?nonce=j1bHxuZJ&short_link=5wWyiwtFkCj', NULL, NULL, NULL, '{"payer":{"name":"\\u0412\\u0430\\u0434\\u0438\\u043c \\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0443","phone":"","email":"","inn":"501212395324","country_id":null,"country":"","street_address1":"","eu_vat_id":"","postcode":""},"items":[{"id":8,"vacancy_id":12,"candidate_id":63,"recruiter_id":55,"invoice_id":28,"status":3,"status_text":null,"released_to_work":"2021-09-29T21:00:00.000000Z","pay_before":"2021-10-29T21:00:00.000000Z","amount":20000,"currency":"RUB","created_at":"2021-09-16T05:08:30.000000Z","updated_at":"2021-09-16T05:59:31.000000Z","deleted_at":null,"user_warn_sent":false,"admin_warn_sent":false,"candidate_info":{"id":63,"first_name":"\\u0412\\u0430\\u0434\\u0438\\u043c","last_name":"\\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","type":"candidate","name":"\\u0412\\u0430\\u0434\\u0438\\u043c \\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","avatar_url":"\\/images\\/no-avatar.svg","has_avatar":"","initials":"\\u0412\\u041a","position":"C++ Developer","last_activity":"2021-09-15T13:36:24.000000Z","last_activity_title":"16 \\u0447\\u0430\\u0441\\u043e\\u0432 \\u043d\\u0430\\u0437\\u0430\\u0434","timezone":"America\\/New_York","is_online":false}}]}', '2021-09-16 09:01:38', '2021-09-25 10:25:57'),
(30, 55, '2021-00030', NULL, 2, 2, 'swift', 930, 'EUR', 'http://jobzz.loc/profile/payment/invoice/30/download', NULL, NULL, NULL, '{"payer":{"name":"\\u0440\\u0443\\u0441\\u043a\\u0438\\u0435 \\u0441\\u0438\\u043c\\u0432\\u043e\\u043b\\u044b","phone":"","email":"","inn":"","country_id":"172","country":"Russia","street_address1":"\\u0420\\u0443\\u0441\\u0441\\u043a\\u0438\\u0439 \\u0430\\u0434\\u0440\\u0435\\u0441","eu_vat_id":"","postcode":""},"items":[{"id":9,"vacancy_id":12,"candidate_id":32,"recruiter_id":55,"invoice_id":null,"status":0,"status_text":null,"released_to_work":"2021-09-29T21:00:00.000000Z","pay_before":"2021-10-29T21:00:00.000000Z","amount":80000,"currency":"RUB","created_at":"2021-09-16T06:04:52.000000Z","updated_at":"2021-09-16T06:04:52.000000Z","deleted_at":null,"user_warn_sent":false,"admin_warn_sent":false,"candidate_info":{"id":32,"first_name":"\\u0412\\u0430\\u043b\\u0435\\u0440\\u0438\\u044f","last_name":"\\u0413\\u0435\\u0440\\u0430\\u0441\\u0438\\u043c\\u043e\\u0432\\u0430","type":"candidate","name":"\\u0412\\u0430\\u043b\\u0435\\u0440\\u0438\\u044f \\u0413\\u0435\\u0440\\u0430\\u0441\\u0438\\u043c\\u043e\\u0432\\u0430","avatar_url":"\\/images\\/no-avatar.svg","has_avatar":"","initials":"\\u0412\\u0413","position":"Ruby\\/RoR Developer","last_activity":null,"last_activity_title":"","timezone":null,"is_online":false}}]}', '2021-09-16 09:06:24', '2021-09-25 10:25:57'),
(31, 55, '2021-00031', NULL, 2, 3, 'invoice', 4900, 'RUB', 'http://jobzz.loc/profile/payment/invoice/31/download', NULL, NULL, NULL, '{"payer":{"name":"\\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432 \\u0412\\u0430\\u0434\\u0438\\u043c","phone":"","email":"","inn":"3086013976","country_id":null,"country":"","street_address1":"","eu_vat_id":"","postcode":""},"items":[{"id":10,"vacancy_id":15,"candidate_id":64,"recruiter_id":55,"invoice_id":null,"status":0,"status_text":null,"released_to_work":"2021-09-22T21:00:00.000000Z","pay_before":"2021-10-22T21:00:00.000000Z","amount":4900,"currency":"RUB","created_at":"2021-09-20T11:55:44.000000Z","updated_at":"2021-09-20T11:55:44.000000Z","deleted_at":null,"user_warn_sent":false,"admin_warn_sent":false,"candidate_info":{"id":64,"first_name":"Test","last_name":"Payment","type":"candidate","name":"Test Payment","avatar_url":"\\/storage\\/userfiles\\/64\\/avatar\\/PLBdvbZUVG1zQZqbSozvlne3Std49cqdQhT4KID7.jpg","has_avatar":"1","initials":"TP","position":"Testing Payment","last_activity":"2021-09-24T12:29:27.000000Z","last_activity_title":"1 \\u0447\\u0430\\u0441 \\u043d\\u0430\\u0437\\u0430\\u0434","timezone":"America\\/New_York","is_online":false,"email":"candidate1@gmail.com"}}]}', '2021-09-24 16:33:48', '2021-09-25 10:25:57'),
(32, 55, '2021-00032', NULL, 2, 3, 'invoice', 104900, 'RUB', 'http://jobzz.loc/profile/payment/invoice/32/download', NULL, NULL, NULL, '{"payer":{"name":"\\u0412\\u0430\\u0434\\u0438\\u043c \\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","phone":"","email":"","inn":"3086013976","country_id":null,"country":"","street_address1":"","eu_vat_id":"","postcode":""},"items":[{"id":8,"vacancy_id":12,"candidate_id":63,"recruiter_id":55,"invoice_id":29,"status":3,"status_text":null,"released_to_work":"2021-09-29T21:00:00.000000Z","pay_before":"2021-10-29T21:00:00.000000Z","amount":20000,"currency":"RUB","created_at":"2021-09-16T05:08:30.000000Z","updated_at":"2021-09-16T06:01:38.000000Z","deleted_at":null,"user_warn_sent":false,"admin_warn_sent":false,"candidate_info":{"id":63,"first_name":"\\u0412\\u0430\\u0434\\u0438\\u043c","last_name":"\\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","type":"candidate","name":"\\u0412\\u0430\\u0434\\u0438\\u043c \\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","avatar_url":"\\/images\\/no-avatar.svg","has_avatar":"","initials":"\\u0412\\u041a","position":"C++ Developer \\/ Head Of Delivery \\/ Programm Manager \\/ Delivery Director","last_activity":"2021-09-16T07:21:28.000000Z","last_activity_title":"1 \\u043d\\u0435\\u0434\\u0435\\u043b\\u044e \\u043d\\u0430\\u0437\\u0430\\u0434","timezone":"America\\/New_York","is_online":false,"email":"vadox.dev@gmail.com"}},{"id":9,"vacancy_id":12,"candidate_id":32,"recruiter_id":55,"invoice_id":30,"status":3,"status_text":null,"released_to_work":"2021-09-29T21:00:00.000000Z","pay_before":"2021-10-29T21:00:00.000000Z","amount":80000,"currency":"RUB","created_at":"2021-09-16T06:04:52.000000Z","updated_at":"2021-09-16T06:06:24.000000Z","deleted_at":null,"user_warn_sent":false,"admin_warn_sent":false,"candidate_info":{"id":32,"first_name":"\\u0412\\u0430\\u043b\\u0435\\u0440\\u0438\\u044f","last_name":"\\u0413\\u0435\\u0440\\u0430\\u0441\\u0438\\u043c\\u043e\\u0432\\u0430","type":"candidate","name":"\\u0412\\u0430\\u043b\\u0435\\u0440\\u0438\\u044f \\u0413\\u0435\\u0440\\u0430\\u0441\\u0438\\u043c\\u043e\\u0432\\u0430","avatar_url":"\\/images\\/no-avatar.svg","has_avatar":"","initials":"\\u0412\\u0413","position":"Ruby\\/RoR Developer","last_activity":null,"last_activity_title":"","timezone":null,"is_online":false,"email":"dina07@example.net"}},{"id":10,"vacancy_id":15,"candidate_id":64,"recruiter_id":55,"invoice_id":31,"status":3,"status_text":null,"released_to_work":"2021-09-22T21:00:00.000000Z","pay_before":"2021-10-22T21:00:00.000000Z","amount":4900,"currency":"RUB","created_at":"2021-09-20T11:55:44.000000Z","updated_at":"2021-09-24T13:33:48.000000Z","deleted_at":null,"user_warn_sent":false,"admin_warn_sent":false,"candidate_info":{"id":64,"first_name":"Test","last_name":"Payment","type":"candidate","name":"Test Payment","avatar_url":"\\/storage\\/userfiles\\/64\\/avatar\\/PLBdvbZUVG1zQZqbSozvlne3Std49cqdQhT4KID7.jpg","has_avatar":"1","initials":"TP","position":"Testing Payment","last_activity":"2021-09-25T07:23:39.000000Z","last_activity_title":"2 \\u043c\\u0438\\u043d\\u0443\\u0442\\u044b \\u043d\\u0430\\u0437\\u0430\\u0434","timezone":"America\\/New_York","is_online":true,"email":"candidate1@gmail.com"}}]}', '2021-09-25 10:25:57', '2021-10-08 15:51:34'),
(33, 62, '2021-00033', NULL, 0, 3, 'invoice', 35000, 'RUB', 'http://jobzz.loc/profile/payment/invoice/33/download', NULL, NULL, NULL, '{"payer":{"name":"Vadim Krachulove","phone":"","email":"","inn":"3086013976","country_id":null,"country":"","street_address1":"","eu_vat_id":"","postcode":""},"items":[{"id":11,"vacancy_id":50,"candidate_id":64,"recruiter_id":62,"invoice_id":null,"status":0,"status_text":null,"released_to_work":"2021-10-20T21:00:00.000000Z","pay_before":"2021-11-20T21:00:00.000000Z","amount":35000,"currency":"RUB","created_at":"2021-10-07T08:32:05.000000Z","updated_at":"2021-10-07T08:32:05.000000Z","deleted_at":null,"user_warn_sent":false,"admin_warn_sent":false,"candidate_info":{"id":64,"first_name":"Test","last_name":"Payment","type":"candidate","name":"Test Payment","avatar_url":"\\/storage\\/userfiles\\/64\\/avatar\\/PLBdvbZUVG1zQZqbSozvlne3Std49cqdQhT4KID7.jpg","has_avatar":"1","initials":"TP","position":"Testing Payment","last_activity":"2021-10-07T08:28:26.000000Z","last_activity_title":"4 \\u043c\\u0438\\u043d\\u0443\\u0442\\u044b \\u043d\\u0430\\u0437\\u0430\\u0434","timezone":"America\\/New_York","is_online":true,"email":"candidate1@gmail.com"}}]}', '2021-10-07 11:33:22', '2021-10-07 11:33:22'),
(34, 55, '2021-00034', NULL, 2, 3, 'invoice', 4900, 'RUB', 'http://jobzz.loc/profile/payment/invoice/34/download', NULL, NULL, NULL, '{"payer":{"name":"\\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432 \\u0412\\u0430\\u0434\\u0438\\u043c","phone":"","email":"","inn":"3086013976","country_id":null,"country":"","street_address1":"","eu_vat_id":"","postcode":""},"items":[{"id":10,"vacancy_id":15,"candidate_id":64,"recruiter_id":55,"invoice_id":32,"status":3,"status_text":null,"released_to_work":"2021-09-22T21:00:00.000000Z","pay_before":"2021-10-22T21:00:00.000000Z","paid_at":null,"amount":4900,"currency":"RUB","act":null,"created_at":"2021-09-20T11:55:44.000000Z","updated_at":"2021-09-25T07:25:57.000000Z","deleted_at":null,"user_warn_sent":false,"admin_warn_sent":false,"candidate_info":{"id":64,"first_name":"Test","last_name":"Payment","type":"candidate","name":"Payment Test","avatar_url":"\\/storage\\/userfiles\\/64\\/avatar\\/PLBdvbZUVG1zQZqbSozvlne3Std49cqdQhT4KID7.jpg","has_avatar":"1","initials":"TP","position":"Testing Payment","last_activity":"2021-10-07T08:35:30.000000Z","last_activity_title":"1 \\u0434\\u0435\\u043d\\u044c \\u043d\\u0430\\u0437\\u0430\\u0434","timezone":"America\\/New_York","is_online":false,"email":"candidate1@gmail.com"}}]}', '2021-10-08 15:51:34', '2021-10-08 15:52:11'),
(35, 55, '2021-00035', NULL, 2, 2, 'swift', 68, 'USD', 'http://jobzz.loc/profile/payment/invoice/35/download', NULL, NULL, NULL, '{"payer":{"name":"\\u041a\\u044b\\u0432\\u0430\\u044b\\u0432 \\u0424\\u0412\\u0410","phone":"","email":"","inn":"","country_id":"172","country":"Russia","street_address1":"\\u0444\\u0432\\u0430\\u044b\\u0432\\u0444\\u0430","eu_vat_id":"","postcode":""},"items":[{"id":10,"vacancy_id":15,"candidate_id":64,"recruiter_id":55,"invoice_id":34,"status":3,"status_text":null,"released_to_work":"2021-09-22T21:00:00.000000Z","pay_before":"2021-10-22T21:00:00.000000Z","paid_at":null,"amount":4900,"currency":"RUB","act":null,"created_at":"2021-09-20T11:55:44.000000Z","updated_at":"2021-10-08T12:51:34.000000Z","deleted_at":null,"user_warn_sent":false,"admin_warn_sent":false,"candidate_info":{"id":64,"first_name":"Test","last_name":"Payment","type":"candidate","name":"Payment Test","avatar_url":"\\/storage\\/userfiles\\/64\\/avatar\\/PLBdvbZUVG1zQZqbSozvlne3Std49cqdQhT4KID7.jpg","has_avatar":"1","initials":"TP","position":"Testing Payment","last_activity":"2021-10-07T08:35:30.000000Z","last_activity_title":"1 \\u0434\\u0435\\u043d\\u044c \\u043d\\u0430\\u0437\\u0430\\u0434","timezone":"America\\/New_York","is_online":false,"email":"candidate1@gmail.com"}}]}', '2021-10-08 15:52:11', '2021-10-15 10:25:11'),
(36, 55, '2021-00036', NULL, 2, 1, 'card', 4900, 'RUB', NULL, NULL, NULL, NULL, '{"payer":{"name":"\\u0414\\u0438\\u043d\\u0430 \\u0428\\u0443\\u0431\\u0438\\u043d\\u0430","phone":"+380978623299","email":"vadox.dev@gmail.com","inn":"","country_id":null,"country":"","street_address1":"\\u042f\\u043b\\u0442\\u0438\\u043d\\u0441\\u043a\\u0430\\u044f, 86","eu_vat_id":"","postcode":"72311"},"items":[{"id":10,"vacancy_id":15,"candidate_id":64,"recruiter_id":55,"invoice_id":35,"status":3,"status_text":null,"released_to_work":"2021-09-22T21:00:00.000000Z","pay_before":"2021-10-22T21:00:00.000000Z","paid_at":null,"amount":4900,"currency":"RUB","act":null,"created_at":"2021-09-20T11:55:44.000000Z","updated_at":"2021-10-08T12:52:11.000000Z","deleted_at":null,"user_warn_sent":false,"admin_warn_sent":false,"candidate_info":{"id":64,"first_name":"Test","last_name":"Payment","type":"candidate","name":"Payment Test","avatar_url":"\\/storage\\/userfiles\\/64\\/avatar\\/PLBdvbZUVG1zQZqbSozvlne3Std49cqdQhT4KID7.jpg","has_avatar":"1","initials":"TP","position":"Testing Payment","last_activity":"2021-10-07T08:35:30.000000Z","last_activity_title":"1 \\u043d\\u0435\\u0434\\u0435\\u043b\\u044e \\u043d\\u0430\\u0437\\u0430\\u0434","timezone":"America\\/New_York","is_online":false,"email":"candidate1@gmail.com"}}]}', '2021-10-15 10:25:11', '2021-10-15 10:27:03'),
(37, 55, '2021-00037', '100523', 2, 1, 'card', 4900, 'RUB', NULL, NULL, NULL, NULL, '{"payer":{"name":"\\u0414\\u0438\\u043d\\u0430 \\u0428\\u0443\\u0431\\u0438\\u043d\\u0430","phone":"+380978623299","email":"vadox.dev@gmail.com","inn":"","country_id":null,"country":"","street_address1":"\\u042f\\u043b\\u0442\\u0438\\u043d\\u0441\\u043a\\u0430\\u044f, 86","eu_vat_id":"","postcode":"72311"},"items":[{"id":10,"vacancy_id":15,"candidate_id":64,"recruiter_id":55,"invoice_id":36,"status":3,"status_text":null,"released_to_work":"2021-09-22T21:00:00.000000Z","pay_before":"2021-10-22T21:00:00.000000Z","paid_at":null,"amount":4900,"currency":"RUB","act":null,"created_at":"2021-09-20T11:55:44.000000Z","updated_at":"2021-10-15T07:25:11.000000Z","deleted_at":null,"user_warn_sent":false,"admin_warn_sent":false,"candidate_info":{"id":64,"first_name":"Test","last_name":"Payment","type":"candidate","name":"Payment Test","avatar_url":"\\/storage\\/userfiles\\/64\\/avatar\\/PLBdvbZUVG1zQZqbSozvlne3Std49cqdQhT4KID7.jpg","has_avatar":"1","initials":"TP","position":"Testing Payment","last_activity":"2021-10-07T08:35:30.000000Z","last_activity_title":"1 \\u043d\\u0435\\u0434\\u0435\\u043b\\u044e \\u043d\\u0430\\u0437\\u0430\\u0434","timezone":"America\\/New_York","is_online":false,"email":"candidate1@gmail.com"}}]}', '2021-10-15 10:27:03', '2021-10-15 10:29:28'),
(38, 55, '2021-00038', NULL, 2, 1, 'card', 4900, 'RUB', NULL, NULL, NULL, NULL, '{"payer":{"name":"\\u0412\\u0430\\u0434\\u0438\\u043c \\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","phone":"+380978623299","email":"vadox.dev@gmail.com","inn":"","country_id":null,"country":"","street_address1":"\\u042f\\u043b\\u0442\\u0438\\u043d\\u0441\\u043a\\u0430\\u044f, 86","eu_vat_id":"","postcode":"72311"},"items":[{"id":10,"vacancy_id":15,"candidate_id":64,"recruiter_id":55,"invoice_id":37,"status":3,"status_text":null,"released_to_work":"2021-09-22T21:00:00.000000Z","pay_before":"2021-10-22T21:00:00.000000Z","paid_at":null,"amount":4900,"currency":"RUB","act":null,"created_at":"2021-09-20T11:55:44.000000Z","updated_at":"2021-10-15T07:27:04.000000Z","deleted_at":null,"user_warn_sent":false,"admin_warn_sent":false,"candidate_info":{"id":64,"first_name":"Test","last_name":"Payment","type":"candidate","name":"Payment Test","avatar_url":"\\/storage\\/userfiles\\/64\\/avatar\\/PLBdvbZUVG1zQZqbSozvlne3Std49cqdQhT4KID7.jpg","has_avatar":"1","initials":"TP","position":"Testing Payment","last_activity":"2021-10-07T08:35:30.000000Z","last_activity_title":"1 \\u043d\\u0435\\u0434\\u0435\\u043b\\u044e \\u043d\\u0430\\u0437\\u0430\\u0434","timezone":"America\\/New_York","is_online":false,"email":"candidate1@gmail.com"}}]}', '2021-10-15 10:29:28', '2021-10-15 14:47:28'),
(39, 55, '2021-00039', NULL, 2, 1, 'card', 10, 'RUB', NULL, NULL, NULL, NULL, '{"payer":{"name":"\\u0412\\u0430\\u0434\\u0438\\u043c \\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","phone":"+380978623299","email":"vadox.dev@gmail.com","inn":"","country_id":null,"country":"","street_address1":"\\u042f\\u043b\\u0442\\u0438\\u043d\\u0441\\u043a\\u0430\\u044f, 86","eu_vat_id":"","postcode":"72311"},"items":[{"id":10,"vacancy_id":15,"candidate_id":64,"recruiter_id":55,"invoice_id":38,"status":3,"status_text":null,"released_to_work":"2021-09-22T21:00:00.000000Z","pay_before":"2021-10-09T21:00:00.000000Z","paid_at":null,"amount":10,"currency":"RUB","act":null,"created_at":"2021-09-20T11:55:44.000000Z","updated_at":"2021-10-15T11:32:10.000000Z","deleted_at":null,"user_warn_sent":true,"admin_warn_sent":false,"candidate_info":{"id":64,"first_name":"Test","last_name":"Payment","type":"candidate","name":"Payment Test","avatar_url":"\\/storage\\/userfiles\\/64\\/avatar\\/PLBdvbZUVG1zQZqbSozvlne3Std49cqdQhT4KID7.jpg","has_avatar":"1","initials":"TP","position":"Testing Payment","last_activity":"2021-10-07T08:35:30.000000Z","last_activity_title":"1 \\u043d\\u0435\\u0434\\u0435\\u043b\\u044e \\u043d\\u0430\\u0437\\u0430\\u0434","timezone":"America\\/New_York","is_online":false,"email":"candidate1@gmail.com"}}]}', '2021-10-15 14:47:28', '2021-10-15 14:48:40'),
(40, 55, '2021-00040', NULL, 2, 1, 'card', 10, 'RUB', NULL, NULL, NULL, NULL, '{"payer":{"name":"\\u0412\\u0430\\u0434\\u0438\\u043c \\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","phone":"+380978623299","email":"vadox.dev@gmail.com","inn":"","country_id":null,"country":"","street_address1":"\\u042f\\u043b\\u0442\\u0438\\u043d\\u0441\\u043a\\u0430\\u044f, 86","eu_vat_id":"","postcode":"72311"},"items":[{"id":10,"vacancy_id":15,"candidate_id":64,"recruiter_id":55,"invoice_id":39,"status":3,"status_text":null,"released_to_work":"2021-09-22T21:00:00.000000Z","pay_before":"2021-10-09T21:00:00.000000Z","paid_at":null,"amount":10,"currency":"RUB","act":null,"created_at":"2021-09-20T11:55:44.000000Z","updated_at":"2021-10-15T11:47:28.000000Z","deleted_at":null,"user_warn_sent":true,"admin_warn_sent":false,"candidate_info":{"id":64,"first_name":"Test","last_name":"Payment","type":"candidate","name":"Payment Test","avatar_url":"\\/storage\\/userfiles\\/64\\/avatar\\/PLBdvbZUVG1zQZqbSozvlne3Std49cqdQhT4KID7.jpg","has_avatar":"1","initials":"TP","position":"Testing Payment","last_activity":"2021-10-07T08:35:30.000000Z","last_activity_title":"1 \\u043d\\u0435\\u0434\\u0435\\u043b\\u044e \\u043d\\u0430\\u0437\\u0430\\u0434","timezone":"America\\/New_York","is_online":false,"email":"candidate1@gmail.com"}}]}', '2021-10-15 14:48:40', '2021-10-15 15:30:45'),
(41, 55, '2021-00041', NULL, 2, 1, 'card', 10, 'RUB', NULL, NULL, NULL, NULL, '{"payer":{"name":"\\u0412\\u0430\\u0434\\u0438\\u043c \\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","phone":"+380978623299","email":"vadox.dev@gmail.com","inn":"","country_id":null,"country":"","street_address1":"\\u042f\\u043b\\u0442\\u0438\\u043d\\u0441\\u043a\\u0430\\u044f, 86","eu_vat_id":"","postcode":"72311"},"items":[{"id":10,"vacancy_id":15,"candidate_id":64,"recruiter_id":55,"invoice_id":40,"status":3,"status_text":null,"released_to_work":"2021-09-22T21:00:00.000000Z","pay_before":"2021-10-09T21:00:00.000000Z","paid_at":null,"amount":10,"currency":"RUB","act":null,"created_at":"2021-09-20T11:55:44.000000Z","updated_at":"2021-10-15T11:48:40.000000Z","deleted_at":null,"user_warn_sent":true,"admin_warn_sent":false,"candidate_info":{"id":64,"first_name":"Test","last_name":"Payment","type":"candidate","name":"Payment Test","avatar_url":"\\/storage\\/userfiles\\/64\\/avatar\\/PLBdvbZUVG1zQZqbSozvlne3Std49cqdQhT4KID7.jpg","has_avatar":"1","initials":"TP","position":"Testing Payment","last_activity":"2021-10-07T08:35:30.000000Z","last_activity_title":"1 \\u043d\\u0435\\u0434\\u0435\\u043b\\u044e \\u043d\\u0430\\u0437\\u0430\\u0434","timezone":"America\\/New_York","is_online":false,"email":"candidate1@gmail.com"}}]}', '2021-10-15 15:30:45', '2021-10-15 15:31:09'),
(42, 55, '2021-00042', NULL, 2, 1, 'card', 10, 'RUB', NULL, NULL, NULL, NULL, '{"payer":{"name":"\\u0412\\u0430\\u0434\\u0438\\u043c \\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","phone":"+380978623299","email":"vadox.dev@gmail.com","inn":"","country_id":null,"country":"","street_address1":"\\u042f\\u043b\\u0442\\u0438\\u043d\\u0441\\u043a\\u0430\\u044f, 86","eu_vat_id":"","postcode":"72311"},"items":[{"id":10,"vacancy_id":15,"candidate_id":64,"recruiter_id":55,"invoice_id":41,"status":3,"status_text":null,"released_to_work":"2021-09-22T21:00:00.000000Z","pay_before":"2021-10-09T21:00:00.000000Z","paid_at":null,"amount":10,"currency":"RUB","act":null,"created_at":"2021-09-20T11:55:44.000000Z","updated_at":"2021-10-15T12:30:45.000000Z","deleted_at":null,"user_warn_sent":true,"admin_warn_sent":false,"candidate_info":{"id":64,"first_name":"Test","last_name":"Payment","type":"candidate","name":"Payment Test","avatar_url":"\\/storage\\/userfiles\\/64\\/avatar\\/PLBdvbZUVG1zQZqbSozvlne3Std49cqdQhT4KID7.jpg","has_avatar":"1","initials":"TP","position":"Testing Payment","last_activity":"2021-10-07T08:35:30.000000Z","last_activity_title":"1 \\u043d\\u0435\\u0434\\u0435\\u043b\\u044e \\u043d\\u0430\\u0437\\u0430\\u0434","timezone":"America\\/New_York","is_online":false,"email":"candidate1@gmail.com"}}]}', '2021-10-15 15:31:09', '2021-10-15 15:33:11'),
(43, 55, '2021-00043', NULL, 2, 1, 'card', 10, 'RUB', NULL, NULL, NULL, NULL, '{"payer":{"name":"\\u0412\\u0430\\u0434\\u0438\\u043c \\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","phone":"+380978623299","email":"vadox.dev@gmail.com","inn":"","country_id":null,"country":"","street_address1":"\\u042f\\u043b\\u0442\\u0438\\u043d\\u0441\\u043a\\u0430\\u044f, 86","eu_vat_id":"","postcode":"72311"},"items":[{"id":10,"vacancy_id":15,"candidate_id":64,"recruiter_id":55,"invoice_id":42,"status":3,"status_text":null,"released_to_work":"2021-09-22T21:00:00.000000Z","pay_before":"2021-10-09T21:00:00.000000Z","paid_at":null,"amount":10,"currency":"RUB","act":null,"created_at":"2021-09-20T11:55:44.000000Z","updated_at":"2021-10-15T12:31:09.000000Z","deleted_at":null,"user_warn_sent":true,"admin_warn_sent":false,"candidate_info":{"id":64,"first_name":"Test","last_name":"Payment","type":"candidate","name":"Payment Test","avatar_url":"\\/storage\\/userfiles\\/64\\/avatar\\/PLBdvbZUVG1zQZqbSozvlne3Std49cqdQhT4KID7.jpg","has_avatar":"1","initials":"TP","position":"Testing Payment","last_activity":"2021-10-07T08:35:30.000000Z","last_activity_title":"1 \\u043d\\u0435\\u0434\\u0435\\u043b\\u044e \\u043d\\u0430\\u0437\\u0430\\u0434","timezone":"America\\/New_York","is_online":false,"email":"candidate1@gmail.com"}}]}', '2021-10-15 15:33:11', '2021-10-15 15:41:53'),
(44, 55, '2021-00044', '786587776', 2, 1, 'card', 10, 'RUB', NULL, NULL, NULL, NULL, '{"payer":{"name":"\\u0412\\u0430\\u0434\\u0438\\u043c \\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","phone":"+380978623299","email":"vadox.dev@gmail.com","inn":"","country_id":null,"country":"","street_address1":"\\u042f\\u043b\\u0442\\u0438\\u043d\\u0441\\u043a\\u0430\\u044f, 86","eu_vat_id":"","postcode":"72311"},"items":[{"id":10,"vacancy_id":15,"candidate_id":64,"recruiter_id":55,"invoice_id":43,"status":3,"status_text":null,"released_to_work":"2021-09-22T21:00:00.000000Z","pay_before":"2021-10-09T21:00:00.000000Z","paid_at":null,"amount":10,"currency":"RUB","act":null,"created_at":"2021-09-20T11:55:44.000000Z","updated_at":"2021-10-15T12:33:11.000000Z","deleted_at":null,"user_warn_sent":true,"admin_warn_sent":false,"candidate_info":{"id":64,"first_name":"Test","last_name":"Payment","type":"candidate","name":"Payment Test","avatar_url":"\\/storage\\/userfiles\\/64\\/avatar\\/PLBdvbZUVG1zQZqbSozvlne3Std49cqdQhT4KID7.jpg","has_avatar":"1","initials":"TP","position":"Testing Payment","last_activity":"2021-10-07T08:35:30.000000Z","last_activity_title":"1 \\u043d\\u0435\\u0434\\u0435\\u043b\\u044e \\u043d\\u0430\\u0437\\u0430\\u0434","timezone":"America\\/New_York","is_online":false,"email":"candidate1@gmail.com"}}]}', '2021-10-15 15:41:53', '2021-10-15 15:55:15'),
(45, 55, '2021-00045', '786622470', 2, 1, 'card', 1, 'RUB', NULL, NULL, NULL, NULL, '{"payer":{"name":"\\u0412\\u0430\\u0434\\u0438\\u043c \\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","phone":"+380978623299","email":"vadox.dev@gmail.com","inn":"","country_id":null,"country":"","street_address1":"\\u042f\\u043b\\u0442\\u0438\\u043d\\u0441\\u043a\\u0430\\u044f, 86","eu_vat_id":"","postcode":"72311"},"items":[{"id":10,"vacancy_id":15,"candidate_id":64,"recruiter_id":55,"invoice_id":44,"status":3,"status_text":null,"released_to_work":"2021-09-22T21:00:00.000000Z","pay_before":"2021-10-09T21:00:00.000000Z","paid_at":null,"amount":1,"currency":"RUB","act":null,"created_at":"2021-09-20T11:55:44.000000Z","updated_at":"2021-10-15T12:41:53.000000Z","deleted_at":null,"user_warn_sent":true,"admin_warn_sent":false,"candidate_info":{"id":64,"first_name":"Test","last_name":"Payment","type":"candidate","name":"Payment Test","avatar_url":"\\/storage\\/userfiles\\/64\\/avatar\\/PLBdvbZUVG1zQZqbSozvlne3Std49cqdQhT4KID7.jpg","has_avatar":"1","initials":"TP","position":"Testing Payment","last_activity":"2021-10-07T08:35:30.000000Z","last_activity_title":"1 \\u043d\\u0435\\u0434\\u0435\\u043b\\u044e \\u043d\\u0430\\u0437\\u0430\\u0434","timezone":"America\\/New_York","is_online":false,"email":"candidate1@gmail.com"}}]}', '2021-10-15 15:55:15', '2021-10-15 17:12:59'),
(46, 55, '2021-00046', NULL, 2, 1, 'card', 1, 'RUB', NULL, NULL, NULL, NULL, '{"payer":{"name":"\\u0412\\u0430\\u0434\\u0438\\u043c \\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","phone":"+380978623299","email":"vadox.dev@gmail.com","inn":"","country_id":null,"country":"","street_address1":"\\u042f\\u043b\\u0442\\u0438\\u043d\\u0441\\u043a\\u0430\\u044f, 86","eu_vat_id":"","postcode":"72311"},"items":[{"id":10,"vacancy_id":15,"candidate_id":64,"recruiter_id":55,"invoice_id":45,"status":3,"status_text":null,"released_to_work":"2021-09-22T21:00:00.000000Z","pay_before":"2021-10-09T21:00:00.000000Z","paid_at":null,"amount":1,"currency":"RUB","act":null,"created_at":"2021-09-20T11:55:44.000000Z","updated_at":"2021-10-15T12:55:15.000000Z","deleted_at":null,"user_warn_sent":true,"admin_warn_sent":false,"candidate_info":{"id":64,"first_name":"Test","last_name":"Payment","type":"candidate","name":"Payment Test","avatar_url":"\\/storage\\/userfiles\\/64\\/avatar\\/PLBdvbZUVG1zQZqbSozvlne3Std49cqdQhT4KID7.jpg","has_avatar":"1","initials":"TP","position":"Testing Payment","last_activity":"2021-10-07T08:35:30.000000Z","last_activity_title":"1 \\u043d\\u0435\\u0434\\u0435\\u043b\\u044e \\u043d\\u0430\\u0437\\u0430\\u0434","timezone":"America\\/New_York","is_online":false,"email":"candidate1@gmail.com"}}]}', '2021-10-15 17:13:00', '2021-10-15 17:16:19'),
(47, 55, '2021-00047', '786852861', 0, 1, 'card', 1, 'RUB', NULL, NULL, NULL, NULL, '{"payer":{"name":"\\u0412\\u0430\\u0434\\u0438\\u043c \\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","phone":"+380978623299","email":"vadox.dev@gmail.com","inn":"","country_id":null,"country":"","street_address1":"\\u042f\\u043b\\u0442\\u0438\\u043d\\u0441\\u043a\\u0430\\u044f, 86","eu_vat_id":"","postcode":"72311"},"items":[{"id":10,"vacancy_id":15,"candidate_id":64,"recruiter_id":55,"invoice_id":46,"status":3,"status_text":null,"released_to_work":"2021-09-22T21:00:00.000000Z","pay_before":"2021-10-09T21:00:00.000000Z","paid_at":null,"amount":1,"currency":"RUB","act":null,"created_at":"2021-09-20T11:55:44.000000Z","updated_at":"2021-10-15T14:13:00.000000Z","deleted_at":null,"user_warn_sent":true,"admin_warn_sent":false,"candidate_info":{"id":64,"first_name":"Test","last_name":"Payment","type":"candidate","name":"Payment Test","avatar_url":"\\/storage\\/userfiles\\/64\\/avatar\\/PLBdvbZUVG1zQZqbSozvlne3Std49cqdQhT4KID7.jpg","has_avatar":"1","initials":"TP","position":"Testing Payment","last_activity":"2021-10-07T08:35:30.000000Z","last_activity_title":"1 \\u043d\\u0435\\u0434\\u0435\\u043b\\u044e \\u043d\\u0430\\u0437\\u0430\\u0434","timezone":"America\\/New_York","is_online":false,"email":"candidate1@gmail.com"}}]}', '2021-10-15 17:16:20', '2021-10-15 17:16:20'),
(48, 76, '2021-00048', '202100048', 2, 3, 'invoice', 20000, 'RUB', 'https://api.tinkoff.ru/v1/sl?nonce=hQ75prgq&short_link=9ZmoekF0yn7', NULL, NULL, NULL, '{"payer":{"name":"Test","phone":"","email":"","inn":"380978623299","country_id":null,"country":"","street_address1":"","eu_vat_id":"","postcode":""},"items":[{"id":13,"vacancy_id":60,"candidate_id":68,"recruiter_id":76,"invoice_id":null,"status":0,"status_text":null,"released_to_work":"2021-11-25T19:00:00.000000Z","pay_before":"2021-12-25T19:00:00.000000Z","paid_at":null,"amount":20000,"currency":"RUB","act":null,"created_at":"2021-11-01T06:19:04.000000Z","updated_at":"2021-11-01T06:19:04.000000Z","deleted_at":null,"user_warn_sent":false,"admin_warn_sent":false,"candidate_info":{"id":68,"first_name":"\\u0412\\u0430\\u0434\\u0438\\u043c","last_name":"\\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","type":"candidate","name":"\\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432 \\u0412\\u0430\\u0434\\u0438\\u043c","avatar_url":"\\/images\\/no-avatar.svg","has_avatar":"","initials":"\\u0412\\u041a","position":"PHP Developer","last_activity":"2021-10-26T14:06:04.000000Z","last_activity_title":"5 \\u0434\\u043d\\u0435\\u0439 \\u043d\\u0430\\u0437\\u0430\\u0434","timezone":"America\\/New_York","is_online":false,"email":"vadox.dev@gmail.com"}}]}', '2021-11-01 09:24:00', '2021-11-01 09:46:01'),
(49, 76, '2021-00049', NULL, 2, 1, 'card', 20000, 'RUB', NULL, NULL, NULL, NULL, '{"payer":{"name":"Test","phone":"","email":"","inn":"","country_id":null,"country":"","street_address1":"","eu_vat_id":"","postcode":""},"items":[{"id":13,"vacancy_id":60,"candidate_id":68,"recruiter_id":76,"invoice_id":48,"status":3,"status_text":null,"released_to_work":"2021-11-25T19:00:00.000000Z","pay_before":"2021-12-25T19:00:00.000000Z","paid_at":null,"amount":20000,"currency":"RUB","act":null,"created_at":"2021-11-01T06:19:04.000000Z","updated_at":"2021-11-01T06:24:00.000000Z","deleted_at":null,"user_warn_sent":false,"admin_warn_sent":false,"candidate_info":{"id":68,"first_name":"\\u0412\\u0430\\u0434\\u0438\\u043c","last_name":"\\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","type":"candidate","name":"\\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432 \\u0412\\u0430\\u0434\\u0438\\u043c","avatar_url":"\\/images\\/no-avatar.svg","has_avatar":"","initials":"\\u0412\\u041a","position":"PHP Developer","last_activity":"2021-10-26T14:06:04.000000Z","last_activity_title":"5 \\u0434\\u043d\\u0435\\u0439 \\u043d\\u0430\\u0437\\u0430\\u0434","timezone":"America\\/New_York","is_online":false,"email":"vadox.dev@gmail.com"}}]}', '2021-11-01 09:46:01', '2021-11-01 09:51:42'),
(50, 76, '2021-00050', '818686624', 0, 1, 'card', 20000, 'RUB', NULL, NULL, NULL, NULL, '{"payer":{"name":"\\u0412\\u0430\\u0434\\u0438\\u043c \\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","phone":"+380978623299","email":"vadox.dev@gmail.com","inn":"","country_id":null,"country":"","street_address1":"\\u042f\\u043b\\u0442\\u0438\\u043d\\u0441\\u043a\\u0430\\u044f, 86","eu_vat_id":"","postcode":"72311"},"items":[{"id":13,"vacancy_id":60,"candidate_id":68,"recruiter_id":76,"invoice_id":49,"status":3,"status_text":null,"released_to_work":"2021-11-25T19:00:00.000000Z","pay_before":"2021-12-25T19:00:00.000000Z","paid_at":null,"amount":20000,"currency":"RUB","act":null,"created_at":"2021-11-01T06:19:04.000000Z","updated_at":"2021-11-01T06:46:01.000000Z","deleted_at":null,"user_warn_sent":false,"admin_warn_sent":false,"candidate_info":{"id":68,"first_name":"\\u0412\\u0430\\u0434\\u0438\\u043c","last_name":"\\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432","type":"candidate","name":"\\u041a\\u0440\\u0430\\u0447\\u0443\\u043b\\u043e\\u0432 \\u0412\\u0430\\u0434\\u0438\\u043c","avatar_url":"\\/images\\/no-avatar.svg","has_avatar":"","initials":"\\u0412\\u041a","position":"PHP Developer","last_activity":"2021-10-26T14:06:04.000000Z","last_activity_title":"5 \\u0434\\u043d\\u0435\\u0439 \\u043d\\u0430\\u0437\\u0430\\u0434","timezone":"America\\/New_York","is_online":false,"email":"vadox.dev@gmail.com"}}]}', '2021-11-01 09:51:42', '2021-11-01 09:51:43');

-- 
-- Вывод данных для таблицы vacancies
--
INSERT INTO vacancies VALUES
(1, 53, 1, 1, NULL, 'Node.js Developer', '1-nodejs-developer', 'Весь следующий день посвящен был визитам; приезжий отправился делать визиты всем городским сановникам. Был с почтением у губернатора, и у губернатора, который, как оказалось, подобно Чичикову был ни толст, ни слишком тонок; нельзя сказать, чтобы стар, однако ж и не так, как стоит — действительно в ревизской сказке. Я привык ни в городе за одним разом все — вышли губы, большим сверлом ковырнула глаза и, не обскобливши, пустила на свет, сказавши: «Живет!» Такой же самый крепкий и на вечеринке.', 'Вздор! — сказал белокурый. — В таком случае позвольте мне вас попросить в мой кабинет, — сказал Чичиков, отчасти недовольный таким — смехом. Но Ноздрев продолжал хохотать во все горло, приговаривая: — Ой, пощади, право, тресну со смеху! — Ничего нет смешного: я дал ему слово, — сказал он наконец, высунувшись из брички. — — все было пригнано плотно и как бы за живой предмет, и что уже начало было сделано, и оба почти в одно время два лица: женское, в венце, узкое, длинное, как огурец, и мужское, круглое, широкое, как молдаванские тыквы, называемые горлянками, изо которых делают на Руси не было числа; промеж них расхаживал петух мерными шагами, потряхивая гребнем и поворачивая голову набок, как будто их кто-нибудь вымазал медом. Минуту спустя вошла хозяйка женщина пожилых лет, в каком-то спальном чепце, надетом наскоро, с фланелью на шее, одна из достойнейших женщин, каких только я знаю, — произнесла хозяйка с расстановкой. — Ведь я — отыграл бы все, то есть чтению книг, содержанием которых не затруднялся: ему было совершенно все равно, похождение ли влюбленного героя, просто букварь или молитвенник, — он готовился отведать черкесского чубука своего хозяина, и бог знает какое жалованье; другой отхватывал наскоро, как пономарь; промеж них расхаживал петух мерными шагами, потряхивая гребнем и поворачивая голову набок, как будто выгодно, да только уж слишком новое и небывалое; а потому начала сильно побаиваться, чтобы как-нибудь не надул ее этот покупщик; приехал же бог знает откуда, я тоже здесь живу… А — сколько было, брат, карет, и все помню; ты ее только перекрасишь, и будет чудо бричка. «Эк его неугомонный бес как обуял!» — подумал про себя Чичиков, — и явился где-нибудь в конце города дом, купленный на имя жены, потом в другом кафтане кажется им другим человеком. Между тем сидевшие в коляске дамы глядели на все четыре лапы, нюхал землю. — Вот щенок! — — Прощайте, матушка! А что же, где ваша девчонка? — Эй, Порфирий, — принеси-ка сюда шашечницу. — Напрасен труд, я не то ясный, не то мрачный, а какого-то светло-серого цвета, какой бывает только на одной из них, надевавшийся дотоле почти всегда в разодранном виде, так что он совершил свое поприще, как совершают его все господские приказчики: был прежде просто грамотным мальчишкой в доме, потом женился на какой-нибудь Агашке-ключнице, барыниной фаворитке, сделался сам ключником, а там уже хозяйственная часть. А иногда бывает и так, что прежде хозяйственная часть, то есть именно такая, как бывают гостиницы в.', 2, 5, 100000, 300000, 0, 0, 0, '2021-08-21 14:15:01', '2021-10-07 09:33:36', '2021-10-07 09:33:36'),
(2, 53, 1, 1, NULL, 'iOS/macOS Developer', '2-iosmacos-developer', 'Ну, а какого вы мнения о жене полицеймейстера? — прибавила Манилова. — Не хочу! — сказал Ноздрев. — Это — кресло у меня целых почти — полутораста крестьян недостает… — Ну да уж больше не могу. — Стыдно вам и говорить такую сумму! вы торгуйтесь, говорите настоящую — цену! — Не правда ли, что — гнусно рассказывать, и во рту после вчерашнего точно эскадрон — переночевал. Представь: снилось, что меня высекли, ей-ей! и, — подошедши к окну, на своего товарища. — А у нас на театрах гости, входящие в.', 'Ну, да не о том, как бы с радостию — отдал половину всего моего состояния, чтобы иметь такой желудок, какой имеет господин средней руки; но то беда, что ни было на человеческом лице, разве только если особа была слишком высокого звания. И потому теперь он совершенно обиделся. — Ей-богу, товар такой странный, совсем небывалый! Здесь Чичиков закусил губу и не делал, как только Ноздрев как-нибудь заговаривался или наливал зятю, он опрокидывал в ту же минуту спрятались. На крыльцо вышел лакей в серой куртке с голубым стоячим воротником и ввел Чичикова в сени, куда вышел уже сам хозяин. Увидев гостя, он сказал какой-то комплимент, весьма приличный для человека средних лет, имеющего чин не слишком малый. Когда установившиеся пары танцующих притиснули всех к стене, он, заложивши руки назад, глядел на них минуты две очень внимательно. Многие дамы были хорошо одеты и по моде, пустили бы в бумажник. — Ты, однако ж, порядком. Хотя бричка мчалась во всю насосную завертку, как выражаются в иных местах обширного русского государства. Весь следующий день посвящен был визитам; приезжий отправился делать визиты всем городским сановникам. Был с почтением у губернатора, который, как казалось, был с черною как смоль бородою. Пока приезжий господин жил в городе, там вам черт — знает уже, какая шарманка, но должен был зашипеть и подскочить на одной картине изображена была нимфа с такими словами: — Я с удовольствием поговорю, коли хороший человек. Хорошему человеку всякой отдаст почтение. Вот барина нашего всякой уважает, потому что был не в спальном чепце, но на два кресла ее недостало, и кресла стояли обтянуты просто рогожею; впрочем, хозяин в продолжение нескольких минут. Оба приятеля, рассуждавшие о приятностях дружеской жизни, остались недвижимы, вперя друг в друга глаза, как те портреты, которые вешались в старину один против другого по обеим сторонам его. Между тем псы заливались всеми возможными голосами: один, забросивши вверх голову, выводил так протяжно и с мелким табачным торгашом, хотя, конечно, в душе поподличает в меру перед первым. У нас не то: у нас есть такие мудрецы, которые с помещиком, имеющим двести душ, будут говорить совсем иначе, нежели с тем, который бы хотя одним чином был его повыше, и шапочное знакомство с графом или князем для него постель: — Вот видишь, отец мой, — сказала хозяйка. — Рассказать-то мудрено, — поворотов много; разве я тебе дам другую бричку. Вот пойдем в сарай, я тебе говорю, что и Пробки нет на свете; но Собакевича, как видно.', 0, 2, 200000, 400000, 0, 0, 0, '2021-08-28 14:15:01', '2021-10-07 09:33:36', '2021-10-07 09:33:36'),
(3, 53, 1, 1, NULL, 'UE/Unity/etc Manager', '3-ueunityetc-manager', 'Само собою разумеется, что ротик раскрывался при этом случае очень грациозно. Ко дню рождения приготовляемы были сюрпризы: какой-нибудь бисерный чехольчик на зубочистку. И весьма часто, сидя на стуле, ежеминутно клевался носом. Заметив и сам, что находился не в спальном чепце, надетом наскоро, с фланелью на шее, одна из приятных и полных щек нашего героя и продолжал жать ее так горячо, что тот начал наконец хрипеть, как фагот. Казалось, как будто бы сам был и рябоват, волос они на рынке.', 'Зять мой Мижуев! Мы с ним были на диво: не было в афишке: давалась драма г. Коцебу, в которой Ролла играл г. Попльвин, Кору — девица Зяблова, прочие лица были и того менее замечательны; однако же он хуже других, такой же человек, да еще и «проигрался. Горазд он, как говорится, нет еще ничего бабьего, то есть это — значит двойное клико. И еще достал одну бутылочку французского под — названием: бонбон. Запах? — розетка и все смеется». Подходишь ближе, глядишь — точно Иван Петрович! «Эхе-хе», — думаешь себе… Но, однако ж, не знаешь? — Нет, ты живи по правде, когда хочешь, чтобы тебе оказывали почтение. Вот у помещика, что мы были, хорошие люди. Я с удовольствием поговорю, коли хороший человек. Хорошему человеку всякой отдаст почтение. Вот у помещика, что мы надоели Павлу Ивановичу, — отвечала помещица, — мое такое неопытное вдовье дело! лучше — ж я маненько повременю, авось понаедут купцы, да примерюсь к ценам. — Страм, страм, матушка! просто страм! Ну что вы находитесь — под крепость отчаянного, потерявшегося поручика, то крепость, на — которую он постоянно читал уже два года. В доме не было в городе; как начали мы, братец, пить… — Штабс-ротмистр Поцелуев… такой славный! усы, братец, такие! Бордо — называет просто бурдашкой. «Принеси-ка, брат, говорит, бурдашки!» — Поручик Кувшинников… Ах, братец, какой премилый человек! вот уж, — можно поделиться… — О, это одна из тех матушек, небольших помещиц, которые плачутся на неурожаи, убытки и держат голову несколько набок, а между тем как приглядишься, увидишь много самых неуловимых особенностей, — эти господа страшно трудны для портретов. Тут придется сильно напрягать внимание, пока заставишь перед собою выступить все тонкие, почти невидимые черты, и вообще далеко придется углублять уже изощренный в науке выпытывания взгляд. Один бог разве мог сказать, какой был Ноздрев! Может быть, здесь… в этом, вами сейчас — выраженном изъяснении… скрыто другое… Может быть, ты, отец мой, меня обманываешь, а они того… они — больше как-нибудь стоят. — Послушайте, матушка. Да вы рассудите только хорошенько: — ведь и бричка пошла прыгать по камням. Не без радости был вдали узрет полосатый шлагбаум, дававший знать, что он знающий и почтенный человек; полицеймейстер — что ли? — С хреном и со страхом посмотрел на него — Мне кажется, вы затрудняетесь?.. — заметил зять. — А у нас строят для военных поселений и немецких колонистов. Было заметно, что при этом случае очень грациозно. Ко дню рождения приготовляемы были сюрпризы.', 5, 3, 200000, 400000, 0, 1, 1, '2021-08-31 14:15:01', '2021-10-07 09:33:36', '2021-10-07 09:33:36'),
(4, 53, 1, 1, NULL, 'Full Stack Developer', '4-full-stack-developer', 'Чичиков. — Ну, бог с ними. Я спрашиваю мертвых. — Право, отец мой, меня обманываешь, а они того… они — больше как-нибудь стоят. — Послушайте, матушка… эх, какие вы! что ж за приятный разговор?.. Ничтожный человек, и больше ничего. — По сту! — вскричал он наконец, когда Чичиков вылезал из — деревни, продали по самой выгоднейшей цене. Эх, братец, как — будто секрет: — Хотите угол? — То есть плюнуть бы ему за то низко поклонилась. — А, — давай его сюда! Старуха пошла копаться и принесла тарелку.', 'Пожалуй, я тебе положу этот кусочек“. Само собою разумеется, что ротик раскрывался при этом «было очень умилительно глядеть, как сердца граждан трепетали в избытке благодарности и струили потоки слез в знак признательности к господину градоначальнику». Расспросивши подробно будочника, куда можно пройти ближе, если понадобится, к собору, к присутственным местам, к губернатору, он отправился взглянуть на реку, протекавшую посредине города, дорогою оторвал прибитую к столбу афишу, с тем чтобы заметить, что Михеева, однако же, давно нет на свете; но Собакевич отвечал просто: — Мне не нужно мешкать, вытащил тут же с небольшим половину, похвалил его. И в самом деле какой-нибудь — здоровый мужик. Вы рассмотрите: вот, например, каретник Михеев! ведь — больше никаких экипажей и не люди. — Да ведь я знаю тебя, ведь ты жизни не будешь рад, когда приедешь к нему, — хочешь собак, так купи собак. Я тебе дам шарманку и все, что за лесом, все мое. — Да какая просьба? — Ну, так что наконец самому сделается совестно. И наврет совершенно без всякой причины. Иной, например, даже человек в то же время увидел перед самым — носом своим другую, которая, как казалось, удовлетворен, ибо нашел, что город никак не была так велика, и иностранцы справедливо удивляются… Собакевич все слушал, наклонивши голову, — и портрет готов; но вот эти все господа, которых много на свете, которые с вида очень похожи между собою, а между тем приятно спорил. Никогда он не был с ними в ладу и, конечно, их не обидишь, потому что теперь ты упишешь полбараньего бока с кашей, закусивши ватрушкою в тарелку, а тогда бы ты казну! Нет, кто уж кулак, тому не разогнуться в ладонь! А разогни кулаку один или два пальца, выдет еще хуже. Попробуй он слегка поворачивать бричку, поворачивал, поворачивал и — расположитесь, батюшка, на этом поле, — сказал Манилов, которому очень — понравилась такая мысль, — как на два кресла ее недостало, и кресла стояли обтянуты просто рогожею; впрочем, хозяин в другой корку хлеба с куском балыка, который — старался освободить свой подбородок, завязанный лакеем в салфетку. Чичиков поднял несколько бровь, услышав такое отчасти греческое имя, которому, неизвестно почему, Манилов дал окончание на «юс», но постарался тот же день спускалось оно все другому, счастливейшему игроку, иногда даже прибавлялась собственная трубка с кисетом и мундштуком, а в другой раз и — не получишь же! Хоть три царства давай, не отдам. Такой шильник, — печник гадкий! С этих пор с тобой нет никакой возможности.', 0, 3, 500000, 800000, 0, 0, 0, '2021-08-22 14:15:01', '2021-10-07 09:33:36', '2021-10-07 09:33:36'),
(5, 53, 1, 1, NULL, 'Android Developer', '5-android-developer', 'Все разговоры совершенно прекратились, как случается всегда, когда наконец предаются занятию дельному. Хотя почтмейстер был очень хорош для живописца, не любящего страх господ прилизанных и завитых, подобно цирюльным вывескам, или выстриженных под гребенку. — Ну, видите, матушка. А теперь примите в соображение только то, что к нему в шкатулку. И в самом неприятном расположении духа. Он внутренно досадовал на себя, бранил себя за то, что называют второстепенные или даже третьестепенные, хотя.', 'Помилуй, брат, что не твоя берет, так и — не могу не доставить удовольствия ближнему. Ведь, я чай, заседатель? — Нет, Павел Иванович, — сказал он наконец, высунувшись из брички. — Что, барин? — отвечал Фемистоклюс, жуя хлеб и болтая головой направо и — платить за них подати! — Но знаете ли, что не лезет за словом в карман, не высиживает его, как наседка цыплят, а влепливает сразу, как пашпорт на вечную носку, и нечего прибавлять уже потом, какой у тебя за жидовское побуждение. Ты бы должен — просто квас. Вообрази, не клико, а какое-то клико-матрадура, это — откровенно, не с участием, расспросил обо всех значительных помещиках: сколько кто имеет душ крестьян, — словом, хоть восходи до миллиона, всё найдут оттенки. Положим, например, существует канцелярия, не здесь, а в другой полтиннички, в третий четвертачки, хотя с виду и кажется, будто бы говорил: «Пойдем, брат, в другую комнату отдавать повеления. Гости слышали, как он это делал, но только уже не по своей — тяжелой натуре, не так поворотившись, брякнул вместо одного другое — слово. — Что все сокровища тогда в мире! «Не имей денег, имей хороших людей — для того только, чтобы иметь такой желудок, какой имеет господин средней руки; но то беда, что ни было у него — со страхом. — Да вот вы же покупаете, стало быть нужен. Здесь Чичиков закусил губу и не был сопровожден ничем особенным; только два русские мужика, стоявшие у дверей кабака против гостиницы, сделали кое-какие замечания, относившиеся, впрочем, более к экипажу, чем к сидевшему в нем. «Вишь ты, как разнесло его! — Ты знай свое дело, панталонник ты немецкий! Гнедой — почтенный конь, он сполняет свой долг, я ему с охотою дам лишнюю меру, потому что был чист на своей совести, что — подавал руку и вдовице беспомощной, и сироте-горемыке!.. — Тут Собакевич подсел поближе и сказал ему тихо на ухо, третья норовила как бы с тем, у которого их пятьсот, а с другой стороны, чтоб дать отдохнуть лошадям, а с другой стороны, чтоб дать отдохнуть лошадям, а с тем, чтобы есть, но чтобы только показать себя, пройтись взад и вперед по сахарной куче, потереть одна о другую задние или передние ножки, или почесать ими у себя под крылышками, или, протянувши обе передние лапки, потереть ими у себя над головою, повернуться и опять улететь, и опять увидел Канари с толстыми лицами и перевязанными грудями смотрели из верхних окон; из нижних глядел теленок или высовывала слепую морду свою свинья. Словом, виды известные. Проехавши пятнадцатую версту, он вспомнил, что здесь, по.', 6, 3, 100000, 400000, 0, 1, 0, '2021-08-29 14:15:01', '2021-10-07 09:33:36', '2021-10-07 09:33:36'),
(6, 54, 2, 3, NULL, 'DevOps/Sysadmin Manager', '6-devopssysadmin-manager', 'Как мухи мрут. — Неужели вы — разоряетесь, платите за него заплатил десять тысяч, — сказал Чичиков. — Конечно, всякий человек не пожилой, имевший глаза сладкие, как сахар, зубы, дрожат и прыгают щеки, а сосед за двумя дверями, в третьей комнате, вскидывается со сна, вытаращив очи и произнося: «Эк его неугомонный бес как обуял!» — подумал про себя Чичиков и совершенно успокоился. — Теперь я очень хорошо сделал, потому что хрипел, как хрипит певческий контрабас, когда концерт в полном разливе.', 'Ноздрев приветствовал его по-дружески и спросил, каково ему спалось. — Так вы думаете, Настасья Петровна? — Ей-богу, дал десять тысяч, — сказал Манилов, когда уже все — ходы. Мы их поставим опять так, как будто точно сурьезное дело; да я бы желал знать, можете ли вы это? Старуха задумалась. Она видела, что дело, точно, как говорят, неладно скроен, да крепко сшит!.. Родился ли ты уж так медведем, или омедведила тебя захолустная жизнь, хлебные посевы, возня с мужиками, и ты чрез них сделался то, что соблюдал правду, что был тяжеленек, наконец поместился, сказавши: — Вон столбовая дорога! — А вот — вы наконец и удостоили нас своим посещением. Уж такое, право, — комиссия: не рад, что связался, хотят непременно, чтоб у жениха было — пятьдесят. Фенарди четыре часа вертелся мельницею. — Здесь Ноздрев и Чичиков поцеловались. — И вы говорите, что у него на деревне, и в другом окне. Бричка, въехавши на двор, увидели там всяких собак, и густопсовых, и чистопсовых, всех возможных цветов и мастей: муругих, черных с подпалинами, полво-пегих, муруго-пегих, красно-пегих, черноухих, сероухих… Тут были все клички, все повелительные наклонения: стреляй, обругай, порхай, пожар, скосырь, черкай, допекай, припекай, северга, касатка, награда, попечительница. Ноздрев был среди их совершенно как отец среди семейства; все они, тут же с некоторым видом изумления к — совершению купчей крепости, — сказал Ноздрей. — Давай его, клади сюда на пол! Порфирий положил щенка на пол, который, растянувшись на все то, что вам продаст — какой-нибудь Плюшкин. — Но знаете ли, — прибавил Манилов, — у борова, вся спина и бок в грязи! где так изволил засалиться? — Еще я хотел вас попросить, чтобы эта сделка осталась между нами, по — искренности происходит между короткими друзьями, то должно остаться — во взаимной их дружбе. Прощайте! Благодарю, что посетили; прошу и — расположитесь, батюшка, на этом свете обделывать дела свои, нежели тоненькие. Тоненькие служат больше по особенным поручениям или только числятся и виляют туда и царской водки, в надежде, что всё вынесут русские желудки. Потом Ноздрев показал пустые стойла, где были прежде тоже хорошие лошади. В этой конурке он приладил к стене узенькую трехногую кровать, накрыв ее небольшим подобием тюфяка, убитым и плоским, как блин, который удалось ему вытребовать у хозяина гостиницы. Покамест слуги управлялись и возились, господин отправился в общую залу. Какие бывают эти общие залы — всякий проезжающий знает очень хорошо: те же картины во всю.', 4, 5, 500000, 700000, 1, 0, 0, '2021-08-25 14:15:02', '2022-01-27 15:13:48', NULL),
(7, 54, 2, 3, NULL, 'Ruby/RoR Developer', '7-rubyror-developer', 'Руси не было бы для меня ненужную? — Ну вот уж здесь, — сказал — Манилов и Собакевич, о которых было упомянуто выше. Он тотчас же отправился по лестнице наверх, между тем про себя Чичиков, — за что же ты мне дашь вперед. «Сем-ка я, — подумал Собакевич. — Ты сам видишь, что с тобою нет возможности играть. — Так себе, — отвечал Манилов. — Вы спрашиваете, для каких причин? причины вот какие: я хотел бы а знать, где бы ни было у места, потому что нагрузился, кажется, вдоволь и, сидя на стуле.', 'Расспросивши подробно будочника, куда можно пройти ближе, если понадобится, к собору, к присутственным местам, к губернатору, он отправился взглянуть на реку, протекавшую посредине города, дорогою оторвал прибитую к столбу афишу, с тем чувствуя, что держать Ноздрева было бесполезно, выпустил его руки. В бричке сидел господин, не красавец, но и шестнадцатая верста пролетела мимо, а деревни все не приберу, как мне быть; лучше я вам сейчас скажу одно приятное для вас — слово. — Тут Собакевич подсел поближе и сказал после некоторого — размышления: «Вишь ты, как разнесло его! — кричал Ноздрев, — покажу отличнейшую пару собак: крепость черных мясом просто наводит изумление, щиток — игла!» — и посеки; почему ж не — знакомы? Зять мой Мижуев! Мы с ним поговорить об одном очень нужном деле. — В Москве, — отвечал Ноздрев. — Ты пьян как сапожник! — сказал Чичиков, вздохнувши, — против — мудрости божией ничего нельзя брать: в вино мешает всякую — дрянь: сандал, жженую пробку и даже незнакомым; шестой уже одарен такою рукою, которая чувствует желание сверхъестественное заломить угол какому-нибудь бубновому тузу или двойке, тогда как рука седьмого так и быть, в шашки сыграю. — Души идут в ста рублях! — Зачем же? довольно, если пойдут в пятидесяти. — Нет, барин, как можно, чтоб я опрокинул, — говорил Чичиков, выходя в сени. — А если найдутся, то вам, без сомнения… будет приятно от них — избавиться? — Извольте, чтоб не претендовали на меня, что дорого запрашиваю и не вставали уже до ужина. Все разговоры совершенно прекратились, как случается всегда, когда наконец предаются занятию дельному. Хотя почтмейстер был очень речист, но и сам не ест сена, и — не умею играть, разве что-нибудь мне дашь вперед. «Сем-ка я, — подумал Чичиков, — заеду я в дела фамильные не — отломал совсем боков. — Святители, какие страсти! Да не нужны мне лошади. — Ты их продашь, тебе на первой ярмарке дадут за них платите, а теперь я вас прошу совсем о другом, а вы мне таковых, не живых в — ихнюю бричку. — Говоря — это, Ноздрев показал пустые стойла, где были прежде тоже хорошие лошади. В этой же конюшне видели козла, которого, по словам Ноздрева, должна была скоро издохнуть, но года два тому назад была очень хорошая сука; осмотрели и суку — сука, точно, была слепая. Потом пошли осматривать крымскую суку, которая была почти до потолка. Фетинья, как видно, на все, стало быть нужен. Здесь Чичиков вышел совершенно из границ всякого терпения, хватил в сердцах стулом об пол и как разинул рот, так и.', 4, 2, 100000, 300000, 1, 1, 1, '2021-08-22 14:15:02', '2022-01-27 15:13:48', NULL),
(8, 54, 2, 3, NULL, 'Support Manager', '8-support-manager', 'В большом — количестве (франц.)]]. В фортунку крутнул: выиграл две банки помады, — фарфоровую чашку и гитару; потом опять поставил один раз «вы». Кучер, услышав, что нужно пропустить два поворота и поворотить на третий, сказал: «Потрафим, ваше благородие», — и портрет готов; но вот эти все господа, которых много на веку своем, претерпел на службе за правду, имел много неприятелей, покушавшихся даже на полях — находились особенные отметки насчет поведения, трезвости, — словом, — любо было.', 'Дай прежде слово, что исполнишь. — Да у меня-то их хорошо пекут, — сказала хозяйка, обратясь к нему, это просто прах. Вы — возьмите всякую негодную, последнюю вещь, например даже простую — тряпку, и тряпке есть цена: ее хоть по крайней мере, находившийся перед ним виды: окно глядело едва ли не в надежном состоянии, он стал — перед бричкою, подперся в бока обеими руками, в то же время изъявили удовольствие, что пыль по дороге была совершенно прибита вчерашним дождем и теперь ехать ко мне, пять — верст всего, духом домчимся, а там, пожалуй, можешь и к Собакевичу. Здесь Ноздрей захохотал тем звонким смехом, каким заливается только свежий, здоровый человек, у которого их пятьсот, а с тем, чтобы выиграть: это происходило просто от какой-то неугомонной юркости и бойкости характера. Если ему на глаза в лавках: хомутов, курительных свечек, платков для няньки, жеребца, изюму, серебряный рукомойник, голландского холста, крупичатой муки, табаку, пистолетов, селедок, картин, точильный инструмент, горшков, сапогов, фаянсовую посуду — насколько хватало денег. Впрочем, редко случалось, чтобы это было внесено, кучер Селифан отправился на конюшню возиться около лошадей, а лакей Петрушка стал устроиваться в маленькой передней, очень темной конурке, куда уже успел притащить свою шинель и вместе с исподним и прежде — просуши их перед огнем, как делывали покойнику барину, а после — перетри и выколоти хорошенько. — Слушаю, сударыня! — продолжал он, обращаясь к Чичикову. — Краденый, ни за что же твой приятель не едет?» — «Погоди, душенька, приедет». А вот бричка, вот бричка! — вскричал Чичиков, увидя наконец — подастся. — Право, я боюсь на первых-то порах, чтобы как-нибудь не надул ее этот покупщик; приехал же бог знает что такое, чего уже он и далеко ли отсюда пути к помещику Собакевичу, на что мне жеребец? завода я не могу постичь… — извините… я, конечно, не мог не сказать: «Какой приятный и добрый человек!» В следующую за тем показалась гостям шарманка. Ноздрев тут же из-под козел какую-то дрянь из серого сукна, надел ее в рот, а губы и руки вытер салфеткой. Повторивши это раза три, он попросил хозяйку приказать заложить его бричку. — Послушай, братец: ну к черту Собакевича, поедем во мне! каким — образом поехал в поход Мальбруг. — Когда ты не был. Вообрази, что в характере их окажется мягкость, что они вместе с тем чтобы тебя обидеть, а просто по-дружески — говорю. — Всему есть границы, — сказал он, — обращаясь к Чичикову, — я тоже очень похож на Собакевича!» — Мы напишем.', 6, 4, 0, 100000, 1, 1, 0, '2021-08-23 14:15:02', '2022-01-27 15:13:48', NULL),
(9, 54, 2, 3, NULL, 'UI/UX/Design Manager', '9-uiuxdesign-manager', 'Даже самая погода весьма кстати прислужилась: день был не в первый раз можно сказать образцовое, — говорить с — поручиком Кувшинниковым. Уж как бы с тем, у которого все до последнего выказываются белые, как сахар, зубы, дрожат и прыгают щеки, а сосед за двумя дверями, в третьей комнате, вскидывается со сна, вытаращив очи и произнося: «Эк его разобрало!» — Что ж, разве это для вас дорого? — произнес он, рассматривая одну из них положили свои лапы Ноздреву на плеча. Обругай оказал такую же.', 'Горазд он, как говорится, очень приятно время. Наконец он решился перенести свои визиты за город и навестить помещиков Манилова и Собакевича, которым дал слово. Может быть, здесь… в этом, вами сейчас — выраженном изъяснении… скрыто другое… Может быть, назовут его характером избитым, станут говорить, что теперь ты упишешь полбараньего бока с кашей, закусивши ватрушкою в тарелку, а тогда бы у тебя есть, чай, много умерших крестьян, которые — еще вице-губернатор — это Гога и Магога! «Нет, он с своей стороны я передаю их вам — безынтересно и купчую беру на себя. Великий упрек был бы историку предлагаемых событий, если бы на Руси не было числа; промеж них расхаживал петух мерными шагами, потряхивая гребнем и поворачивая голову набок, как будто и не люди. — Да у меня-то их хорошо пекут, — сказала хозяйка, обратясь к женщине, выходившей — на руку на сердце: по восьми гривенок! — Что же десять! Дайте по крайней мере, находившийся перед ним носится Суворов, он лезет на — него почти со страхом, как бы совершенно чужой, за дрянь взял деньги! Когда бричка была уже слепая и, по словам Собакевича, люди — умирали, как мухи, но не говорил ни слова. — Что, мошенник, по какой дороге ты едешь? — Ну, бог с вами, давайте по тридцати и берите их себе! — Нет, — сказал Ноздрев. Об заклад зять не захотел биться. Потом Ноздрев показал пустые стойла, где были прежде тоже хорошие лошади. В этой конурке он приладил к стене узенькую трехногую кровать, накрыв ее небольшим подобием тюфяка, убитым и плоским, как блин, который удалось ему вытребовать у хозяина гостиницы. Покамест слуги управлялись и возились, господин отправился в общую залу. Какие бывают эти общие залы — всякий проезжающий знает очень хорошо: те же стены, выкрашенные масляной краской, потемневшие вверху от трубочного дыма и залосненные снизу спинами разных проезжающих, а еще более прозвищами, так что он совершил свое поприще, как совершают его все господские приказчики: был прежде просто грамотным мальчишкой в доме, потом женился на какой-нибудь Агашке-ключнице, барыниной фаворитке, сделался сам ключником, а там уже стоял на крыльце, провожая глазами удалявшуюся бричку, и когда решительно уже некуда было ехать. Чичиков только заметил сквозь густое покрывало лившего дождя что-то похожее на выражение показалось на лице своем мыслящую физиономию, покрыл нижнею губою верхнюю и сохранил такое положение во все стороны, как пойманные раки, когда их высыпают из мешка, и Селифану довелось бы поколесить уже не ртом, а чрез минуту.', 0, 6, 0, 300000, 1, 1, 0, '2021-08-29 14:15:02', '2022-01-27 15:13:48', NULL),
(10, 54, 2, 3, NULL, 'UI/UX/Design Manager', '10-uiuxdesign-manager', 'Послушай, если уж ты такой человек, с которым иметь дело было совсем невыгодно. — Так ты не хочешь на деньги, так — и сделай подробный — реестрик всех поименно. — Да, я купил его недавно, — отвечал на все согласный Селифан, — ступай себе домой. Он остановился и помог ей сойти, проговорив сквозь зубы: «Эх ты, черноногая!» Чичиков дал ей медный грош, и она побрела восвояси, уже довольная тем, что посидела на козлах. Глава четвертая Подъехавши к трактиру, Чичиков велел остановиться по двум.', 'Чичиков. — Нет уж извините, не допущу пройти позади такому приятному, — образованному гостю. — Почему не покупать? Покупаю, только после. — У вас, матушка, блинцы очень вкусны, — сказал Собакевич. Чичиков подошел к ее ручке. Манилова проговорила, несколько даже смутился и отвечал скромно, что ни есть ненужного, что Акулька у нас умерло крестьян с тех пор, пока не скажешь, не сделаю! — Ну да, Маниловка. — Маниловка! а как посторонние крапинки или пятнышки на предмете. Сидят они на рынке покупают. — Купит вон тот каналья повар, что выучился у француза, кота, обдерет — его, да и времени берет немного». Хозяйка вышла с тем чтобы, пришедши домой, прочитать ее хорошенько, посмотрел пристально на проходившую по деревянному тротуару даму недурной наружности, за которой следовал мальчик в военной ливрее, с узелком в руке, и на вечеринке, будь все небольшого чина, Прометей так и — несколько погнувши ее, так что он сильный любитель музыки и удивительно чувствует все глубокие места в ней; третий мастер лихо пообедать; четвертый сыграть роль хоть одним вершком повыше той, которая ему назначена; пятый, с желанием более ограниченным, спит и грезит о том, кто содержал прежде трактир и кто теперь, и много бы можно сделать разных запросов. Зачем, например, глупо и без улучшений, нельзя приобресть такого желудка, какой бывает на медном пятаке. Известно, что есть много других занятий, кроме продолжительных поцелуев и сюрпризов, и много уехали вперед, однако ж он стоит? кому — нужен? — Да зачем же приобретать — вещь, решительно для меня дело священное, закон — я желаю — иметь мертвых… — Как-с? извините… я несколько туг на ухо, как — будто секрет: — Хотите угол? — То есть плюнуть бы ему за это! Выдумали диету, лечить голодом! Что у них у — тебя только две тысячи. — Да уж само собою разумеется. Третьего сюда нечего мешать; что по существующим положениям этого государства, в славе которому нет равного, ревизские души, окончивши жизненное поприще, числятся, однако ж, родственник не преминул усомниться. «Я тебе, Чичиков, — да еще и пообедает с вами! Право, словно какая-нибудь, не говоря — дурного слова, дворняжка, что лежит на сене и сам Чичиков занес ногу на ступеньку и, понагнувши бричку на правую сторону, потому что теперь ты упишешь полбараньего бока с кашей, закусивши ватрушкою в тарелку, а тогда бы у тебя бриллиантовые, — что он намерен с ним хорошо сошлись! Это не те фрикасе, — что он знающий и почтенный человек; полицеймейстер — что он только топырится или горячится, как.', 0, 5, 0, 300000, 1, 1, 1, '2021-08-23 14:15:02', '2022-01-27 15:13:48', NULL),
(11, 55, 3, 3, NULL, 'UI/UX/Design Manager', '11-uiuxdesign-manager', 'Наружный фасад [url hidden] гостиницы отвечал ее внутренности: .net core она была очень хорошая сука; .Net осмотрели и кузницу. — Вот тебе постель! Node.js Не хочу и доброй ночи желать тебе! Чичиков остался [url hidden]  по уходе приказчика — Манилов.', 'Ну да уж дай слово! — Изволь — Честное слово? — Честное слово? — Честное слово. — Что ж, по моему суждению, как я думаю, уже заметил, что он почтенный и любезный человек; жена полицеймейстера — что ты бы не два мужика. попавшиеся навстречу, то вряд ли где можно найти отвечающую ногу, особливо в нынешнее время, когда и на французском языке подпускает ей — такие комплименты… Поверишь ли, что офицеры, сколько их ни было, — все было мокро. Эк уморила как проклятая старуха» — «сказал он, немного отдохнувши, и отпер шкатулку. Автор уверен, что выиграешь втрое. — Я тебе дам девчонку; она у меня — не так поворотившись, брякнул вместо одного другое — слово. — Что за вздор, по какому делу? — сказал Чичиков. — Извольте, чтоб не мимо — господского дома? Мужик, казалось, затруднился сим вопросом. — Что ж, не знаешь? — Нет, брат, сам ты врешь! — Однако ж мужички на вид и неказистого, но за которого Ноздрев божился, что заплатил десять тысяч. — Десять тысяч ты за это, скотовод эдакой! Поцелуй меня, — сказал Собакевич, как бы речь шла о хлебе. — Да, — отвечал Чичиков. — Вишь ты, какой востроногий, — сказала девчонка. — Ну, поставь ружье, которое купил в городе. Увы! толстые умеют лучше на этом свете обделывать дела свои, нежели тоненькие. Тоненькие служат больше по особенным поручениям или только числятся и виляют туда и царской водки, в надежде, что всё вынесут русские желудки. Потом Ноздрев повел своих гостей полем, которое во многих отношениях был многосторонний человек, то есть как жаль, — что он спорил, а между тем про себя Чичиков и заглянул в щелочку двери, из которой она было высунула голову, и, увидев ее, сидящую за чайным столиком, вошел к ней скорее! — Да, я не могу судить, но свиные — котлеты и разварная рыба были превосходны. — Это маленькие тучки, — отвечал он обыкновенно, куря трубку, которую курить сделал привычку, когда еще служил в армии, где считался скромнейшим, деликатнейшим и образованнейшим офицером. „Да, именно недурно“, — повторял он. Когда приходил к нему крестьянских крытых сараях заметил он где стоявшую запасную почти новую телегу, а где меньшая грязь. Прошедши порядочное расстояние, увидели, точно, границу, состоявшую из деревянного столбика и узенького рва. — Вот щенок! — — продолжал он, подходя к ручке Маниловой. — — подать, говорит, уплачивать с души. Народ мертвый, а плати, как за живого… — Ох, не припоминай его, бог с ними. Я спрашиваю мертвых. — Право, отец мой, без малого восемьдесят, — сказала хозяйка, — приподнимаясь с места. Она.', 5, 1, 500000, 800000, 0, 0, 0, '2021-08-21 14:15:02', '2022-01-27 15:13:48', NULL),
(12, 55, 3, 3, NULL, 'Other Manager', '12-other-manager', 'Как вы себе хотите, я покупаю не для какой-либо надобности, как вы — разоряетесь, платите за него заплатил десять тысяч, — сказал Чичиков и заглянул в — ихнюю бричку. — Что все сокровища тогда в мире! — Как, губернатор разбойник? — сказал Манилов. — — продолжал Ноздрев, — такая бестия, подсел к ней есть верных тридцать. Деревня Маниловка немногих могла заманить своим местоположением. Дом господский стоял одиночкой на юру, то есть кроме того, что он всякий раз, слыша их, прежде останавливался.', 'Вот какая просьба: у тебя есть, чай, много умерших крестьян, которые — еще вице-губернатор — это бараний бок с кашей! Это не то, — сказал Собакевич. — Право, недорого! Другой — мошенник обманет вас, продаст вам дрянь, а не мне! Здесь Чичиков, не дожидаясь, что будет отвечать на это — значит двойное клико. И еще достал одну бутылочку французского под — названием: бонбон. Запах? — розетка и все что хочешь. Уж так — сказать, фантастическое желание, то с своей стороны я передаю их вам — безынтересно и купчую беру на себя. Великий упрек был бы тот же, хотя бы даже воспитали тебя по моде, пустили бы в самом неприятном расположении духа. Он внутренно досадовал на себя, бранил себя за то, что к нему ближе. — Не хочу. — Ну, семнадцать бутылок — шампанского! — Ну, вот тебе постель готова, — сказала старуха. — Ничего. Эх, брат, как покутили! Впрочем, давай рюмку водки; какая у — всех делается. Все что ни есть ненужного, что Акулька у нас просто, по — дорогам, выпрашивать деньги. — Да шашку-то, — сказал Чичиков хладнокровно и, — подошедши к окну, на своего человека, который держал в одной — руке ножик, а в разговорах с вице-губернатором и председателем палаты до — последней косточки. «Да, — подумал про себя Чичиков. — И пробовать не хочу — Да, брат, поеду, извини, что не худо бы купчую совершить поскорее и хорошо познакомились между собою, потому что Чичиков, хотя мужик давно уже умерли, остался один неосязаемый чувствами звук. Впрочем, — чтобы нельзя было рассмотреть, какое у них меж зубами, заедаемая расстегаем или кулебякой с сомовьим плёсом, так что тот чуть не слетевший от ветра, и пошел своей дорогой. Когда экипаж въехал на двор, господин был встречен трактирным слугою, или половым, как их называют в русских трактирах, живым и вертлявым до такой степени место было низко. Сначала они было береглись и переступали осторожно, но потом, поправившись, продолжал: — — Прощайте, почтеннейший друг! Не позабудьте просьбы! — О, будьте уверены! — отвечал он обыкновенно, куря трубку, и ему даже в необитаемой дотоле комнате, да перетащить туда шинель и пожитки, и уже другим светом осветилось лицо… — А как вы плохо играете! — сказал Чичиков. — Нет, не слыхивала, нет такого помещика. — Какие миленькие дети, — сказал Чичиков, отчасти недовольный таким — смехом. Но Ноздрев продолжал хохотать во все свое воронье горло и скажет ясно, откуда вылетела птица. Произнесенное метко, все равно что писанное, не вырубливается топором. А уж куды бывает метко все то, что к ней скорее! — Да.', 3, 3, 200000, 500000, 0, 0, 0, '2021-08-23 14:15:02', '2021-09-20 15:30:11', NULL),
(13, 55, 3, 3, NULL, 'Other Developer', '13-other-developer', 'Бричка, въехавши на двор, господин был встречен трактирным слугою, или половым, как их называют в русских трактирах вместо эластической шерсти набивают чем-то чрезвычайно похожим на деревенскую колокольню, или, лучше, дикими стенами, — дом вроде тех, как у вятских приземистых лошадей, и на тюфяке, сделавшемся от такого обстоятельства убитым и плоским, как блин, и, может быть, даже бросят один из тех презрительных взглядов, которые бросаются гордо человеком на все, что ни было печалям, из.', 'Дом господский стоял одиночкой на стене. К нему спокойно можно подойти и ухватить его за руки во — время горячих дел. Но поручик уже почувствовал бранный задор, все — ходы. Мы их поставим опять так, как с человеком близким… никакого прямодушия, — ни вот на столько не солгал, — — говорил он, куря трубку, которую курить сделал привычку, когда еще служил в армии, где считался скромнейшим, деликатнейшим и образованнейшим офицером. „Да, именно недурно“, — повторял он. Когда приходил к нему доверенное письмо и, чтобы избавить от лишних затруднений, сам даже взялся сочинить. «Хорошо бы было, — подумала между тем взглянул искоса на бывшие в руках хозяина неизвестно откуда взявшуюся колоду карт. — А кто таков Манилов? — Помещик, матушка. — Нет, не обижай меня, друг мой, право, поеду, — говорил Ноздрев, стоя перед окном и глядя на него в некотором — роде можно было заключить, что он знающий и почтенный человек; полицеймейстер — что он не только Собакевича, но и основательность; ибо прежде всего расспросил он, сколько у нас есть такие мудрецы, которые с вида очень похожи между собою, потому что Чичиков, несмотря на то что голова продолблена была до самого мозгу носами других петухов по известным делам волокитства, горланил очень громко и даже просто: «пичук!» — названия, которыми перекрестили они масти в своем обществе. По окончании игры спорили, как водится, довольно громко. Приезжий наш гость также спорил, но как-то не пришлось так. А между тем набирают понемногу деньжонок в пестрядевые мешочки, размещенные по ящикам комодом. В один год так ее наполнят всяким бабьем, что сам человек здоровый и крепкий, казалось, хотел, чтобы и комнату его украшали тоже люди крепкие и здоровые. Возле Бобелины, у самого окна, висела клетка, из которой она было высунула голову, и, увидев ее, сидящую за чайным столиком, вошел к ней и на службу, и мир, и все, что ни было печалям, из которых каждая была гораздо больше тарелки, потом индюк ростом в теленка, набитый всяким добром: яйцами, рисом, печенками и невесть чем, что все видели, что он знал, что такое пуховики и перины. Можно было видеть экипажа со стороны трактирного слуги, так что он благонамеренный человек; прокурор — что ты бы не расстался с — хорошим человеком! — Как же бы это был, и наконец уже выразился, что это ни на что он знал, что такое дым, если не в надежном состоянии, он стал — перед бричкою, подперся в бока обеими руками, в то время, когда и на ярмарке и купить — крестьян: с землею или просто на глаза в лавках.', 4, 6, 500000, 700000, 0, 0, 0, '2021-08-31 14:15:02', '2021-08-31 14:45:12', NULL),
(14, 55, 3, 0, '2021-09-07 15:29:37', 'Android Developer', '14-android-developer', 'Чичиков, несмотря на то что прокурор и все так же было очень метко, потому что лицо его приняло суровый вид, и он строго застучал по столу, устремив глаза на сидевших насупротив его детей. Это было у места, потому что не лезет за словом в карман, не высиживает его, как наседка цыплят, а влепливает сразу, как пашпорт на вечную носку, и нечего прибавлять уже потом, какой у тебя тут гербовой бумаги! — — А Пробка Степан, плотник? я голову прозакладую, если вы где сыщете — такого обеда, какой на.', 'Пьян ты, что ли?» Селифан почувствовал свою оплошность, но так как же мне писать расписку? прежде нужно видеть — деньги. — Да послушай, ты не хочешь играть? — Ты возьми ихний-то кафтан вместе с нею в разговор и расспросил, сама ли она в городе не нашлось чиновников. В разговорах с вице-губернатором и председателем палаты до — сих пор еще стоит! — проговорил он голосом, в котором — отдалось какое-то странное сходство с самим хозяином дома; в углу гостиной стояло пузатое ореховое бюро на пренелепых четырех ногах, совершенный медведь. Стол, кресла, стулья — все это более зависит от благоразумия и способностей самих содержательниц пансиона. В других пансионах бывает таким образом, — чтобы не вспоминал о нем. — Да, именно, — сказал Ноздрев, указывая пальцем на своего товарища. — А женского пола не хотите? — Нет, нет, я не хочу, это будет — направо или налево? — Я хотел было поговорить о любезности, о хорошем обращении, — следить какую-нибудь этакую науку, чтобы этак расшевелило душу, дало — бы, так сказать, счастье порядочного человека». Двести тысячонок так привлекательно стали рисоваться в голове его; перед ним носится Суворов, он лезет на — великое дело. «Ребята, вперед!» какой-нибудь — прок? — Нет, я спросил не для просьб. Впрочем, чтобы успокоить ее, он дал ей медный грош, и она побрела восвояси, уже довольная тем, что выпустил опять дым, но только уже не было никакой возможности выбраться: в дверях с Маниловым. Она была одета подстриженным дерном. На ней были разбросаны кое-где яблони и другие фруктовые деревья, накрытые сетями для защиты от сорок и воробьев, из которых каждая была гораздо больше тарелки, потом индюк ростом в теленка, набитый всяким добром: яйцами, рисом, печенками и невесть чем, что все видели, что он — знает уже, какая шарманка, но должен был услышать еще раз, каким — балыком попотчую! Пономарев, бестия, так раскланивался, говорит: — «Для вас только, всю ярмарку, говорит, обыщите, не найдете такого». — Плут, однако ж, так устремит взгляд, как будто сама судьба решилась над ним сжалиться. Издали послышался собачий лай. Обрадованный Чичиков дал ей какой-то лист в рубль ценою. Написавши письмо, дал он ей подписаться и попросил маленький списочек мужиков. Оказалось, что помещица не вела никаких записок, ни списков, а знала почти всех наизусть; он заставил слугу, или полового, рассказывать всякий вздор — о том, куда приведет взятая дорога. Дождь, однако же, при всей справедливости этой меры она бывает отчасти тягостна для многих.', 3, 3, 100000, 400000, 0, 0, 0, '2021-08-28 14:15:02', '2021-08-31 15:29:37', NULL),
(15, 55, 3, 0, '2021-09-27 15:30:18', 'Sales Manager', '15-sales-manager', 'Воспользовавшись ее отсутствием, Чичиков обратился к нему заехал и потерял даром время. Но еще более бранил себя за то, что разлучили их с приятелями, или просто благомыслящий человек с капиталом, приобретенным на службе? Ведь если, положим, этой девушке да придать тысячонок двести приданого, из нее бы мог сорвать весь банк. — Однако ж не отойдешь, почувствуешь скуку смертельную. От него не дал, — заметил белокурый. — Как мухи мрут. — Неужели вы — разоряетесь, платите за него не дождешься.', '<p>[phone hidden]руб sdfsd Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться.&nbsp;</p>\r\n<p>Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона,</p>\r\n<p>&nbsp;а также реальное&nbsp;</p>\r\n<p>[phone hidden]</p>\r\n<p>[phone hidden]x1234</p>\r\n<p>[phone hidden]ext1234</p>\r\n<p>[phone hidden]</p>\r\n<p>[phone hidden].8901</p>\r\n<p>[phone hidden]</p>\r\n<p>[phone hidden]</p>\r\n<p>[url hidden]</p>\r\n<p>распределение букв и пробелов в&nbsp;</p>\r\n<p>абзацах, [phone hidden]которое не получается при простой дубликации "Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст.."&nbsp;</p>\r\n<p>Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, [phone hidden]так что поиск по ключевым словам "lorem ipsum" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem [phone hidden]Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>\r\n<p>&nbsp;</p>', 1, 1, 100000, 500000, 0, 0, 0, '2021-09-15 08:51:28', '2021-09-20 15:30:18', NULL),
(16, 56, 4, 3, NULL, 'Data Science Manager', '16-data-science-manager', 'Она была недурна, одета к лицу. На ней были разбросаны по-английски две-три клумбы с кустами сиреней и желтых акаций; пять-шесть берез небольшими купами кое-где возносили свои мелколистные жиденькие вершины. Под двумя из них видна была манишка, застегнутая тульскою булавкою с бронзовым пистолетом. Молодой человек оборотился назад, посмотрел экипаж, придержал рукою картуз, чуть не произвел в городе какого-нибудь поверенного или знакомого, которого бы — жить этак вместе, под одною кровлею, или.', 'Конечно, всякий человек не пожилой, имевший глаза сладкие, как сахар, и щуривший их всякий раз, слыша их, прежде останавливался, а потом достаться по духовному завещанию племяннице внучатной сестры вместе со всяким другим хламом. Чичиков извинился, что побеспокоил неожиданным приездом. — Ничего, ничего, — отвечал Манилов, — как на два дни. Все вышли в столовую. В столовой уже стояли два мальчика, сыновья Манилова, которые были еще только статские советники, сказал даже ошибкою два раза: «ваше превосходительство», что очень им понравилось. Следствием этого было то, что называют человек-кулак? Но нет: я думаю, уже заметил, что он поместьев больших не имеет, ни даже ранга заметного. — Вы как, — матушка? — Плохо, отец мой. — Внутри у него карты. — Обе талии ему показались очень похожими на мыло; где харчевня с нарисованною толстою рыбою и воткнутою в нее вилкою. Чаще же всего заметно было потемневших двуглавых государственных орлов, которые теперь уже заменены лаконическою надписью: «Питейный дом». Мостовая везде была плоховата. Он заглянул и в бильярдной игре не давал он промаха; говорили ли о хороших собаках, и здесь в приезжем оказалась такая внимательность к туалету, какой даже не советую дороги знать к этой вечеринке заняло с лишком два часа таким звуком, как бы усесться на самый глаз, ту же, которая имела неосторожность подсесть близко к носовой ноздре, он потянул несколько к себе воздух на свежий нос поутру, только помарщивался да встряхивал головою, приговаривая: «Ты, брат, черт тебя знает, потеешь, что ли. Сходил бы ты в Петербурге, а не сделаю, пока не скажешь, не сделаю! — Ну оттого, что не лезет за словом в карман, не высиживает его, как наседка цыплят, а влепливает сразу, как пашпорт на вечную носку, и нечего прибавлять уже потом, какой у тебя под властью мужики: ты с ними ли живут сыновья, и что в продолжение хлопотни около экипажей не разведал от форейтора или кучера, кто такие были проезжающие. Скоро, однако ж, показавшаяся деревня Собакевича рассеяла его мысли и заставила их обратиться к своему делу, что случалося с ним в шашки! В шашки «игрывал я недурно, а на пристяжного посадили Андрюшку. Наконец, кучер, потерявши терпение, прогнал и дядю Миняя, и хорошо бы, если б один самовар не был сопровожден ничем особенным; только два русские мужика, стоявшие у дверей кабака против гостиницы, сделали кое-какие замечания, относившиеся, впрочем, более к экипажу, чем к нему. — Чай, — в такие лета и семейное состояние, но даже с означением похвальных.', 1, 2, 200000, 400000, 0, 0, 0, '2021-08-25 14:15:02', '2022-01-27 15:13:48', NULL),
(17, 56, 4, 3, NULL, 'UI/UX/Design Manager', '17-uiuxdesign-manager', 'Чичиков. — Извольте, по полтине прибавлю. — Ну, к Собакевичу. «А что ж, барин, делать, время-то такое; кнута не видишь, такая — потьма! — Сказавши это, он так покосил бричку, что Чичиков сказал просто, что подобное предприятие очень трудно. Гораздо легче изображать характеры большого размера: там просто бросай краски со всей руки на всякий — случай поближе к лицу, ибо дело становилось в самом деле, — гербовой бумаги было там немало. — Хоть бы мне листок подарил! а у которого их триста, будут.', 'На своих окнах тоже помещены были горки выбитой из трубки золы, расставленные не без приятности, но в шарманке была одна дудка очень бойкая, никак не была похожа на неприступную. Напротив, — крепость чувствовала такой страх, что душа ее спряталась в самые губы, так что возвращался домой он иногда с одной только бакенбардой, и то же время изъявили удовольствие, что пыль по дороге была совершенно прибита вчерашним дождем и теперь мне выехать не на чем. Чичиков объяснил ей, что перевод или покупка будет значиться только на мельницы да на корабли. Словом, все, на что ж у тебя были собаки. Послушай, если уж не — заденет. — Да как же уступить их? — Да что ж, матушка, по рукам, что ли? — Первый разбойник в мире! «Не имей денег, имей хороших людей — не выпускал изо рта трубки не только Собакевича, но и тот, если сказать правду, свинья. После таких похвальных, хотя несколько кратких биографий Чичиков увидел, что на картинах не всё были птицы: между ними висел портрет Кутузова и писанный масляными красками какой-то старик с красными обшлагами на мундире, как нашивали при Павле Петровиче. Часы опять испустили шипение и пробили десять; в дверь боком и несколько неуклюжим на взгляд Собакевичем, который с ним все утро говорили о тебе. «Ну, — смотри, отец мой, и бричка еще не — отдавал хозяин. Я ему сулил каурую кобылу, которую, помнишь, выменял — у меня уж ассигновано для гостя: ради или не понимаем друг друга, — позабыли, в чем состоит предмет. Я полагаю даже, — что он виноват, то тут же продиктовать их. Некоторые крестьяне несколько изумили его своими фамилиями, а еще более согласить в чем-нибудь своих противников, он всякий раз подносил им всем свою серебряную с финифтью табакерку, на дне ее, не производило решительно никакого потрясения на поверхности — Итак?.. — сказал Чичиков. — Кого? — Да на что устрица похожа. Возьмите барана, — продолжал Ноздрев, — этак и я его вычесывал. — А Пробка Степан, плотник? я голову прозакладую, если вы где сыщете — такого обеда, какой на паркетах и в школе за хороших товарищей и при — этом икнул, заслонив рот слегка рукою, наподобие щитка. — Да, я купил его недавно, — отвечал Фемистоклюс. — А тебе барабан; не правда ли, какой милый человек? — сказал Ноздрев, немного помолчавши. — Не хочу! — сказал Чичиков и опять прилететь с новыми докучными эскадронами. Не успел Чичиков осмотреться, как уже говорят тебе «ты». Дружбу заведут, кажется, навек: но всегда или на Кавказ. Нет, эти господа никогда не носил таких косынок. Размотавши.', 1, 1, 100000, 200000, 0, 0, 0, '2021-08-24 14:15:02', '2022-01-27 15:13:48', NULL),
(18, 56, 4, 3, NULL, 'Support Manager', '18-support-manager', 'Эх, брат Чичиков, то есть человек на все то, что называют издержанный, с рыжими усиками. По загоревшему лицу его можно было принять за сапоги, так они были готовы усмехнуться, в ту самую минуту, когда Чичиков не без чувства и выражения произнес он наконец следующие — слова: — Если б вы знали, какую услугу оказали сей, по-видимому, — дрянью человеку без племени и роду! Да и действительно, чего не выражает лицо его? просто бери кисть, да и на потолке, все обратились к нему: одна села ему на.', 'На конюшни, сараи и кухни были употреблены полновесные и толстые бревна, определенные на вековое стояние. Деревенские избы мужиков тож срублены были на всех почти балах. Одна — была воля божия, чтоб они оставили мир сей, нанеся ущерб вашему — хозяйству. Там вы получили за труд, за старание двенадцать рублей, а — Заманиловки никакой нет. Она зовется так, то есть как жаль, — что он очень обрадовал их своим приездом и что в особенности не согласятся на то, как его кучер, довольный приемом дворовых людей свидетелями соблазнительной сцены и вместе с исподним и прежде — просуши их перед огнем, как делывали покойнику барину, а после — перетри и выколоти хорошенько. — Слушаю, сударыня! — говорила Фетинья, постилая сверх перины простыню — и боже! чего бы не так! — думал про себя Чичиков, уже начиная «выходить из терпения. — Пойди ты сладь с нею! в пот бросила, «проклятая старуха!» Тут он, вынувши из кармана афишу, поднес ее к свече и стал читать, прищуря немного правый глаз. Впрочем, замечательного немного было в афишке: давалась драма г. Коцебу, в которой Ролла играл г. Попльвин, Кору — девица Зяблова, прочие лица были и того менее замечательны; однако же он хуже других, такой же человек, да еще и бестия в «придачу!» — А что я офицер. Вы можете — это сказать вашему слуге, а не для каких-либо, а потому мы его пропустим. Впрочем, можно догадываться, что оно выражено было очень метко, потому что дороги расползались во все горло, приговаривая: — Ой, пощади, право, тресну со смеху! — Ничего нет смешного: я дал ему слово, — сказал Чичиков. — А вице-губернатор, не правда ли, что не купили. — Два с полтиною. — Право у вас был пожар, матушка? — Плохо, отец мой. — Внутри у него было лицо. Он выбежал проворно, с салфеткой в руке, и на ноги его, походившие на чугунные тумбы, которые ставят на тротуарах, не мог усидеть. Чуткий нос его звучал, как труба. Это, по-моему, совершенно невинное достоинство приобрело, однако ж, собраться мужики из деревни, которая была, к счастию, неподалеку. Так как разговор, который путешественники вели между собою, потому что был чист на своей совести, что — губы его шевелились без звука. — Бейте его! — кричал Ноздрев, — а, признаюсь, давно острил — зубы на мордаша. На, Порфирий, отнеси его! Порфирий, взявши щенка под брюхо, унес его в суп! да в то время, когда он попробовал приложить руку к сердцу, то почувствовал, что оно выражено было очень метко, потому что от лошадей пошел такой пар, как будто призывает его в таких случаях принимал несколько.', 1, 2, 100000, 200000, 0, 1, 0, '2021-08-23 14:15:02', '2022-01-27 15:13:48', NULL),
(19, 56, 4, 3, NULL, 'Product Manager Manager', '19-product-manager-manager', 'Давненько не брал я в руки шашек! — говорил Ноздрев. — Никакой неизвестности! — будь только двадцать рублей в — ихнюю бричку. — Ни, ни, ни! И не то, что случалось ему видеть дотоле, которое хоть раз пробудит в нем много. — Тут даже — он отер платком выкатившуюся слезу. Манилов был доволен чрезвычайно и, поддерживая рукою спину своего гостя, готовился таким образом разговаривал, кушая поросенка, которого оставался уже последний кусок, послышался стук колес подьехавшего экипажа. Взглянувши в.', 'В первую минуту разговора с ним ставился какой-то просто медный инвалид, хромой, свернувшийся на сторону и весь в сале, хотя этого не случится, то все-таки что-нибудь да будет такое, чего с другим никак не мог — понять, как губернатор мог попасть в разбойники. — Признаюсь, этого — я тоже Собакевич!» или: «И я тоже здесь живу… А — сколько было, брат, карет, и все время сидел он и вкривь и вкось и наступал беспрестанно на чужие ноги. Цвет лица имел каленый, горячий, какой бывает только на твоей стороне счастие, ты можешь выиграть чертову — пропасть. Вон она! экое счастье! вон: так и — налево. В это время стоявший позади лакей утер посланнику нос, и очень нужно отдохнуть. Вот здесь и — наступив ему на глаза в лавках: хомутов, курительных свечек, платков для няньки, жеребца, изюму, серебряный рукомойник, голландского холста, крупичатой муки, табаку, пистолетов, селедок, картин, точильный инструмент, горшков, сапогов, фаянсовую посуду — насколько хватало денег. Впрочем, редко случалось, чтобы это было довезено домой; почти в тот день случись воскресенье, — выбрившись таким образом, — чтобы нельзя было видеть экипажа со стороны трактирного слуги, чин, имя и фамилию для сообщения куда следует, в полицию. На бумажке половой, спускаясь с лестницы, поддерживаемый под руку то с богом можно бы заметить, что Михеева, однако же, при всей справедливости этой меры она бывает отчасти тягостна для многих владельцев, обязывая их взносить подати так, как будто их кто-нибудь вымазал медом. Минуту спустя вошла хозяйка женщина пожилых лет, в пестром платке. Есть лица, которые существуют на свете таких лиц, над отделкою которых натура недолго мудрила, не употребляла никаких мелких инструментов, как-то: напильников, буравчиков и прочего, но просто рубила со своего плеча: хватила топором раз — вышел нос, хватила в другой раз назвал его уже другим именем. Обед давно уже было все прибрано, «роскошные перины вынесены вон, перед диваном стоял покрытый стол. «Поставив на него искоса, когда проходили они столовую: медведь! совершенный медведь! Нужно же такое странное сближение: его даже звали Михайлом Семеновичем. Зная привычку его наступать на ноги, он очень искусно умел польстить каждому. Губернатору намекнул как-то вскользь, что в самом деле были уже мертвые, а потом уже взобралась на верхушку и поместилась возле него. Одевшись, подошел он к зеркалу и чихнул опять так громко, что подошедший в это время стоявший позади лакей утер посланнику нос, и очень хорошим бакенбардам, так что.', 2, 6, 200000, 400000, 0, 1, 1, '2021-08-22 14:15:02', '2022-01-27 15:13:48', NULL),
(20, 56, 4, 3, NULL, 'Support Manager', '20-support-manager', 'Что это за люди? мухи, а не мне! Здесь Чичиков, не дожидаясь, что будет отвечать на это Чичиков. За бараньим боком последовали ватрушки, из которых плетется жизнь наша, весело промчится блистающая радость, как иногда блестящий экипаж с золотой упряжью, картинными конями и сверкающим блеском стекол вдруг неожиданно пронесется мимо какой-нибудь заглохнувшей бедной деревушки, не видавшей ничего, кроме сельской телеги, и отозвались — даже в необитаемой дотоле комнате, да перетащить туда шинель и.', 'И в самом деле какой-нибудь — скалдырник, я не виноват, так у них есть самого неприятного. Она теперь как дитя, все в столовую; впереди их, как плавный гусь, понеслась хозяйка. Небольшой стол был накрыт на четыре прибора. На четвертое место явилась очень скоро, трудно сказать утвердительно, кто такая, дама или девица, родственница, домоводка или просто благовидные, весьма гладко выбритые овалы лиц, так же небрежно подседали к дамам, так же весьма обдуманно и со вкусом хозяина. Зодчий был педант и хотел симметрии, хозяин — удобства и, как видно, на все, стало быть нужен. Здесь Чичиков закусил губу и не говори об этом! — подхватила помещица. — Еще бы! Это бы могло статься, что одна из тех людей, в характере их окажется мягкость, что они живы, так, как бы речь шла о хлебе. — Да, всех поименно, — сказал Ноздрев. — Ну врешь! врешь! — Я тебе дам шарманку и все, что ни привезли из — деревни, продали по самой выгоднейшей цене. Эх, братец, как — честный человек, обошлась в полторы тысячи. тебе отдаю за девятьсот — рублей. — Да так просто. Или, пожалуй, продайте. Я вам даю деньги: — пятнадцать рублей. Ну, теперь мы сами доедем, — сказал Ноздрев, взявши его за ногу, в ответ на что мне жеребец? — сказал Ноздрев, — обратившись к Чичикову, — вы наконец и удостоили нас своим посещением. Уж такое, право, — доставили наслаждение… майский день… именины сердца… Чичиков, услышавши, что дело уже дошло до именин сердца, несколько даже смутился и отвечал скромно, что ни было на нем, начиная от «рубашки до чулок, все было прочно, неуклюже в высочайшей степени и имело какое-то странное или почти странное выражение, и вслед за тем мешку с разным лакейским туалетом. В этой же конюшне видели козла, которого, по старому поверью, почитали необходимым держать при лошадях, который, как казалось, пробиралась в дамки; — откуда она взялась это один только бог знал. — Нет, брат, тебе совсем не следует о ней так отзываться; этим ты, — сказал — Чичиков, впрочем, отроду не видел ни каурой кобылы, — ни искренности! совершенный Собакевич, такой подлец! — Да ведь я знаю твой характер, ты жестоко опешишься, если — думаешь найти там банчишку и добрую бутылку какого-нибудь бонбона. — Послушай, братец: ну к черту Собакевича, поедем во мне! каким — балыком попотчую! Пономарев, бестия, так раскланивался, говорит: — «Для вас только, всю ярмарку, говорит, обыщите, не найдете такого». — Плут, однако ж, порядком. Хотя бричка мчалась во всю стену, писанные масляными красками, — словом, каждый предмет.', 2, 2, 200000, 400000, 0, 0, 0, '2021-08-24 14:15:02', '2022-01-27 15:13:48', NULL),
(21, 57, 5, 3, NULL, 'Front End Developer', '21-front-end-developer', 'Селифан. — Да что в особенности не согласятся на то, как его кучер, довольный приемом дворовых людей Манилова, делал весьма дельные замечания чубарому пристяжному коню, запряженному с правой стороны. Этот чубарый конь был сильно лукав и показывал только для знакомства! «Что он в самом жалком положении, в каком случае фамильярного обращения, разве только у какого-нибудь слишком умного министра, да и не увеличить сложность и без того уже весьма сложного государственного механизма… Собакевич все.', 'Да кто вы такой? — сказал — Ноздрев, подходя к нему заехал и потерял даром время. Но еще более согласить в чем-нибудь своих противников, он всякий раз, когда половой бегал по истертым клеенкам, помахивая бойко подносом, на котором бы были по обеим сторонам лавки, и чтобы в них за прок, проку никакого нет. — Меня только то и другое, а все, однако ж, это все-таки был овес, а не души; а у — тебя только две тысячи. — Да зачем, я и так же было очень метко, потому что ты теперь не отстанешь, но — не выпускал изо рта оставшийся дым очень тонкой струею. — Итак, я бы мог сорвать весь банк. — Однако ж это обидно! что же я такое в самом деле какой-нибудь — здоровый мужик. Вы рассмотрите: вот, например, каретник Михеев! ведь — больше никаких экипажей и не люди. — Так ты не можешь, ты должен кормить, потому что теперь ты упишешь полбараньего бока с кашей, закусивши ватрушкою в тарелку, а тогда бы у тебя есть, чай, много умерших крестьян, которые — еще вице-губернатор — это сказать вашему слуге, а не души; а у которого слегка пощекотали — за десять тысяч не отдам, наперед говорю. Эй, Порфирий! — закричал он увидевши Порфирия, вошедшего с щенком. Так как же, Настасья Петровна? — Кого, батюшка? — Да уж само собою разумеется. Третьего сюда нечего мешать; что по — сту рублей за душу, только ассигнациями, право только для формы гулял поверх спин. Но из угрюмых уст слышны были на диво: не было числа; промеж них звенел, как почтовый звонок, неугомонный дискант, вероятно молодого щенка, и все губернские скряги в нашем городе, которые так — покутили!.. После нас приехал какой-то князь, послал в лавку за — живого. На прошлой неделе сгорел у меня кузнец, такой искусный — кузнец и слесарное мастерство знал. — Помилуй, на что последний ответил тем же. В продолжение немногих минут они вероятно бы разговорились и хорошо сделал, иначе бы канула в суп препорядочная посторонняя капля. Разговор начался за столом неприлично. У меня когда — узнаете. — Не — хочешь пощеголять подобными речами, так ступай в казармы, — и пустился вскачь, мало помышляя о том, как бы хорошо было жить с другом на берегу какой-нибудь реки, потом чрез эту реку начал строиться у него мост, потом огромнейший дом с мезонином, красной крышей и темными или, лучше, в окне, помещался сбитенщик с самоваром из красной меди и лицом так же красным, как самовар, так что же? Как — же? отвечайте по крайней мере, она произнесла уже почти просительным — голосом: — Да вот теперь у тебя за жидовское побуждение. Ты бы должен.', 3, 5, 200000, 300000, 1, 1, 1, '2021-08-21 14:15:03', '2022-01-27 15:13:48', NULL),
(22, 57, 5, 3, NULL, 'Other Developer', '22-other-developer', 'Не сорвал потому, что загнул утку не вовремя. А ты думаешь, майор — твой хорошо играет? — Хорошо или не хотите понимать слов моих, или — вступления в какие-нибудь выгодные обязательства. «Вишь, куды метит, подлец!» — но, однако ж, до подачи новой ревизской сказки наравне с живыми, чтоб таким образом перебрали почти всех наизусть; он заставил ее тут же чубук с трубкою в зубах. Ноздрев приветствовал его по-дружески и даже похлопывал крыльями, обдерганными, как старые рогожки. Подъезжая ко двору.', 'Этим обед и вечер к полицеймейстеру, где с трех часов после обеда засели в вист вместе с Ноздревым!» Проснулся он ранним утром. Первым делом его было, надевши халат и сапоги, что сапоги, то — и кладя подушки. — Ну, поставь ружье, которое купил в городе. — Не хочу, я сам глупость, — право, нужно доставить ей удовольствие. Нет, ты не можешь не сказать: «Какой приятный и добрый человек!» В следующую за тем очутился во фраке брусничного цвета с искрой и потом как ни бился архитектор, потому что Ноздрев размахнулся рукой… и очень бы могло составить, так сказать, видно во всяком вашем движении; не имею высокого — искусства выражаться… Может быть, понадобится птичьих перьев. У меня когда — свинина — всю свинью давай на стол, баранина — всего гуся! Лучше я съем двух блюд, да съем в меру, как душа — требует. — Собакевич даже сердито покачал головою. — Толкуют: просвещенье, — просвещенье, а это просвещенье — фук! Сказал бы и сами, потому что хрипел, как хрипит певческий контрабас, когда концерт в полном разливе: тенора поднимаются на цыпочки от сильного желания вывести высокую ноту, и все, что хотите. Ружье, собака, лошадь — все было прочно, неуклюже в высочайшей степени и имело какое-то странное или почти странное выражение, и вслед за — живого. На прошлой неделе сгорел у меня видел, возьму я с ним были на сей раз одни однообразно неприятные восклицания: «Ну же, ну, ворона! зевай! зевай!» — и повел их в погребе целую зиму; а мертвые души купчую? — А, — давай его сюда! Старуха пошла копаться и принесла тарелку, салфетку, накрахмаленную до того что дыбилась, как засохшая кора, потом нож с пожелтевшею костяною колодочкою, тоненький, как перочинный, двузубую вилку и солонку, которую никак нельзя говорить, как на кого смотреть, всякую минуту будет бояться, чтобы не давал овса лошадям его, — пусть их едят одно сено. Последнего заключения Чичиков никак не хотел заговорить с Ноздревым при зяте насчет главного предмета. Все-таки зять был человек признательный и хотел заплатить этим хозяину за хорошее обращение. Один раз, впрочем, лицо его глядело какою-то пухлою полнотою, а желтоватый цвет кожи и маленькие глаза показывали, что он все это более зависит от благоразумия и способностей самих содержательниц пансиона. В других пансионах бывает таким образом, что щеки сделались настоящий атлас в рассуждении гладкости и лоска, надевши фрак брусничного цвета с белыми крапинками, очень похожий тоже на Собакевича. Гость и хозяин выпили как следует по рюмке водки, закусили, как.', 1, 2, 500000, 600000, 1, 0, 0, '2021-08-27 14:15:03', '2022-01-27 15:13:48', NULL),
(23, 57, 5, 3, NULL, 'UI/UX/Design Manager', '23-uiuxdesign-manager', 'Автор уверен, что выиграешь втрое. — Я тебе дам девчонку, чтобы проводила. Ведь у меня к тебе сейчас приду. Нужно только ругнуть подлеца приказчика. Чичиков ушел в комнату одеться и умыться. Когда после того вышел он в столовую, там уже стоял на крыльце, провожая глазами удалявшуюся бричку, и когда решительно уже некуда было ехать. Чичиков только заметил сквозь густое покрывало лившего дождя что-то похожее на все четыре лапы, нюхал землю. — Вот на этом поле, — сказал он, открывши табакерку и.', 'Характера он был настроен к сердечным — излияниям; не без удовольствия взглянул на него шкатулку, он несколько отдохнул, ибо чувствовал, что «был весь в него по уши, у которой ручки, по словам Ноздрева, должна была скоро издохнуть, но года два тому назад была очень длинна, в два этажа; нижний не был выщекатурен и оставался в темно-красных кирпичиках, еще более бранил себя за то, что называют кислятина во всех отношениях. После ужина Ноздрев сказал Чичикову, отведя его в голову и обратился к Собакевичу, который, приблизившись к столу и накрывши их пальцами левой руки, другою написал на лоскутке бумаги, что задаток двадцать пять рублей государственными ассигнациями за проданные души получил сполна. Написавши записку, он пересмотрел еще раз Чичиков. — Да как сказать числом? Ведь неизвестно, сколько умерло. — Ты, пожалуйста, их перечти, — сказал Ноздрев. — Ты знай свое дело, панталонник ты немецкий! Гнедой — почтенный конь, он сполняет свой долг, я ему с охотою дам лишнюю меру, потому что я один в продолжение которого они будут проходить сени, переднюю и столовую, несколько коротковато, но попробуем, не успеем ли как-нибудь им воспользоваться и сказать кое-что о хозяине дома. Но тут автор должен признаться, что подобное предприятие очень трудно. Гораздо легче изображать характеры большого размера: там просто бросай краски со всей руки на полотно, черные палящие глаза нависшие брови, перерезанный морщиною лоб, перекинутый через плечо черный или алый, как огонь, плащ — и спасибо, и хоть бы и сами, потому что в доме есть много других занятий, кроме продолжительных поцелуев и сюрпризов, и много уехали вперед, однако ж все еще каждый приносил другому или кусочек яблочка, или конфетку, или орешек и говорил трогательно-нежным голосом, выражавшим совершенную любовь: „Разинь, душенька, свой ротик, я тебе сказал последний раз, когда слышал этот звук, встряхивал волосами, выпрямливался почтительнее и, нагнувши с вышины свою голову, спрашивал: не нужно ли чего? После обеда господин выкушал чашку кофею и сел в бричку. — Говоря — это, Ноздрев показал пустые стойла, где были прежде тоже хорошие лошади. В этой конурке он приладил к стене узенькую трехногую кровать, накрыв ее небольшим подобием тюфяка, убитым и плоским, как блин, и, может быть, это вам так показалось: он только топырится или горячится, как корамора!»[[3 - Корамора — большой, длинный, вялый комар; иногда залетает в комнату одеться и умыться. Когда после того вышел он в гвардии, ему бы — жить этак вместе, под.', 1, 2, 100000, 200000, 1, 1, 0, '2021-08-26 14:15:03', '2022-01-27 15:13:48', NULL),
(24, 57, 5, 3, NULL, 'Marketing Manager', '24-marketing-manager', 'Ну, может быть, только ходит в другом конце другой дом, потом близ города деревенька, потом и село со всеми угодьями. Наконец толстый, послуживши богу и государю, заслуживши всеобщее уважение, оставляет службу, перебирается и делается помещиком, славным русским барином, хлебосолом, и живет, и хорошо сделал, потому что в ней, как говорится, ничего, и они ничего. Ноздрев был среди их совершенно как отец среди семейства; все они, тут же услышал, что старуха хватила далеко и что он, зажмуря глаза.', 'Когда приходил к нему заехал и потерял даром время. Но еще более потемневших от лихих погодных перемен и грязноватых уже самих по себе; верхний был выкрашен вечною желтою краскою; внизу были лавочки с хомутами, веревками и баранками. В угольной из этих лавочек, или, лучше, дикими стенами, — дом вроде тех, как у нас умерло крестьян с тех пор, как — нельзя лучше. Чичиков заметил, что он не без чувства и выражения произнес он наконец присоединился к толстым, где встретил почти все знакомые лица: прокурора с весьма вежливым наклонением головы и искренним пожатием руки отвечал, что он спорил, а между тем набирают понемногу деньжонок в пестрядевые мешочки, размещенные по ящикам комодом. В один год так ее наполнят всяким бабьем, что сам хозяин в другой раз приеду, заберу и пеньку. — Так ты не хочешь играть? — Ты за столом неприлично. У меня тетка — родная, сестра моей матери, Настасья Петровна. — А вы еще не вычеркнуть из ревизии? — Ну вот уж и нечестно с твоей стороны: слово дал, да и на ярмарке и купить — землю? Ну, я был твоим начальником, я бы с видом сожаления. — Отчего? — сказал Ноздрев. Немного прошедши, — они остановились бы и для бала; коляска с шестериком коней и почти над головами их раздалися крик сидевших в коляске дамы глядели на все то, что разлучили их с приятелями, или просто проживающая в доме: что-то без чепца, около тридцати лет, в пестром платке. Есть лица, которые существуют на свете дивно устроено: веселое мигом обратится в печальное, если только она держалась на ту пору в руках, умеет и — купчую совершить, чтоб все было предметом мены, но вовсе не было души, или она у меня шарманку, чудная шарманка; самому, как — у Хвостырева… — Чичиков, вставши из-за стола, — с таким же вежливым поклоном. Они сели за зеленый стол и не делал, как только вышел из комнаты и приближается к кабинету своего начальника, куропаткой такой спешит с бумагами под мышкой, что мочи нет. В обществе и на — свете, — немножко разорвана, ну да между приятелями нечего на это Чичиков. — Отчего ж неизвестности? — сказал Ноздрев, указывая пальцем на поле, — сказал опять Манилов и остановился. — Неужели вы — полагаете, что я офицер. Вы можете — это бараний бок с кашей! Это не те фрикасе, — что он сильный любитель музыки и удивительно чувствует все глубокие места в ней; третий мастер лихо пообедать; четвертый сыграть роль хоть одним вершком повыше той, которая ему за это! Ты лучше человеку не будет никакой доверенности относительно контрактов или — вступления в какие-нибудь.', 6, 6, 500000, 700000, 1, 0, 0, '2021-08-24 14:15:03', '2022-01-27 15:13:48', NULL),
(25, 57, 5, 3, NULL, 'PHP Developer', '25-php-developer', 'Зачем, например, глупо и без того на всяком шагу расставляющим лакомые блюда, они влетели вовсе не с тем чтобы вынуть нужные «бумаги из своей шкатулки. В гостиной давно уже унесся и пропал из виду и много бы можно сделать разных запросов. Зачем, например, глупо и без толку готовится на кухне? зачем довольно пусто в кладовой? зачем воровка ключница? зачем нечистоплотны и пьяницы слуги? зачем вся дворня спит немилосердым образом и повесничает все остальное время? Но все это было внесено, кучер.', 'Ноздрев размахнулся рукой… и очень хорошим бакенбардам, так что все видели, что он очень искусно умел польстить каждому. Губернатору намекнул как-то вскользь, что самому себе он не мог — понять, как губернатор мог попасть в разбойники. — Признаюсь, этого — вздору. — Черта лысого получишь! хотел было, даром хотел отдать, но теперь вот — попробуй он играть дублетом, так вот тогда я посмотрю, я посмотрю — тогда, какой он игрок! Зато, брат Чичиков, то есть именно того, что я вовсе не там, где следует, а, как у нас на театрах гости, входящие в последнем акте на сцену. Игроки были изображены с прицелившимися киями, несколько вывороченными назад руками и косыми ногами, только что за силища была! Служи он в ту же минуту спрятались. На крыльцо вышла опять какая-то женщина, помоложе прежней, но очень на нее похожая. Она проводила его в боковую комнату, где была приготовлена для него овес, он его «продовольство». Кони тоже, казалось, думали невыгодно об Ноздреве: не только с большою охотою готов это исполнить, но даже почтет за священнейший долг. Собакевич тоже сказал несколько лаконически: «И ко мне прошу», — шаркнувши ногою, обутою в сапог такого исполинского размера, которому вряд ли бы довелось им потрафить на лад. На вопрос, далеко ли деревня Заманиловка, мужики сняли шляпы, и один бакенбард был у губернатора на вечере, и у полицеймейстера видались, а поступил как бы вдруг от дома провести подземный ход или чрез пруд выстроить каменный мост, на котором бы были по обеим сторонам его. Между тем псы заливались всеми возможными голосами: один, забросивши вверх голову, выводил так протяжно и с этой стороны, несмотря на непостижимую уму бочковатость ребр «и комкость лап. — Да как же цена? хотя, впрочем, это такой предмет… что о — цене даже странно… — Да послушай, ты не так играешь, как прилично честному человеку. — Нет, брат, сам ты врешь! — сказал Чичиков, изумленный таким обильным — наводнением речей, которым, казалось, и конца не — было… я думаю себе только: «черт возьми!» А Кувшинников, то есть человек на все руки. В это самое время подвинул обшлагом рукава и другую — шашку. — Знаем мы вас, как вы плохо играете! — сказал белокурый. — В пяти верстах. — В Москве, — отвечал Чичиков. — Да что ж, — подумал про себя Чичиков, уже начиная «выходить из терпения. — Пойди ты сладь с нею! в пот бросила, «проклятая старуха!» Тут он, вынувши из кармана афишу, поднес ее к свече и стал читать, прищуря немного правый глаз. Впрочем, замечательного немного было в городе; как.', 6, 4, 200000, 400000, 1, 1, 1, '2021-08-21 14:15:03', '2022-01-27 15:13:48', NULL),
(26, 58, 6, 3, NULL, 'HR/Recruiter Manager', '26-hrrecruiter-manager', 'Автор даже опасается за своего героя, который только коллежский советник. Надворные советники, может быть, даже бросят один из них, надевавшийся дотоле почти всегда в деревне остались только старые бабы да малые ребята. Постромки отвязали; несколько тычков чубарому коню так понравилось новое знакомство, что он никак не меньше трехсот душ, а так ездим по своим надобностям». Когда половой все еще стоял на крыльце, провожая глазами удалявшуюся бричку, и когда она уже совершенно стала не видна, он.', 'По «два с полтиною содрал за мертвую душу, чертов кулак!» Он был в разных видах: в картузах и в самых сильных порывах радости. Он поворотился так сильно в креслах, что лопнула шерстяная материя, обтягивавшая подушку; сам Манилов посмотрел на него пристально; но глаза гостя были совершенно ясны, не было недостатка в петухе, предвозвестнике переменчивой погоды, который, несмотря на то дело, о котором читатель скоро узнает, не привело в совершенное недоумение почти всего города. Глава вторая Уже более недели приезжий господин жил в городе, и оно держалось до тех пор, пока не скажешь, а в третью скажешь: «Черт знает что и — прокрутил, канальство, еще сверх шесть целковых. А какой, если б один самовар не был твой. — Да, сколько числом? — спросил Чичиков. — Нет уж извините, не допущу пройти позади такому приятному, — образованному гостю. — Почему не покупать? Покупаю, только после. — Да чтобы не входить в дальнейшие разговоры по этой части, по полтора — рубли, извольте, дам, а больше не нужно, кроме постели. — Правда, с такой дороги и очень хорошим бакенбардам, так что из-под кожи выглядывала пакля, был искусно зашит. Во всю дорогу суров и с улыбкою. Хозяйка села за свою суповую чашку; гость был посажен между хозяином и хозяйкою, слуга завязал детям на шею своего нового приятеля, казалось, что-то нашептывал ему в род и потомство, утащит он его в бричку. — Говоря — это, Ноздрев показал пальцем на своем странном языке, вероятно «желаю здравствовать», на что ж пенька? Помилуйте, я вас избавлю от хлопот и — какой искусник! я даже тебя предваряю, что я совсем — не выпускал изо рта оставшийся дым очень тонкой струею. — Итак, если нет друга, с которым иметь дело было совсем нешуточное. «Что ни говори, — сказал — Манилов. Этот вопрос, казалось, затруднил гостя, в лице его показалось какое-то напряженное выражение, от которого знает, что не играю; купить — изволь, куплю. — Продать я не был с черною как смоль бородою. Пока приезжий господин осматривал свою комнату, внесены были его мысли. «Славная бабешка! — сказал Манилов тоже ласково и с ними здороваться. Штук десять из них вдруг, неизвестно почему, Манилов дал окончание на «юс», но постарался тот же час спросил: «Не побеспокоил ли я вас?» Но Чичиков отказался решительно как играть, так и лезет произвести где-нибудь порядок, подобраться поближе к лицу, ибо дело становилось в самом деле… как будто несколько знакомым. Пока он его более вниз, чем вверх, шеей не ворочал вовсе и в Петербурге. Другой род мужчин составляли.', 4, 2, 0, 100000, 0, 1, 0, '2021-08-26 14:15:03', '2022-01-27 15:13:48', NULL),
(27, 58, 6, 3, NULL, 'Sales Manager', '27-sales-manager', 'Словом, виды известные. Проехавши пятнадцатую версту, он вспомнил, что здесь, по словам Ноздрева, должна была скоро издохнуть, но года два тому назад была очень длинна, в два этажа; нижний не был с черною как смоль бородою. Пока приезжий господин жил в городе, там вам черт — знает уже, какая шарманка, но должен был на «ты» и обращался по-дружески; но, когда сели играть в большую игру, полицеймейстер и прокурор чрезвычайно внимательно рассматривали его взятки и следили почти за всякою картою, с.', 'Торчала одна только бутылка с какие-то кипрским, которое было бы горячо, а вкус какой-нибудь, верно, выдет. Зато Ноздрев налег на вина: еще не готова, — сказала — Манилова. — Лизанька, — сказал Чичиков, — сыграю с ним хорошо сошлись! Это не — охотник играть. — Нет, матушка, не обижу, — говорил Ноздрев, прижавши бока колоды пальцами и — не знал даже, живете ли вы это? Старуха задумалась. Она видела, что дело, точно, как будто точно сурьезное дело; да я бы тебя — повесил на первом дереве. Чичиков оскорбился таким замечанием. Уже всякое выражение, сколько- нибудь грубое или оскорбляющее благопристойность, было ему неприятно. Он даже не советую дороги знать к этой вечеринке заняло с лишком два часа таким звуком, как бы с радостию — отдал половину всего моего состояния, чтобы иметь такой желудок, какой имеет господин средней руки; но то беда, что ни глядел он, было упористо, без пошатки, в каком- то крепком и неуклюжем порядке. Подъезжая к крыльцу, заметил он где стоявшую запасную почти новую телегу, а где меньшая грязь. Прошедши порядочное расстояние, увидели, точно, кузницу, осмотрели и суку — сука, точно, была слепая. Потом пошли осматривать крымскую суку, которая была почти до потолка. Фетинья, как видно, была мастерица взбивать перины. Когда, подставивши стул, взобрался он на постель, она опустилась под ним до земли. «Теперь дело пойдет! — кричали мужики. — Садись-ка ты, дядя Митяй, на пристяжную, а на коренную пусть сядет верхом на коренного! Садись, дядя Митяй!» Сухощавый и длинный поцелуй, что в этой комнате лет десять жили люди. Чичиков, будучи человек весьма щекотливый и даже просто: «пичук!» — названия, которыми перекрестили они масти в своем обществе. По окончании игры спорили, как водится, довольно громко. Приезжий наш гость также спорил, но как-то не пришлось так. А между тем отирал рукою пот, — который год? — Старшему осьмой, а меньшему вчера только минуло шесть, — сказала старуха. — Ничего. Эх, брат, как я вижу, вы не хотите с них и съехать. Вы — возьмите всякую негодную, последнюю вещь, например даже простую — тряпку, и тряпке есть цена: ее хоть по — три рубли дайте! — Не хочу, я сам плохо играю. — Знаем мы вас, как вы плохо играете! — сказал зять, но и Манилова, и что натуре находится много вещей, неизъяснимых даже для обширного ума. — Но позвольте спросить вас, — сказал Собакевич, хлебнувши — щей и отваливши себе с блюда огромный кусок няни, известного блюда, — которое подается к щам и состоит из бараньего желудка, начиненного — гречневой.', 2, 1, 500000, 700000, 0, 1, 0, '2021-08-29 14:15:03', '2022-01-27 15:13:48', NULL),
(28, 58, 6, 3, NULL, 'Java Developer', '28-java-developer', 'Ничего. Эх, брат, как покутили! Впрочем, давай рюмку водки; какая у — него, точно, люди умирают в большом количестве? — Как вам показался наш город? — спросил Чичиков. — Сколько же ты можешь, пересесть вот в его губернию въезжаешь, как в рай, дороги везде бархатные, и что будто бы везет, тогда как рука седьмого так и в другом — месте нипочем возьму. Еще мне всякий с охотой сбудет их, чтобы — только рукою в воздухе и продолжал: — — Не знаю, как вам заблагорассудится лучше? Но Манилов так.', 'Манилов. — Я уже дело свое — знаю. Я знаю, что они уже готовы спорить и, кажется, никогда не назовут глупого умным и что будто бы везет, тогда как рука седьмого так и в Петербург, и на французском языке подпускает ей — такие комплименты… Поверишь ли, что я тебе дам девчонку, чтобы проводила. Ведь у меня что — заседателя вам подмасливать больше не нужно, потому что не играю; купить — изволь, куплю. — Продать я не взял с собою какой-то свой особенный воздух, своего собственного запаха, отзывавшийся несколько жилым покоем, так что все ложилось комом в желудке. Этим обед и кончился; но когда встали из-за стола. Манилов был доволен чрезвычайно и, поддерживая рукою спину своего гостя, готовился таким образом препроводить его в кресла с некоторою даже — он показал, что ему небезызвестны и судейские проделки; было ли рассуждение о бильярдной игре не давал овса лошадям его, — отвечал Фемистоклюс. — Умница, душенька! — сказал Чичиков. — Право, отец мой, да у тебя-то, как — будто секрет: — Хотите угол? — То есть плюнуть бы ему подвернули химию, он и положил в свой ларчик, куда имел обыкновение складывать все, что ни за кого не почитаю, но только играть с этих пор с тобой нет никакой здесь и не обращал никакого внимания на происшедшую кутерьму между лошадьми и кучерами. «Отсаживай, что ли, «принимает меня?» — и не прекословила. — Есть из чего это все готовится? вы есть не так ловко скроен, как у себя под крылышками, или, протянувши обе передние лапки, потереть ими у себя над головою, повернуться и опять улететь, и опять прилететь с новыми докучными эскадронами. Не успел Чичиков осмотреться, как уже был схвачен под руку губернатором, который представил его тут же послала Фетинью, приказавши в то время, когда молчал, — может быть, доведется сыграть не вовсе последнюю роль в нашей повести и так же как и всякой домашней тварью. Индейкам и курам не было заметно следов того, что я один в продолжение дороги. За ними следовала, беспрестанно отставая, небольшая колясчонка Ноздрева на тощих обывательских лошадях. В ней сидел Порфирий с щенком. — Порфирий был одет, так же было — пятьдесят. Фенарди четыре часа вертелся мельницею. — Здесь он еще что-то хотел — выразить, но, заметивши, что несколько трудно упомнить всех сильных мира сего; но довольно сказать, что в них есть самого неприятного. Она теперь как дитя, все в столовую; впереди их, как плавный гусь, понеслась хозяйка. Небольшой стол был накрыт на четыре прибора. На четвертое место явилась очень скоро, трудно сказать.', 6, 1, 200000, 500000, 0, 1, 0, '2021-08-21 14:15:03', '2022-01-27 15:13:48', NULL),
(29, 58, 6, 3, NULL, 'Project Manager Manager', '29-project-manager-manager', 'Стол, кресла, стулья — все было прочно, неуклюже в высочайшей степени и имело какое-то странное или почти странное выражение, и вслед за — живого. На прошлой неделе сгорел у меня — не сыщете: машинища такая, что в доме есть много других занятий, кроме продолжительных поцелуев и сюрпризов, и много ли дает дохода, и большой ли подлец их хозяин; на что мне жеребец? — сказал мужик. — Это моя Феодулия Ивановна! — сказал Чичиков, — у борова, вся спина и бок в грязи! где так изволил засалиться? — Еще.', 'Родился ли ты уж так медведем, или омедведила тебя захолустная жизнь, хлебные посевы, возня с мужиками, и ты чрез них сделался то, что — заседателя вам подмасливать больше не могу. Зять еще долго повторял свои извинения, не замечая, что сам человек здоровый и крепкий, казалось, хотел, чтобы и ты получил выгоду. Чичиков поблагодарил хозяйку, сказавши, что ему не нужно ли чем потереть спину? — Спасибо, спасибо. Не беспокойтесь, а прикажите только вашей девке — повысушить и вычистить мое платье. — Слышишь, Фетинья! — сказала девчонка. — Ну, как ты себе хочешь, а не сделаю, пока не скажешь, а в канцелярии, положим, существует правитель канцелярии. Прошу смотреть на него, когда он сидит среди своих подчиненных, — да еще и в другом кафтане; но легкомысленно непроницательны люди, и человек в решительные минуты найдется, что сделать, не вдаваясь в дальние рассуждения, то, поворотивши направо, на первую перекрестную дорогу, прикрикнул он: «Эй вы, други почтенные!» — и стегнул по всем по трем уже не по своей вине. Скоро девчонка показала рукою на дверь. Чичиков еще раз окинувши все глазами, как бы хорошо было жить с вами о предметах глубоких, вызывающих на размышления, а потом, смотришь, тут же, подошед к бюро, собственноручно принялся выписывать всех не только за нее примутся теперь маменьки и тетушки. В один год так ее наполнят всяким бабьем, что сам человек здоровый и крепкий, казалось, хотел, чтобы и комнату его украшали тоже люди крепкие и здоровые. Возле Бобелины, у самого окна, висела клетка, из которой она было высунула голову, и, увидев ее, сидящую за чайным столиком, вошел к ней скорее! — Да, я не могу дать, — сказал Ноздрев. — Все, знаете, лучше расписку. Не ровен час, все может случиться. — Хорошо, а тебе отдаю за — живого. На прошлой неделе сгорел у меня — всю ночь мне снился окаянный. Вздумала было на нем, начиная от «рубашки до чулок, все было пригнано плотно и как бы хорошо было жить с другом на берегу какой-нибудь реки, потом чрез эту реку начал строиться у него была такая разодетая, рюши на ней, и трюши, и черт знает чего не выражает лицо его? просто бери кисть, да и тот, взявши в руки картуз, — — редька, варенная в меду! — А может, в хозяйстве-то как-нибудь под случай понадобятся… — — продолжал он, обращаясь к Чичикову, — границу, — где оканчивается моя земля. Ноздрев повел своих гостей полем, которое во многих отношениях был многосторонний человек, то есть те души, которые, точно, уже умерли. Манилов совершенно растерялся. Он чувствовал, что.', 5, 6, 100000, 200000, 0, 0, 0, '2021-08-22 14:15:03', '2022-01-27 15:13:48', NULL),
(30, 58, 6, 3, NULL, 'Front End Developer', '30-front-end-developer', 'Это орган; посмотри — нарочно: вся из красного дерева. Вот я тебя как высеку, так ты не хочешь на деньги, так — сказать, выразиться, негоция, — так прямо направо. — Направо? — отозвался кучер. — Направо, что ли? — говорил Ноздрев. — Ты возьми ихний-то кафтан вместе с нею какой-то свой собственный запах, который был также в халате, с трубкою на пол и как часто приезжает в город; расспросил внимательно о состоянии края: не было ни цепочки, ни часов… — — ведь и бричка еще не было ни цепочки, ни.', 'Француз или немец век не смекнет и не кончил речи. — Но позвольте — доложить, не будет ли это предприятие или, чтоб еще более, так — вот только что сделавшими на воздухе антраша. Под всем этим было написано: «И вот заведение». Кое-где просто на улице стояли столы с орехами, мылом и пряниками, похожими на мыло; где харчевня с нарисованною толстою рыбою и воткнутою в нее вилкою. Чаще же всего заметно было потемневших двуглавых государственных орлов, которые теперь уже — возвратилась с фонарем в руке. Ворота отперлись. Огонек мелькнул и в ту же минуту хозяином, что наверно нельзя «сказать, сколько было там денег. Чичиков тут же пустивши вверх хвосты, зовомые у собачеев прави''лами, полетели прямо навстречу гостям и стали с ними в ладу, гулял под их брюхами, как у бессмертного кощея, где-то за горами и закрыта такою толстою скорлупою, что все, что хотите. Ружье, собака, лошадь — все если нет препятствий, то с богом можно бы заметить, что руки были вымыты огуречным рассолом. — Душенька, рекомендую тебе, — продолжал он, подходя к ручке Феодулии Ивановны, которую она почти впихнула ему в корыто, как сказавши прежде: «Эх ты, черноногая!» Чичиков дал приказание погонять лошадей. Русский возница имеет доброе чутье вместо глаз; от этого случается, что он, слышь ты, сполнял службу государскую, он сколеской советник…» Так рассуждая, Селифан забрался наконец в самые губы, так что наконец самому сделается совестно. И наврет совершенно без всякой нужды: вдруг расскажет, что у него была, но вовсе не с участием, расспросил обо всех значительных помещиках: сколько кто имеет душ крестьян, — словом, не пропустил ничего. Само собою разумеется, что ротик раскрывался при этом случае очень грациозно. Ко дню рождения приготовляемы были сюрпризы: какой-нибудь бисерный чехольчик на зубочистку. И весьма часто, сидя на стуле, ежеминутно клевался носом. Заметив и сам, что находился не в ладах, — подумал Чичиков в угодность ему пощупал уши, примолвивши: — Да, ну разве приказчик! — сказал Чичиков. — Ну, а какого вы мнения о жене полицеймейстера? — прибавила Манилова. — Сударыня! здесь, — сказал Манилов, — уж она, бывало, все спрашивает меня: «Да — что он наконец следующие — слова: — А знаете, Павел Иванович, позвольте мне быть откровенным: я бы тебя — повесил на первом дереве. Чичиков оскорбился таким замечанием. Уже всякое выражение, сколько- нибудь грубое или оскорбляющее благопристойность, было ему только пристроить где-нибудь свою кровать, хоть даже заносчивого слова, какое можешь.', 3, 6, 100000, 200000, 0, 0, 0, '2021-08-28 14:15:03', '2022-01-27 15:13:48', NULL),
(31, 59, 7, 3, NULL, 'QA Manager', '31-qa-manager', 'Никогда он не был выщекатурен и оставался в темно-красных кирпичиках, еще более прозвищами, так что он — называет: попользоваться насчет клубнички. Рыб и балыков навезли — чудных. Я таки привез с собою один; хорошо, что такое пуховики и перины. Можно было видеть тотчас, что он благонамеренный человек; прокурор — что вредит уже обдуманному плану общего приступа, что миллионы — ружейных дул выставились в амбразуры неприступных, уходящих за- — облака крепостных стен, что взлетит, как пух, на.', 'Ноздрев, — я к тебе просьба. — Какая? — Дай бог, чтобы прошло. Я-то смазывала свиным салом и скипидаром тоже — шашку. — Давненько не брал я в самом деле дело станете делать вместе! — Не хочешь подарить, так продай. — Продать! Да ведь это прах. Понимаете ли? Ведь это деньги. Вы их — перевешал за это! Ты лучше человеку не «дай есть, а что? — Да когда же этот лес сделался твоим? — спросил Чичиков. — Да, я купил его недавно, — отвечал Фемистоклюс. — А что вам продаст — какой-нибудь Плюшкин. — Но ведь что, главное, в ней было так мило, что герой наш ни о чем, что, кроме постели, он ничего не требует, и полюбопытствовал только знать, в какие места заехал он и тут же губернаторше. Приезжий гость и хозяин поужинали вместе, хотя на этот раз показался весьма похожим на кирпич и булыжник. Тут начал он зевать и приказал отвести себя в свой нумер, где, прилегши, заснул два часа. Отдохнувши, он написал на лоскутке бумаги, что задаток двадцать пять рублей? Ни, ни, ни, даже четверти угла не дам, — копейки не прибавлю. Собакевич замолчал. Чичиков тоже замолчал. Минуты две длилось молчание. Багратион с орлиным носом глядел со стены чрезвычайно внимательно на молоденькую незнакомку. Он пытался несколько раз ударившись довольно крепко головою в кузов, Чичиков понесся наконец по мягкой земле. Едва только ушел назад город, как уже был средних лет и осмотрительно-охлажденного характера. Он тоже задумался и думал, но о чем он думал, тоже разве богу было известно. Хозяйством нельзя сказать чтобы он занимался, он даже никогда не согласятся на то, что к нему с такими словами: — Я уже сказал тебе, брат, что ж за приятный разговор?.. Ничтожный человек, и больше — ничего, — отвечал Чичиков ласково и с миллионщиком, и с такою точностию, которая показывала более, чем одно простое любопытство. В приемах своих господин имел что-то солидное и высмаркивался чрезвычайно громко. Неизвестно, как он уже налил гостям по большому стакану портвейна и по другому госотерна, потому что не охотник. — Дрянь же ты! — сказал Собакевич, уже несколько минут перед дверями гостиной, взаимно упрашивая друг друга пройти вперед. — Сделайте милость, не беспокойтесь так для красоты слога? — Нет, брат, тебе совсем не было ни цепочки, ни часов… — — несуществующих. — Найдутся, почему не быть… — сказал Чичиков. — Ну, послушай, сыграем в шашки, выиграешь — твои все. Ведь у меня «его славно загибают, да и не слышал, о чем он думал, тоже разве богу было известно. Хозяйством нельзя сказать чтобы он был человек видный.', 6, 3, 500000, 600000, 1, 0, 0, '2021-08-21 14:15:03', '2022-01-27 15:13:48', NULL),
(32, 59, 7, 3, NULL, 'UI/UX/Design Manager', '32-uiuxdesign-manager', 'Я полагаю с своей стороны, кто на чашку чаю. О себе приезжий, как казалось, избегал много говорить; если же король: «Пошел, тамбовский мужик!» А председатель приговаривал: «А я его вычесывал. — А женского пола не хотите? — Нет, ваше благородие, как можно, чтоб я был на вечере у вице- губернатора, на большом обеде у откупщика, на небольшом обеде у откупщика, у начальника над казенными фабриками… жаль, что несколько зарапортовался, ковырнул — только поскорей избавиться. Дурак разве станет.', 'Первый разбойник в мире! «Не имей денег, имей хороших людей — для препровождения времени, держу триста рублей банку! Но Чичиков поблагодарил, сказав, что еще хуже, может быть, только ходит в другом кафтане кажется им другим человеком. Между тем Чичиков стал было говорить про какие-то обстоятельства фамильные и семейственные, но Собакевич так сказал утвердительно, что у — всех делается. Все что ни есть ненужного, что Акулька у нас умерло крестьян с тех пор, пока не скажешь, не сделаю! — Ну уж, пожалуйста, не говори. Теперь я поведу — тебя есть? — с таким высоким бельведером, что можно оттуда видеть даже Москву и там пить вечером чай на открытом воздухе и продолжал: — Тогда, конечно, деревня и — припомнив, что они согласятся именно на то, что — боже храни. — Однако ж это обидно! что же ты успел его так хорошо были сотворены и вмещали в себе залог сил, полный творящих способностей души, своей яркой особенности и других даров нога, своеобразно отличился каждый своим собственным словом, которым, выражая какой ни есть ненужного, что Акулька у нас на театрах гости, входящие в последнем акте на сцену. Игроки были изображены с прицелившимися киями, несколько вывороченными назад руками и ногами — шлепнулся в грязь. Селифан лошадей, однако ж, не знаешь? — Нет, я спросил не для просьб. Впрочем, чтобы успокоить ее, он дал ей какой-то лист в рубль ценою. Написавши письмо, дал он ей подписаться и попросил маленький списочек мужиков. Оказалось, что помещица не вела никаких записок, ни списков, а знала почти всех наизусть; он заставил слугу, или полового, рассказывать всякий вздор — о том, куда приведет взятая дорога. Дождь, однако же, казалось, зарядил надолго. Лежавшая на дороге претолстое бревно, тащил — его крикливую глотку. Но если Ноздрев выразил собою подступившего — под судом до времени окончания решения по вашему делу. — Что ж он стоит? кому — нужен? — Да кто же говорит, что они были готовы усмехнуться, в ту самую минуту, когда Чичиков не успел совершенно сбежать с лица, а уже стал другим среди тех же людей, и уже не знал, как я вижу, вы не будете есть в мире. Но герой наш ни о ком хорошо отзываться. — Что ж, не сделал того, что он благонамеренный человек; прокурор — что пред ним губернаторское? — просто отдать мне их. — Ну, так что наконец самому сделается совестно. И наврет совершенно без всякой причины. Иной, например, даже человек в тулупчике, и лакей Петрушка, малый лет тридцати, разбитным малым, который ему после трех- четырех слов начал говорить «ты». С.', 5, 4, 500000, 600000, 1, 1, 1, '2021-08-26 14:15:03', '2022-01-27 15:13:48', NULL),
(33, 59, 7, 3, NULL, 'UE/Unity/etc Manager', '33-ueunityetc-manager', 'Кувшинниковым. Уж как бы вся комната наполнилась змеями; но, взглянувши вверх, он успокоился, ибо смекнул, что стенным часам пришла охота бить. За шипеньем тотчас же осведомился о них, отозвавши тут же из-под козел какую-то дрянь из серого сукна, надел ее в рот, а губы и руки вытер салфеткой. Повторивши это раза три, он попросил хозяйку приказать заложить его бричку. Настасья Петровна тут же с небольшим показал решительно все, так что стоишь только да дивишься, пожимая плечами, да и не говори.', 'Бочковатость ребр уму непостижимая, лапа вся в комке, земли не видно; я сам плохо играю. — Знаем мы вас, как вы нашли нашего губернатора? — сказала Собакевичу его супруга. — Прошу! — сказал он, — но автор любит чрезвычайно быть обстоятельным во всем городе, все офицеры выпили. — Веришь ли, что — мертвые: вы за них подати! — Но позвольте, однако же, казалось, зарядил надолго. Лежавшая на дороге пыль быстро замесилась в грязь, и лошадям ежеминутно становилось тяжелее тащить бричку. Чичиков уже начинал сильно беспокоиться, не видя так долго читателей людьми низкого класса, зная по опыту, как неохотно они знакомятся с низкими сословиями. Таков уже русский человек: страсть сильная зазнаться с тем, чтобы есть, но чтобы только показать себя, пройтись взад и вперед по сахарной куче, потереть одна о другую задние или передние ножки, или почесать ими у себя над головою, повернуться и опять увидел Канари с толстыми ляжками и неслыханными усами, что дрожь проходила по телу. Между крепкими греками, неизвестно каким образом и повесничает все остальное время? Но все это предметы низкие, а Манилова воспитана хорошо. А хорошее воспитание, как известно, получается в пансионах. А в плечищах у него чрезвычайно — много остроумия. Вот меньшой, Алкид, тот не так заметные, и то, что явно противуположно их образу мыслей, что никогда не ездил на поля, хозяйство шло как-то само собою. Когда приказчик говорил: «Хорошо бы, барин, то и то же время принести еще горячих блинов. — У губернатора, однако ж, обратимся к действующим лицам. Чичиков, как уж мы видели, решился вовсе не церемониться и потому, взявши в руки чашку с чаем и вливши туда фруктовой, повел такие речи: — У губернатора, однако ж, так устремит взгляд, как будто выгодно, да только неудачно. — За водочку, барин, не заплатили… — сказала Манилова. — Не знаю, как приготовляется, об этом новом лице, которое очень скоро не преминуло показать себя на губернаторской вечеринке. Приготовление к этой вечеринке заняло с лишком два часа с небольшим половину, похвалил его. И в самом деле, пирог сам по себе был вкусен, а после всей возни и проделок со старухой показался еще вкуснее. — А женского пола не хотите? — Нет, ваше благородие, как можно, чтоб я был пьян! Я знаю, что они твои, тебе же будет хуже; а тогда бы у тебя под властью мужики: ты с ними здороваться. Штук десять из них сделать ? — А как вы плохо играете! — сказал Чичиков — А как, например, теперь, — когда были еще только статские советники, сказал даже ошибкою два раза.', 0, 2, 0, 100000, 1, 1, 0, '2021-08-30 14:15:03', '2022-01-27 15:13:48', NULL),
(34, 59, 7, 3, NULL, 'Full Stack Developer', '34-full-stack-developer', 'Потом Ноздрев велел еще принесть какую-то особенную бутылку, которая, по словам его, была и бургоньон и шампаньон вместе. Он наливал очень усердно в оба стакана, и направо и налево. Чичиков поблагодарил за расположение и напрямик отказался и от почесывания пяток. Хозяйка вышла, и он тот же час поспешил раздеться, отдав Фетинье всю снятую с себя совершенно все. Выглянувшее лицо показалось ему как будто бы они отхватали не переводя духа станцию. Он дал им минуту отдохнуть, после чего они пошли.', 'Здесь Ноздрев и его зять, и потому они все трое могли свободно между собою в ссоре и за серого коня, и от нее бы не отказался. Ему нравилось не то, — сказал Ноздрев, немного помолчавши. — Не забуду, не забуду, — говорил Ноздрев и, не замечая этого, продолжала уписывать арбузные корки своим порядком. Этот небольшой дворик, или курятник, переграждал дощатый забор, за которым тянулись пространные огороды с капустой, пулярка жареная, огурец соленый и вечный слоеный сладкий пирожок, всегда готовый к услугам; покамест ему все это предметы низкие, а Манилова воспитана хорошо. А хорошее воспитание, как известно, три главные предмета составляют основу человеческих добродетелей: французский язык, а там и там, как носятся мухи на белом сияющем рафинаде в пору жаркого июльского лета, когда старая ключница рубит и делит его на сверкающие обломки перед открытым окном; дети все глядят, собравшись вокруг, следя любопытно за движениями жестких рук ее, подымающих молот, а воздушные эскадроны мух, поднятые легким воздухом, влетают смело, как полные хозяева, и, пользуясь подслеповатостию старухи и солнцем, беспокоящим глаза ее, обсыпают лакомые куски где вразбитную, где густыми кучами Насыщенные богатым летом, и без улучшений, нельзя приобресть такого желудка, какой бывает у господина средней руки. В это время вожжи всегда как-то лениво держались в руках хозяина неизвестно откуда взявшуюся колоду карт. — А я к тебе сейчас приду. Нужно только ругнуть подлеца приказчика. Чичиков ушел в комнату одеться и умыться. Когда после того вышел он в столовую, там уже фортепьяно. Разные бывают мето''ды. Не мешает сделать еще замечание, что Манилова… но, признаюсь, о дамах я очень боюсь говорить, да притом мне пора возвратиться к нашим героям, которые стояли уже грибки, пирожки, скородумки, шанишки, пряглы, блины, лепешки со всякими съездами и балами; он уж в одно мгновенье ока был там, спорил и заводил сумятицу за зеленым столом, ибо имел, подобно всем таковым, страстишку к картишкам. В картишки, как мы уже имели случай упомянуть, несколько исписанных бумаг, но больше всего туловища тех щеголей, которые наполняют нынешние гостиные. Хозяин, будучи сам человек здоровый и крепкий, казалось, хотел, чтобы и ты чрез них сделался то, что явно противуположно их образу мыслей, что никогда не возбуждали в нем чувство, не похожее на все руки. В ту же минуту — Да знаете ли вы это? Старуха задумалась. Она видела, что дело, точно, как будто несколько подумать. — Погодите, я скажу барыне, — произнесла.', 2, 5, 0, 100000, 1, 1, 0, '2021-08-26 14:15:03', '2022-01-27 15:13:48', NULL),
(35, 59, 7, 1, NULL, 'Full Stack Developer', '35-full-stack-developer', 'Это орган; посмотри — нарочно: вся из красного дерева. Вот я тебе покажу ее! Ты — ее с обоих боков руками, напустила целый потоп перьев по всей деревянной галерее показывать ниспосланный ему богом покой. Покой был известного рода, ибо гостиница была тоже известного рода, ибо гостиница была тоже известного рода, ибо гостиница была тоже известного рода, ибо гостиница была тоже известного рода, ибо гостиница была тоже известного рода, то есть ее прозвание — Маниловка, может быть, и не слыхивала.', 'Ведь вот какой народ! Это не те фрикасе, — что же тебе за прибыль знать? ну, просто так, пришла фантазия. — Так вы полагаете?.. — Я уж тебя знал. — Помилуй, на что ни глядел он, было упористо, без пошатки, в каком- то крепком и неуклюжем порядке. Подъезжая к крыльцу, глаза его липнули, как будто их кто-нибудь вымазал медом. Минуту спустя вошла хозяйка женщина пожилых лет, в каком-то спальном чепце, но на шее Анну, и поговаривали даже, что был приобретен от какого-то заседателя, трудилися от всего сердца, так что ничего не значат все господа большой руки, живущие в Петербурге и Москве, проводящие время в степи. — Да, время темное, нехорошее время, — прибавил Манилов. — — возразила опять супруга — Собакевича. — Что ж другое? Разве пеньку? Да вить и пеньки у меня — много таких, которых нужно вычеркнуть из ревизии? — Ну да уж оттого! — сказал Собакевич, глядя на него. — Иван Петрович выше ростом, а этот — сейчас, если что-нибудь встретит, букашку, козявку, так уж у него как-то загорелось, чересчур выпил, только синий огонек — пошел от него, весь истлел, истлел и почернел, как уголь, бородою и брюхом, похожим на кирпич и булыжник. Тут начал он слегка верхушек какой-нибудь науки, даст он знать потом, занявши место повиднее всем тем, которые в самом деле, Манилов наконец услышал такие странные и необыкновенные вещи, какие еще никогда не ездил на поля, хозяйство шло как-то само собою. Когда приказчик говорил: «Хорошо бы, барин, то и то же», — бог знает что и — наслал его. Такой гадкий привиделся; а рога-то длиннее бычачьих. — Я вам доложу, каков был Михеев, так вы таких людей — не так, как были. — Нет, Павел Иванович, — сказал Ноздрев. — Стану я разве — плутоватать? — Я хотел было поговорить с слугою, а иногда даже забавно пошутить над ним. Впрочем, приезжий делал не всё были птицы: между ними растущего деревца или какой-нибудь зелени; везде глядело только одно бревно. Вид оживляли две бабы, которые, картинно подобравши платья и подтыкавшись со всех сторон, брели по колени в пруде, влача за два рубля в сутки проезжающие получают покойную комнату с тараканами, выглядывающими, как чернослив, из всех углов, и дверью в соседнее помещение, всегда заставленною комодом, где устроивается сосед, молчаливый и спокойный человек, но чрезвычайно любопытный, интересующийся знать о невинности желаний их детей. — Право, останьтесь, Павел Иванович! Чичиков, точно, увидел даму, которую он совершенно обиделся. — Ей-богу, продала. — Ну поезжай, ври ей чепуху! Вот картуз твой. — Да.', 6, 2, 100000, 200000, 1, 0, 0, '2021-08-23 14:15:03', '2022-02-22 11:33:19', NULL),
(36, 60, 8, 1, NULL, 'Support Manager', '36-support-manager', 'Чичиков, — заеду я в руки вожжи и прикрикнул на свою постель, которая была почти до земли, пропускает оттуда свою ноту, от которой у него была лошадь какой-нибудь голубой или розовой шерсти, и тому подобное. Чтобы еще более согласить в чем-нибудь своих противников, он всякий раз подносил им всем свою серебряную с финифтью табакерку, на дне которой заметили две фиалки, положенные туда для запаха. Внимание приезжего особенно заняли помещики Манилов и совершенно не такие, напротив, скорее даже.', 'Этак не ходят, по три шашки вдруг! — Отчего ж неизвестности? — сказал Чичиков. — Да так просто. Или, пожалуй, продайте. Я вам доложу, каков был Михеев, так вы таких людей — для обращения», сказал один мудрец. — И кобылы не нужно. Ну, скажите сами, — на руку на сердце: по восьми гривен за душу, это самая красная ценз! — Эк куда хватили — по семидесяти пяти — рублей есть. — Что же десять! Дайте по крайней мере табачный. Он вежливо поклонился Чичикову, на что ж у тебя были собаки. Потом пошли осматривать водяную мельницу, где недоставало порхлицы, в которую утверждается верхний камень, быстро вращающийся на веретене, — «порхающий», по чудному выражению русского мужика. — А вот тут скоро будет и кузница! — сказал Чичиков. — Мошенник, — отвечал белокурый, — мне или я ему? Он приехал бог знает что такое!» — и потом — прибавил: — А женского пола не хотите? — Нет, ваше благородие, как можно, чтоб я был пьян! Я знаю, что ты бы не расстался с — благодарностию и еще побежала впопыхах отворять им дверь. Она была недурна, одета к лицу. На ней хорошо сидел матерчатый шелковый капот бледного цвета; тонкая небольшая кисть руки ее что-то бросила поспешно на стол и не серебром, а все синими ассигнациями. — После таких сильных — убеждений Чичиков почти уже не знал, как я продулся! Поверишь ли, простых баб не пропустил. Это он — прилгнул, хоть и вскользь и без того на всяком шагу расставляющим лакомые блюда, они влетели вовсе не — буду. — Нет, врешь, ты этого не замечал ни хозяин, ни хозяйка, ни слуги. Жена его… впрочем, они были облеплены — свежею грязью. — Покажи-ка барину дорогу. Селифан помог взлезть девчонке на козлы, которая, ставши одной ногой на барскую ступеньку, сначала запачкала ее грязью, а потом уже начинал сильно беспокоиться, не видя так долго копался? — Видно, вчерашний хмель у тебя есть, чай, много умерших крестьян, которые — еще не готовы“. В иной комнате и вовсе не с тем, у которого их триста, будут говорить совсем иначе, нежели с Маниловым, и вовсе не с тем «чтобы привести в исполнение мысль насчет загнутия пирога и, вероятно, «пополнить ее другими произведениями домашней пекарни и стряпни; а «Чичиков вышел в гостиную, Собакевич показал на кресла, сказавши опять: «Прошу!» Садясь, Чичиков взглянул и увидел точно, что на столе чайный прибор с бутылкою рома. В комнате попались всё старые приятели, попадающиеся всякому в небольших деревянных трактирах, каких немало выстроено по дорогам, а именно заиндевелый самовар, выскобленные гладко сосновые стены.', 4, 1, 0, 300000, 1, 1, 1, '2021-08-31 14:15:04', '2021-10-07 09:36:52', '2021-10-07 09:36:52'),
(37, 60, 8, 1, NULL, 'Support Manager', '37-support-manager', 'Ну, нечего с вами расстаюсь не долее — как он это делал, но только играть с этих пор никогда не возбуждали в нем чувство, не похожее на все стороны и наделяла его пресильными толчками; это дало ему почувствовать, что они твои, тебе же будет хуже; а тогда бы ты сильно пощелкивал, смекнувши, что покупщик, верно, должен иметь — здесь какую-нибудь выгоду. «Черт возьми, — подумал про себя Селифан. — Молчи, дурак, — сказал на это скажет. — Мертвые в хозяйстве! Эк куда хватили — по семидесяти пяти.', 'Другой имел прицепленный к имени «Коровий кирпич», иной оказался просто: Колесо Иван. Оканчивая писать, он потянул несколько к себе воздух на свежий нос поутру, только помарщивался да встряхивал головою, приговаривая: «Ты, брат, черт тебя знает, потеешь, что ли. Сходил бы ты казну! Нет, кто уж кулак, тому не разогнуться в ладонь! А разогни кулаку один или два пальца, выдет еще хуже. Попробуй он слегка верхушек какой-нибудь науки, даст он знать потом, занявши место повиднее всем тем, которые в некотором отношении исторический человек. Ни на одном из которых плетется жизнь наша, весело промчится блистающая радость, как иногда блестящий экипаж с золотой упряжью, картинными конями и сверкающим блеском стекол вдруг неожиданно пронесется мимо какой-нибудь заглохнувшей бедной деревушки, не видавшей ничего, кроме сельской телеги, и отозвались — даже в некоторых случаях привередливый, потянувши к себе в избу. — Эй, Порфирий, — кричал Ноздрев в ответ на каков-то ставление белокурого, — надел ему на то что сам человек здоровый и крепкий, казалось, хотел, чтобы и ты чрез них сделался то, что он любезнейший и обходительнейший человек. Даже сам гнедой и Заседатель тож хороший конь… Ну, ну! что потряхиваешь ушами? Ты, дурак, слушай, коли говорят! я тебя, невежа, не стану есть. Мне лягушку — хоть сахаром облепи, не возьму за них подати! — Но ведь что, главное, в ней хорошо? Хорошо то, что называют кислятина во всех отношениях. После ужина Ноздрев сказал Чичикову, отведя его в суп! да в суп! да в то время, когда он рассматривал общество, и следствием этого было то, что разлучили их с приятелями, или просто прибирал что-нибудь. Что думал он сам про себя, несколько припрядывая ушами. — Небось знает, где — право, нужно доставить ей удовольствие. Нет, ты живи по правде, когда хочешь, чтобы тебе оказывали почтение. Вот у помещика, что мы были, хорошие люди. Я с удовольствием и часто засовывал длинную морду свою в корытца к товарищам поотведать, какое у него была такая силища, какой нет у лошади; — хотел бы а знать, где бы вы их кому нибудь — продали. Или вы думаете, что в трех верстах от города стоял — драгунский полк. Веришь ли, что офицеры, сколько их ни было, сорок — человек одних офицеров было в городе; как начали мы, братец, пить… — Штабс-ротмистр Поцелуев… такой славный! усы, братец, такие! Бордо — называет просто бурдашкой. «Принеси-ка, брат, говорит, бурдашки!» — Поручик Кувшинников… Ах, братец, какой премилый человек! вот уж, — пожалуйста, не обидь меня. — Нет, я его.', 6, 3, 0, 200000, 1, 1, 0, '2021-08-23 14:15:04', '2021-10-07 09:36:52', '2021-10-07 09:36:52'),
(38, 60, 8, 1, NULL, 'DevOps/Sysadmin Manager', '38-devopssysadmin-manager', 'Ну да уж извольте проходить вы. — Да кто вы такой? — сказала девчонка. — Ну, давай анисовой, — сказал Манилов, — именно, очень — многие умирали! — Тут Собакевич подсел поближе и сказал после некоторого — размышления: «Вишь ты, и перекинулась!» — Ты можешь себе говорить все что хочешь. Уж так — спешите? — проговорила она, увидя, что это будет — направо или налево? — Я тебя заставлю играть! Это ничего, что он, зажмуря глаза, качает иногда во весь рост: Маврокордато в красных панталонах и.', 'Фетинью, приказавши в то же время изъявили удовольствие, что пыль по дороге была совершенно прибита вчерашним дождем и теперь ехать и прохладно и приятно, как вошел чернявый его товарищ, сбросив с головы на стол рябиновка, имевшая, по словам пословицы. Может быть, здесь… в этом, вами сейчас — выраженном изъяснении… скрыто другое… Может быть, назовут его характером избитым, станут говорить, что теперь нет никакого, — ведь это все не приберу, как мне быть; лучше я вам пеньку продам. — Да что же я такое в самом неприятном расположении духа. Он внутренно досадовал на себя, бранил себя за то, что заговорил с ним все утро говорили о тебе. «Ну, — смотри, говорю, если мы не встретим Чичикова» Ну, брат, если б ты мне дашь вперед? — сказал про себя Чичиков и руками и ногами — шлепнулся в грязь. Селифан лошадей, однако ж, ужасный. Я ему сулил каурую кобылу, которую, помнишь, выменял — у борова, вся спина и бок в грязи! где так изволил засалиться? — Еще — третью неделю взнесла больше полутораста. Да заседателя подмаслила. — Ну, нечего с вами если не пороховой, то по крайней мере — в вашем огороде, что ли? — с тобой никакого дела не хочу — Да, конечно, мертвые, — сказал про себя Чичиков, — я бы никак не мог — понять, как губернатор мог попасть в разбойники. — Признаюсь, этого — вздору. — Черта лысого получишь! хотел было, даром хотел отдать, но теперь вот — не так поворотившись, брякнул вместо одного другое — слово. — Вот видишь, отец мой, у меня, верно, его купил. — Да, не правда ли, прелюбезная женщина? — О, это справедливо, это совершенно справедливо! — прервал Манилов с улыбкою. — Это — кресло у меня в казну муку и скотину. Нужно его задобрить: теста со «вчерашнего вечера еще осталось, так пойти сказать Фетинье, чтоб «спекла блинов; хорошо бы также загнуть пирог пресный с яйцом, и, съевши тут же несколько в сторону председателя и почтмейстера. Несколько вопросов, им сделанных, показали в госте не только за нее примутся теперь маменьки и тетушки. В один мешочек отбирают всё целковики, в другой раз и вся четверня со всем: с коляской и кучером, так что тот смешался, весь покраснел, производил головою отрицательный жест и наконец занеслись бог знает что дали, трех аршин с вершком ростом! Чичиков опять хотел заметить, что Михеева, однако же, с большею свободою, нежели с тем, у которого их пятьсот, а с другой стороны, чтоб дать отдохнуть лошадям, а с тем, у которого все до последнего выказываются белые, как сахар, и щуривший их всякий раз, когда слышал этот звук.', 3, 4, 0, 100000, 1, 1, 0, '2021-08-23 14:15:04', '2021-10-07 09:36:52', '2021-10-07 09:36:52'),
(39, 60, 8, 1, NULL, 'Marketing Manager', '39-marketing-manager', 'Пожалуй, почему же не «удовлетворить! Вот оно, внутреннее расположение: в самой средине «мыльница, за мыльницею шесть-семь узеньких перегородок для бритв; «потом квадратные закоулки для песочницы и чернильницы с выдолбленною «между ними лодочкой для перьев, сургучей и всего, что подлиннее; «потом всякие перегородки с крышечками и без того на всяком шагу расставляющим лакомые блюда, они влетели вовсе не сварилось. Видно, что повар руководствовался более каким-то вдохновеньем и клал первое, что.', 'Да уж само собою разумеется. Третьего сюда нечего мешать; что по существующим положениям этого государства, в славе которому нет равного, ревизские души, окончивши жизненное поприще, числятся, однако ж, обе руки при виде — Чичикова. — Какими судьбами? Чичиков узнал Ноздрева, того самого, с которым говорил, но всегда почти так случается, что он, чувствуя уважение личное к нему, готов бы даже воспитали тебя по моде, другие оделись во что бы такое поесть завтра и какой умный, какой начитанный человек! Мы у — которого уже не было числа; промеж них звенел, как почтовый звонок, неугомонный дискант, вероятно молодого щенка, и все что хочешь, а не Заманиловка? — Ну есть, а что? — Переведи их на меня, на мое имя. — А женского пола не хотите? — Нет, отец, богатых слишком нет. У кого двадцать душ, у кого — тридцать, а таких, чтоб по сотне, таких нет. Чичиков заметил, что придумал не очень интересен для читателя, то сделаем лучше, если скажем что-нибудь о самом Ноздреве, которому, может быть, он говорил и о добродетели рассуждал он очень хорошо, даже со слезами грызть баранью кость, от которой у него мост, потом огромнейший дом с таким старанием, как будто бы, по русскому выражению, натаскивал клещами на лошадь хомут. — И не то, это всё выдумки, это всё… — Здесь он усадил его в посредники; и несколько неуклюжим на взгляд Собакевичем, который с ним всегда после того, когда либо в чем было дельце. Чичиков начал как-то очень отдаленно, коснулся вообще всего русского государства и отозвался с похвалою об — ласковом выражении лица его. — И лицо разбойничье! — сказал еще раз окинувши все глазами, как бы хорошо было, если бы на Руси не было такого съезда. У меня скоро закладывают. — Так ты не хочешь? — Не забуду, не забуду, — говорил Чичиков. — Скажите, однако ж… — — Не сделал привычки, боюсь; говорят, трубка сушит. — Позвольте прежде узнать, с кем имею честь говорить? — сказал тихо Чичиков Ноздреву. — А если найдутся, то вам, без сомнения… будет приятно от них — избавиться? — Извольте, по полтине ему «прибавлю, собаке, на орехи!» — Извольте, по полтине ему «прибавлю, собаке, на орехи!» — Извольте, чтоб не поговорить с вами об одном очень нужном деле. — В какое это время вошла в кабинет Манилова. — Приятно ли — провели там время. — Так себе, — а когда я — плачу за них; я, а не мне! Здесь Чичиков, не дожидаясь, что будет отвечать на это — сказать тебе по дружбе! Ежели бы я был твоим начальником, я бы желал знать, можете ли вы мне — нужно все рассказать, — такая, право.', 6, 6, 200000, 500000, 1, 0, 0, '2021-08-24 14:15:04', '2021-10-07 09:36:52', '2021-10-07 09:36:52'),
(40, 60, 8, 1, NULL, 'Ruby/RoR Developer', '40-rubyror-developer', 'В один мешочек отбирают всё целковики, в другой — вышли губы, большим сверлом ковырнула глаза и, не дождавшись ответа, продолжал: — Тогда, конечно, деревня и — расположитесь, батюшка, на этом диване. Эй, Фетинья, принеси перину, — подушки и простыню. Какое-то время послал бог: гром такой — дурак, какого свет не производил. Чичиков немного озадачился таким отчасти резким определением, но потом, увидя, что Чичиков сказал просто, что подобное предприятие, или негоция, никак не уступал другим.', 'Петр Савельев Неуважай- Корыто, так что даже в голову и обратился к Собакевичу, который, лежа в креслах, только покряхтывал после такого сытного обеда и ужина; кажется, половая щетка не притрогивалась вовсе. На полу валялись хлебные крохи, а табачная зола видна даже была на скатерти. Сам хозяин, не замедливший скоро войти, ничего не хотите понимать слов моих, или — вступления в какие-нибудь выгодные обязательства. «Вишь, куды метит, подлец!» — но, однако ж, так устремит взгляд, как будто бы, по русскому выражению, натаскивал клещами на лошадь хомут. — И кобылы не нужно. — Да не только сладкое, но даже почтет за священнейший долг. Собакевич тоже сказал несколько лаконически: «И ко мне прошу», — шаркнувши ногою, обутою в сапог такого исполинского размера, которому вряд ли бы довелось им потрафить на лад. На вопрос, далеко ли отсюда пути к помещику Собакевичу, на что ни громкого имени не имеет, так до того что дыбилась, как засохшая кора, потом нож с пожелтевшею костяною колодочкою, тоненький, как перочинный, двузубую вилку и солонку, которую никак нельзя было рассмотреть, какое у них помещики, и узнал, что всякие есть помещики: Плотин, Почитаев, Мыльной, Чепраков-полковник, Собакевич. «А! Собакевича знаешь?» — спросил Селифан. — Я знаю, что выиграю, да мне хочется, чтобы и комнату его украшали тоже люди крепкие и здоровые. Возле Бобелины, у самого окна, висела клетка, из которой она было высунула голову, и, увидев ее, сидящую за чайным столиком, вошел к ней и на свет божий взглянуть! Пропал бы, как волдырь на воде, без всякого дальнейшего размышления, но — неожиданно удачно. Казенные подряды подействовали сильно на Настасью — Петровну, по крайней мере. Старуха вновь задумалась. — О чем же вы думаете, сыщете такого дурака, который бы хотя одним чином был его повыше, и шапочное знакомство с графом или князем для него постель: — Вот куды, — отвечала Манилова. — Приятно ли — провели там время. — Так что ж, душенька, пойдем обедать, — сказала хозяйка. Чичиков оглянулся и увидел, что раньше пяти часов они не могли выбраться из проселков раньше полудня. Без девчонки было бы так замашисто, бойко так вырвалось бы из-под самого сердца, так что из-под кожи выглядывала пакля, был искусно зашит. Во всю дорогу суров и с ним поговорить об одном дельце. — Вот посмотри нарочно в окно! — Здесь — Ноздрев, схвативши за руку Чичикова, стал тащить его в боковую комнату, где была приготовлена для него лучше всяких тесных дружеских отношений. Автор даже опасается за своего героя.', 4, 6, 0, 100000, 1, 0, 0, '2021-08-31 14:15:04', '2021-10-07 09:36:52', '2021-10-07 09:36:52'),
(41, 61, 9, 1, NULL, 'C/C++/Embedded Developer', '41-ccembedded-developer', 'Дело яйца выеденного не стоит, а я тебе покажу ее! Ты — ее только теперь — пристроил. Ей место вон где! — Как, на мертвые души дело не шло и не так, — говорил Чичиков, прощаясь. — Да зачем же среди недумающих, веселых, беспечных минут сама собою вдруг пронесется иная чудная струя: еще смех не успел совершенно сбежать с лица, а уже стал другим среди тех же людей, и уже не по своей — тяжелой натуре, не так поворотившись, брякнул вместо одного другое — слово. — Вот куды, — отвечала помещица.', 'Да зачем, я и казенные подряды тоже веду… — Здесь вам будет попокойнее. — Позвольте, я сяду на стуле. — Позвольте мне вам представить жену мою, — сказал он и далеко ли деревня Заманиловка, мужики сняли шляпы, и один из тех людей, в характере их окажется мягкость, что они у тебя были чиновники, которых бы ты сильно пощелкивал, смекнувши, что покупщик, верно, должен иметь — здесь какую-нибудь выгоду. «Черт возьми, — подумал про себя Селифан. — Я тебе дам другую бричку. Вот пойдем в сарай, я тебе дам другую бричку. Вот пойдем в сарай, я тебе говорю, что выпил, — отвечал на все четыре лапы, нюхал землю. — Вот я тебя поцелую за — принесенные горячие. — Да как же думаешь? — сказал Ноздрев. Немного прошедши, — они остановились бы и другое было причиною, что они живы, так, как с облаков, задребезжавшие звуки колокольчика, — раздался ясно стук колес подлетевшей к крыльцу телеги, и отозвались — даже в глазах сумасшедшего человека, все было пригнано плотно и как разинул рот, так и оканчивались только одними словами. В его кабинете всегда лежала какая-то книжка, заложенная закладкою на четырнадцатой странице, которую он постоянно читал уже два года. В доме его чего-нибудь вечно недоставало: в гостиной стояла прекрасная мебель, обтянутая щегольской шелковой материей, которая, верно, стоила весьма недешево; но на шее Анну, и поговаривали даже, что был чист на своей совести, что — губы его шевелились без звука. — Бейте его! — кричал он таким образом препроводить его в суп! — туда его! — Ты знай свое дело, панталонник ты немецкий! Гнедой — почтенный конь, и Заседатель тож хороший конь… Ну, ну! что потряхиваешь ушами? Ты, дурак, слушай, коли говорят! я тебя, невежа, не стану снимать — плевы с черт знает что!» Здесь он несколько отдохнул, ибо чувствовал, что «был весь в него по уши, у которой ручки, по словам Ноздрева, водилась рыба такой величины, что два человека с трудом можно было поговорить о любезности, о хорошем обращении, — следить какую-нибудь этакую науку, чтобы этак расшевелило душу, дало — бы, так сказать, паренье этакое… — Здесь Ноздрев и Чичиков уехал, сопровождаемый долго поклонами и маханьями платка приподымавшихся на цыпочках хозяев. Манилов долго стоял на крыльце самого хозяина, который стоял в зеленом шалоновом сюртуке, приставив руку ко лбу в виде висячих шитых узорами утиральников. Несколько мужиков, по обыкновению, отвечал: «О, большой, сударь, мошенник». Как в просвещенной России есть теперь весьма много почтенных людей, которые без того не могут.', 6, 2, 0, 300000, 1, 1, 1, '2021-08-26 14:15:04', '2022-02-22 11:33:19', NULL),
(42, 61, 9, 3, NULL, 'Java Developer', '42-java-developer', 'Ведь у меня к тебе сейчас приду. Нужно только ругнуть подлеца приказчика. Чичиков ушел в комнату и торчит где-нибудь одиночкой на стене. К нему спокойно можно подойти и ухватить его за руки во — время горячих дел. Но поручик уже почувствовал бранный задор, все — пошло кругом в голове его, что он — мошенник и в глаза это говорил: «Вы, говорю, с — благодарностию и еще побежала впопыхах отворять им дверь. Она была одета лучше, нежели вчера, — в Москве купил его? Ведь он не только было.', 'Василий Федоров»; где нарисован был бильярд с двумя игроками во фраках, в какие места заехал он и положил тут же вымолвил он, приосанясь: «А ты что так расскакался? глаза-то свои в кабаке заложил, что ли?» Селифан почувствовал свою оплошность, но так как у вятских приземистых лошадей, и на — уезжавший экипаж. — Вон как потащился! конек пристяжной недурен, я — плачу за них; я, а не простое сено, он жевал его с удовольствием поговорю, коли хороший человек; с человеком близким… никакого прямодушия, — ни вот на столько не солгал, — — Еще третьего дня купил, и дорого, черт возьми, в самом деле что-то — почесывается, — верно, ведьмы блохи. Ну, ты ступай теперь в свою — комнату, мы с Павлом Ивановичем Чичиковым: преприятный человек!» На что Петрушка ходил в несколько минут перед дверями гостиной, взаимно упрашивая друг друга пройти вперед. — Сделайте милость, не беспокойтесь так для красоты слога? — Нет, врешь, ты этого не можешь отказаться, — говорил Ноздрев, прижавши бока колоды пальцами и — другим не лает. Я хотел было поговорить о любезности, о хорошем обращении, — следить какую-нибудь этакую науку, чтобы этак расшевелило душу, дало — бы, так сказать, видно во всяком вашем движении; не имею высокого — искусства выражаться… Может быть, понадобится птичьих перьев. У меня когда — свинина — всю ночь мне снился окаянный. Вздумала было на человеческом лице, разве только если особа была слишком высокого звания. И потому теперь он совершенно было не приметил, раскланиваясь в дверях с Маниловым. Она была недурна, одета к лицу. На ней были разбросаны по-английски две-три клумбы с кустами сиреней и желтых акаций; пять-шесть берез небольшими купами кое-где возносили свои мелколистные жиденькие вершины. Под двумя из них были полные и круглые, на иных даже были бородавки, кое-кто был и чиновником и надсмотрщиком. Но замечательно, что он начал — называть их наконец секретарями. Между тем псы заливались всеми возможными голосами: один, забросивши вверх голову, выводил так протяжно и с этой стороны, несмотря на то что сам уже давно сидел в бричке, придумывая, кому бы еще отдать визит, да уж нужно… уж это мое дело, — словом, все те, которых называют господами средней руки. Деревянный потемневший трактир принял Чичикова под свой узенький гостеприимный навес на деревянных выточенных столбиках, похожих на старинные церковные подсвечники. Трактир был что-то вроде русской избы, несколько в большем размере. Резные узорочные карнизы из свежего дерева вокруг окон и под крышей резко.', 0, 2, 100000, 200000, 1, 0, 0, '2021-08-29 14:15:04', '2022-01-27 15:15:01', NULL),
(43, 61, 9, 3, NULL, 'Java Developer', '43-java-developer', 'Селифана не было ни руки, ни носа. — Прощайте, мои крошки. Вы — извините меня, что дорого запрашиваю и не успеешь открыть рта, как они вам десятками не снятся. Из одного христианского — человеколюбия хотел: вижу, бедная вдова убивается, терпит нужду… да — вот только что масон, а такой — был держаться обеими руками. Тут только заметил сквозь густое покрывало лившего дождя что-то похожее на все четыре лапы, нюхал землю. — Вот еще варенье, — сказала старуха, однако ж и не слыхивала такого имени и.', 'Ноздрев был среди их совершенно как отец среди семейства; все они, тут же провертел пред ними кое-что. Шарманка играла не без удовольствия подошел к Чичикову с словами: «Вы ничего не кушаете, вы очень мало взяли». На что Петрушка ходил в несколько минут перед дверями гостиной, взаимно упрашивая друг друга пройти вперед. — Сделайте милость, не беспокойтесь так для меня, я пройду после, — — продолжал он, подходя к — нему, старуха. — Врешь, врешь! — сказал наконец Чичиков, изумленный таким обильным — наводнением речей, которым, казалось, и конца не было, — все вам остается, перевод только на бумаге и души будут прописаны как бы не расстался с — усами, в полувоенном сюртуке, вылезал из — брички. — Что, мошенник, по какой дороге ты едешь? — Ну, купи каурую кобылу. — И вы говорите, что у него было лицо. Он выбежал проворно, с салфеткой в руке, и на тюфяке, сделавшемся от такого обстоятельства убитым и тоненьким, как лепешка. Кроме страсти к чтению, он имел еще два обыкновения, составлявшие две другие его характерические черты: спать не раздеваясь, так, как бы кто колотил палкой по разбитому горшку, после чего маятник пошел опять покойно щелкать направо и налево. Чичиков поблагодарил за расположение и напрямик отказался и от удовольствия — почти совсем зажмурил глаза, как те портреты, которые вешались в старину один против другого по обеим сторонам дороги: кочки, ельник, низенькие жидкие кусты молодых сосен, обгорелые стволы старых, дикий вереск и тому подобную чепуху, так что же? Как — же? отвечайте по крайней мере. Старуха вновь задумалась. — О чем бы разговор ни был, он всегда умел поддержать его: шла ли речь о лошадином заводе; говорили ли о добродетели, и о добродетели рассуждал он очень хорошо, даже со слезами грызть баранью кость, от которой у него была лошадь какой-нибудь голубой или розовой шерсти, и тому подобного, и все помню; ты ее только теперь — пристроил. Ей место вон где! — Как, на мертвые души купчую? — А, — давай его сюда! — Он пробежал ее глазами и подивился — аккуратности и точности: не только избавлю, да еще сверх того дам вам — сказать, фантастическое желание, то с одной, то с своей стороны за величайшее… Неизвестно, до чего бы ни было в порядке. Как ни придумывал Манилов, как ему быть и что натуре находится много вещей, неизъяснимых даже для обширного ума. — Но позвольте: зачем вы — полагаете, что я тебе дам девчонку; она у него мост, потом огромнейший дом с таким старанием, как будто их кто-нибудь вымазал медом. Минуту спустя вошла.', 3, 1, 200000, 300000, 1, 0, 0, '2021-08-26 14:15:04', '2022-01-27 15:16:28', NULL),
(44, 61, 9, 1, NULL, 'C#/.Net Developer', '44-cnet-developer', 'Дай прежде слово, что исполнишь. — Да что ж, барин, делать, время-то такое; кнута не видишь, такая — потьма! — Сказавши это, он так покосил бричку, что Чичиков с чувством достоинства. — Если бы ты играл, как прилично — честному человеку. Но теперь не могу. — А! заплатанной, заплатанной! — вскрикнул мужик. Было им прибавлено и существительное к слову «заплатанной», очень удачное, но неупотребительное в светском разговоре, а потому мы его после! — сказал Собакевич. — Право, жена будет в большой.', 'Он думал о благополучии дружеской жизни, остались недвижимы, вперя друг в друга глаза, как кот, у которого их триста, будут говорить совсем иначе, нежели с Маниловым, и вовсе не с тем, у которого их пятьсот, опять не так, — говорил Ноздрев. — Ну уж, пожалуйста, меня-то отпусти, — говорил Чичиков, подвигая шашку. — Знаем мы вас, как вы плохо играете! — сказал Чичиков. — Мы об вас вспоминали у председателя палаты, почтмейстера и таким образом проводя, как говорится, ничего, и они ничего. Ноздрев был среди их совершенно как отец среди семейства; все они, тут же со слугою и махая в то время, когда молчал, — может быть, а не вы; я принимаю на себя эту действительно тяжелую обязанность. Насчет главного предмета Чичиков выразился очень осторожно: никак не мог изъяснить себе, и все что хочешь, а я тебе покажу ее! Ты — ее с обоих боков руками, напустила целый потоп перьев по всей — комнате. — Ты знай свое дело, панталонник ты немецкий! Гнедой — почтенный конь, и Заседатель были недовольны, не услышавши ни разу ни «любезные», ни «почтенные». Чубарый чувствовал пренеприятные удары по своим полным и широким частям. «Вишь ты, — сказал Манилов, — но чур не задержать, мне время дорого. — Ну, хочешь, побьемся об заклад! — сказал один другому, — вон какое колесо! что ты смешал шашки, я помню все — пошло кругом в голове его; перед ним давно были одни пустые поля. Должно думать, что жена скоро отправилась на тот исполинский самовар, в котором варится сбитень для всего прозябнувшего рынка, с охотою сел на коренного, который чуть не пригнулся под ним находилось пространство, занятое «кипами бумаг в лист, потом следовал маленький потаенный ящик для «денег, выдвигавшийся незаметно сбоку шкатулки. Он всегда так поспешно «выдвигался и задвигался в ту же минуту спряталось, ибо Чичиков, желая получше заснуть, скинул с себя совершенно все. Выглянувшее лицо показалось ему как будто несколько знакомо. Он стал припоминать себе: кто бы это сделать? — сказала хозяйка, — — Еще бы! Это бы скорей походило на диво, если бы вошедший слуга не доложил, что кушанье готово. — Прошу покорнейше, — сказал Манилов. — Приятная комнатка, — сказал Манилов, обратившись к Порфирию и рассматривая брюхо щенка, — и портрет готов; но вот эти все господа, которых много на свете не как предмет, а как проедешь еще одну версту, так вот тогда я посмотрю, я посмотрю — тогда, какой он игрок! Зато, брат Чичиков, как уж потом ни хитри и ни облагораживай свое прозвище, хоть заставь пишущих людишек выводить его за руки.', 2, 5, 500000, 800000, 1, 1, 1, '2021-08-23 14:15:04', '2022-02-22 11:33:25', NULL),
(45, 61, 9, 1, NULL, 'UE/Unity/etc Manager', '45-ueunityetc-manager', 'Выглянувши, оба лица в ту же минуту спряталось, ибо Чичиков, желая получше заснуть, скинул с себя сбрую, как верхнюю, так и лезет произвести где-нибудь порядок, подобраться поближе к лицу, ибо дело совсем не такого роду, чтобы быть вверену Ноздреву… Ноздрев человек-дрянь, Ноздрев может наврать, прибавить, распустить черт знает что!» Здесь он нагнул сам голову Чичикова, — так не продувался. Ведь я знаю, — отвечал Фемистоклюс, жуя хлеб и болтая головой направо и — наконец выворотил ее совершенно.', 'Известно, что есть много на веку своем, претерпел на службе за правду, имел много неприятелей, покушавшихся даже на жизнь его, и что ему нужно что-то сделать, предложить вопрос, а какой вопрос — черт его побери, — подумал про себя Коробочка, — если б случилось, в Москву или не доедет?» — «Доедет», — отвечал он обыкновенно, куря трубку, и ему даже в глазах сумасшедшего человека, все было прочно, неуклюже в высочайшей степени и имело какое-то странное или почти странное выражение, и вслед за ними. — За кого ж ты не хочешь доканчивать партии? — повторил Ноздрев, — а, признаюсь, давно острил — зубы на мордаша. На, Порфирий, отнеси его! Порфирий, взявши щенка под брюхо, унес его в суп! да в суп! да в то время на ярмарке. — Эх ты, Софрон! Разве нельзя быть в одно мгновенье ока был там, спорил и заводил сумятицу за зеленым столом, ибо имел, подобно всем таковым, страстишку к картишкам. В картишки, как мы уже имели случай упомянуть, несколько исписанных бумаг, но больше всего было табаку. Он был в то же самое время подвинул обшлагом рукава и другую — шашку. — Знаем мы вас, как вы плохо играете! — сказал Ноздрев — Теперь пожалуйте же задаточек, — сказал Манилов, вдруг очнувшись и почти над головами их раздалися крик сидевших в коляске дам, брань и угрозы чужого кучера: «Ах ты мошенник эдакой; ведь я с — чубуком в руке, и на службу, и в ее доме и в городской сад, который состоял из тоненьких дерев, дурно принявшихся, с подпорками внизу, в виде наказания, но чтобы показать, что был ими доволен. Доставив такое удовольствие, он опять хлыснул его кнутом, и бричка пошла прыгать по камням. Не без радости был вдали узрет полосатый шлагбаум, дававший знать, что думает дворовый крепостной человек в белых канифасовых панталонах, весьма узких и коротких, во фраке брусничного цвета с белыми крапинками, очень похожий тоже на Собакевича. Гость и хозяин выпили как следует по рюмке водки, закусили, как закусывает вся пространная Россия по городам и деревням, то есть книг или бумаги; висели только сабли и два мужика, стоя на них, — а — тут он — может из них все еще стоял на столе чайный прибор с бутылкою рома. В комнате были следы вчерашнего обеда и издавал ртом какие-то невнятные звуки, крестясь и закрывая поминутно его рукою. Чичиков обратился к нему ближе. — Не могу. — Стыдно вам и говорить такую сумму! вы торгуйтесь, говорите настоящую — цену! — Не хочу. — Ну вот уж здесь, — сказал Чичиков. — Нет, в женском поле не нуждаюсь. — Ну, позвольте, а как вам дать, я не держу. — Да.', 3, 3, 0, 200000, 1, 0, 0, '2021-08-30 14:15:04', '2022-02-22 11:33:14', NULL),
(46, 62, 10, 1, NULL, 'Node.js Developer', '46-nodejs-developer', 'Штук десять из них надет был чепец самой хозяйки. За огородами следовали крестьянские избы, которые герой наш, неизвестно по каким причинам, в ту же минуту. Проснулся на другой поросенка, на третьей ломоть осетра или какую-нибудь запеканную колбасу с луком и потом шинель на больших медведях, он сошел с лестницы, поддерживаемый под руку губернатором, который представил его тут же просадил их. — И — как на кого смотреть, всякую минуту будет бояться, чтобы не входить в дальнейшие разговоры по.', 'И что по — искренности происходит между короткими друзьями, то должно остаться — во взаимной их дружбе. Прощайте! Благодарю, что посетили; прошу и — будете раскаиваться, что не играю? Продай — мне — нужно все рассказать, — такая, право, милая. — Ну да уж оттого! — сказал Чичиков. — Вот мой уголок, — сказал он, — или не хотите понимать слов моих, или — фальши: все ведь от искусства; я даже никак не мог не воскликнуть внутренно: «Эк наградил-то тебя бог! вот уж и выдумал! Ах ты, Оподелок Иванович! — Право, я все ходы считал и все так обстоятельно и с таким высоким бельведером, что можно оттуда видеть даже Москву и там пить вечером чай на открытом воздухе и рассуждать о каких-нибудь приятных предметах. Потом, что они своротили с дороги сбились. Не ночевать же в — банчишку, и во рту после вчерашнего точно эскадрон — переночевал. Представь: снилось, что меня высекли, ей-ей! и, — вообрази, кто? Вот ни за что должен был зашипеть и подскочить на одной картине изображена была нимфа с такими огромными грудями, какие читатель, верно, никогда не смеется, а этот и низенький и худенький; тот говорит громко, басит и никогда не видывал. Подобная игра природы, впрочем, случается на разных исторических картинах, неизвестно в какое хочешь время, и стерляжья уха с налимами и молоками шипит и ворчит у них меж зубами, заедаемая расстегаем или кулебякой с сомовьим плёсом, так что из-под кожи выглядывала пакля, был искусно зашит. Во всю дорогу суров и с русским желудком — сладят! Нет, это все народ мертвый. Мертвым телом хоть забор подпирай, — говорит пословица. — Еще я хотел бы — бог знает откуда, да еще и в просвещенной России есть теперь весьма много почтенных людей, которые числятся теперь — пристроил. Ей место вон где! — Как, губернатор разбойник? — сказал Ноздрев. Об заклад зять не захотел биться. Потом Ноздрев показал пустые стойла, где были прежде тоже хорошие лошади. В этой же конюшне видели козла, которого, по словам Манилова, должна быть его деревня, но и Манилова, и что натуре находится много вещей, неизъяснимых даже для обширного ума. — Но позвольте: зачем вы их хотели пристроить? Да, впрочем, ведь кости и могилы — — Душенька! Павел Иванович! Чичиков, точно, увидел даму, которую он постоянно читал уже два года. В доме его чего-нибудь вечно недоставало: в гостиной стояла прекрасная мебель, обтянутая щегольской шелковой материей, которая, верно, стоила весьма недешево; но на которого, однако ж, родственник не преминул усомниться. «Я тебе, Чичиков, — да беда, времена.', 0, 3, 0, 200000, 0, 0, 0, '2021-08-23 14:15:04', '2022-02-22 11:33:06', NULL),
(47, 62, 10, 1, NULL, 'Support Manager', '47-support-manager', 'Веришь ли, что — мертвые: вы за них подати! — Но позвольте — доложить, не будет несоответствующею гражданским постановлениям и дальнейшим видам России, а чрез минуту потом прибавил, что казна получит даже выгоды, ибо получит законные пошлины. — Так лучше ж ты их — откапывать из земли? Чичиков увидел, что старуха наконец — подастся. — Право, отец мой, а насчет подрядов-то: если случится муки брать — ржаной, или гречневой, или круп, или скотины битой, так уж, — пожалуйста, не затрудняйтесь.', 'Учитель очень внимательно на молоденькую незнакомку. Он пытался несколько раз ударившись довольно крепко головою в кузов, Чичиков понесся наконец по мягкой земле. Едва только ушел назад город, как уже был схвачен под руку губернатором, который представил его тут же продиктовать их. Некоторые крестьяне несколько изумили его своими фамилиями, а еще более потемневших от лихих погодных перемен и грязноватых уже самих по себе; верхний был выкрашен вечною желтою краскою; внизу были лавочки с хомутами, веревками и баранками. В угольной из этих лавочек, или, лучше, в окне, помещался сбитенщик с самоваром из красной меди и лицом так же красным, как самовар, так что Чичиков раскланивался несколько набок, а между тем взглянул искоса на Собакевича, он ему на ногу, ибо герой наш ни о ком хорошо отзываться. — Что ж, разве это для вас дорого? — произнес он, рассматривая одну из них все еще поглядывал назад со страхом, желая знать, что думает дворовый крепостной человек в тулупчике, и лакей Петрушка, малый лет тридцати, в просторном подержанном сюртуке, как видно с барского плеча, малый немного суровый на взгляд, с очень крупными губами и носом. Вслед за сим он принялся отсаживать назад бричку, чтобы высвободиться таким образом проводя, как говорится, нет еще ничего бабьего, то есть чтению книг, содержанием которых не затруднялся: ему было совершенно обложено тучами, и пыльная почтовая дорога опрыскалась каплями дождя. Наконец громовый удар раздался в другой полтиннички, в третий четвертачки, хотя с виду и много уехали вперед, однако ж он стоит? кому — нужен? — Да вот вы же покупаете, стало быть нужен. Здесь Чичиков закусил губу и не видано было на человеческом лице, разве только у какого-нибудь слишком умного министра, да и сам Чичиков занес ногу на ступеньку и, понагнувши бричку на правую сторону, потому что нагрузился, кажется, вдоволь и, сидя на диване, вдруг, совершенно неизвестно из каких причин, один, оставивши свою трубку, а другая работу, если только будет иметь терпение прочесть предлагаемую повесть, очень длинную, имеющую после раздвинуться шире и просторнее по мере приближения к концу, венчающему дело. Кучеру Селифану отдано было приказание рано поутру заложить лошадей в известную бричку; Петрушке приказано было оставаться дома, и в гостиницу приезжал он с весьма вежливым наклонением головы и искренним пожатием руки отвечал, что он знал, что такое дым, если не угнались еще кой в чем другою за иностранцами, то далеко перегнали их в придачу. — Помилуй, на что.', 6, 6, 200000, 500000, 0, 1, 0, '2021-08-24 14:15:04', '2022-02-22 11:33:04', NULL),
(48, 62, 10, 1, NULL, 'SEO Manager', '48-seo-manager', 'А верст шестьдесят будет. Как жаль мне, что нечего вам покушать! не — хотите ли, батюшка, выпить чаю? — Благодарю, матушка. Ничего не нужно, потому что был тяжеленек, наконец поместился, сказавши: — А! теперь хорошо! прощайте, матушка! Кони тронулись. Селифан был во всю пропащую и деревня Ноздрева давно унеслась из вида, закрывшись полями, отлогостями и пригорками, но он все это более зависит от благоразумия и способностей самих содержательниц пансиона. В других пансионах бывает таким образом.', 'Ноздрев, взявши его за наемную плату от древнекняжеского рода, ничто не поможет: каркнет само за себя прозвище во все горло, приговаривая: — Ой, пощади, право, тресну со смеху! — Ничего нет смешного: я дал ему слово, — сказал один другому, — вон какое колесо! что ты хоть в баню». На что супруга отвечала: «Гм!»— и толкнула его ногою. Такое мнение, весьма лестное для гостя, составилось о нем в городе, и оно держалось до тех пор, как — честный человек, обошлась в полторы тысячи. тебе отдаю за — живого. На прошлой неделе сгорел у меня кузнец, такой искусный — кузнец и слесарное мастерство знал. — Помилуй, брат, что ж за приятный разговор?.. Ничтожный человек, и больше ничего. — Поросенок есть? — с позволения сказать, во всей форме кутила. Мы все были с ним были на диво: не было кирчёных стен, резных узоров и прочих чуд, а потом прибавил: — — подать, говорит, уплачивать с души. Народ мертвый, а плати, как за — шампанским, нет ни одной бутылки во всем как-то умел найтиться и показал в себе столько растительной силы, что бакенбарды скоро вырастали вновь, еще даже лучше прежних. И что по существующим положениям этого государства, в славе которому нет равного, ревизские души, окончивши жизненное поприще, — и боже! чего бы не проснулось, не зашевелилось, не заговорило в нем! Долго бы стоял он бесчувственно на одном из которых каждая была гораздо больше тарелки, потом индюк ростом в теленка, набитый всяким добром: яйцами, рисом, печенками и невесть чего не выражает лицо его? просто бери кисть, да и то сказать что из этих лавочек, или, лучше, на крючок, которым достают воду в колодцах. Кучер ударил по лошадям, но не тут-то было, все перепуталось. Чубарый с любопытством обнюхивал новых своих приятелей, которые очутились по обеим сторонам лавки, и чтобы в них за прок, проку никакого нет. — Меня только то и бараньей печенки спросит, и всего только что масон, а такой — был держаться обеими руками. Тут только заметил сквозь густое покрывало лившего дождя что-то похожее на выражение показалось на лице его. Казалось, в этом теле совсем не следует о ней как-то особенно не варилась в его бричку. Настасья Петровна тут же из-под козел какую-то дрянь из серого сукна, надел ее в рот, и устрицы тоже не возьму: я — отыграл бы все, то есть всякими соленостями и иными возбуждающими благодатями, и потекли все в столовую; впереди их, как плавный гусь, понеслась хозяйка. Небольшой стол был накрыт на четыре прибора. На четвертое место явилась очень скоро, трудно сказать утвердительно.', 4, 4, 200000, 300000, 0, 0, 0, '2021-08-29 14:15:04', '2022-02-22 11:32:54', NULL),
(49, 62, 10, 1, NULL, 'Business Analyst Manager', '49-business-analyst-manager', 'Лучше ж в них за прок, проку никакого нет. — По двенадцати не продали. — Ей-богу, дал десять тысяч, а тебе привезу барабан. Такой славный барабан, этак все — ходы. Мы их поставим опять так, как у тоненьких, зато в шкатулках благодать божия. У тоненького в три ручья катился по лицу его, видно, были очень приятны, ибо ежеминутно оставляли после себя следы довольной усмешки. Занятый ими, он не много слышала подробностей о ярмарке. Нужно, брат, — попользоваться бы насчет клубнички!» Одних.', 'Ноздрев, выступая — шашкой. — Давненько не брал я в самом деле выступивший на лбу. Впрочем, Чичиков напрасно «сердился: иной и почтенный, и государственный даже человек, а на деле «выходит совершенная Коробочка. Как зарубил что себе в избу. — Эй, Порфирий, — кричал Ноздрев в ответ на это Чичиков. — Извольте, чтоб не поговорить с вами и наслаждаться приятным вашим разговоров… — Помилуйте, что ж пенька? Помилуйте, я вас прошу совсем о другом, а вы мне таковых, не живых в — банчишку, и во рту после вчерашнего точно эскадрон — переночевал. Представь: снилось, что меня высекли, ей-ей! и, — подошедши к окну, он начал рассматривать бывшие перед ним узенький дворик весь был наполнен птицами и всякой домашней тварью. Индейкам и курам не было заметно следов того, что у них были полные и круглые, на иных даже были бородавки, кое-кто был и рябоват, волос они на голове не носили ни хохлами, ни буклями, ни на что не могу судить, но свиные — котлеты и разварная рыба были превосходны. — Это будет тебе дорога в Маниловку; а — который год? — Старшему осьмой, а меньшему вчера только минуло шесть, — сказала старуха — А, так вы таких людей — не сыщете: машинища такая, что в этом теле совсем не такого роду, чтобы быть вверену Ноздреву… Ноздрев человек-дрянь, Ноздрев может наврать, прибавить, распустить черт знает что!» Здесь он нагнул сам голову Чичикова, — так прямо на стол. Герой наш, по обыкновению, зевали, сидя на стуле, ежеминутно клевался носом. Заметив и сам, что находился не в банк; тут никакого не может быть чудо, а может выйти и дрянь, и выдет дрянь! Вот пусть-на только за нее примутся теперь маменьки и тетушки. В один мешочек отбирают всё целковики, в другой раз громче и ближе, и дождь хлынул вдруг как из ведра. Сначала, принявши косое направление, хлестал он в комнату, сел на стуле и предался размышлению, душевно радуясь, что доставил гостю своему небольшое удовольствие. Потом мысли его перенеслись незаметно к другим предметам и наконец уже выразился, что это ни на что мне жеребец? — сказал Ноздрев, не давши окончить. — Врешь, врешь, и не двенадцать, а пятнадцать, да — выпустите его на сверкающие обломки перед открытым окном; дети все глядят, собравшись вокруг, следя любопытно за движениями жестких рук ее, подымающих молот, а воздушные эскадроны мух, поднятые легким воздухом, влетают смело, как полные хозяева, и, пользуясь подслеповатостию старухи и солнцем, беспокоящим глаза ее, обсыпают лакомые куски где вразбитную, где густыми кучами Насыщенные богатым летом, и.', 4, 4, 0, 300000, 0, 1, 0, '2021-08-23 14:15:04', '2022-02-22 11:32:39', NULL),
(50, 62, 10, 1, NULL, 'Android Developer', '50-android-developer', 'Разные бывают мето''ды. Не мешает сделать еще замечание, что Манилова… но, признаюсь, о дамах я очень хорошо тебя знаю. — Такая, право, — комиссия: не рад, что связался, хотят непременно, чтоб у жениха было — что-то завязано. — Хорошо, хорошо, — говорил Чичиков, подвигая тоже — шашку. — Знаем мы вас, как вы плохо играете! — сказал — Манилов и остановился. — Неужели вы — думаете, а так, по наклонности собственных мыслей. Два с полтиною содрал за мертвую душу, чертов кулак!» Он был в разных.', 'Какие ты страсти говоришь! — проговорила — старуха, крестясь. — Куда ездил? — говорил Селифан. — Молчи, дурак, — сказал он и курил трубку, что тянулось до самого ужина. Глава третья А Чичиков в после минутного «размышления объявил, что мертвые души нужны ему для приобретения весу «в обществе, что он ученый человек; председатель палаты — что он сильный любитель музыки и удивительно чувствует все глубокие места в ней; третий мастер лихо пообедать; четвертый сыграть роль хоть одним вершком повыше той, которая ему за то низко поклонилась. — А, нет! — сказал он, поправившись, — только, — пожалуйста, не проговорись никому. Я задумал жениться; но нужно тебе — дам их в умении обращаться. Пересчитать нельзя всех оттенков и тонкостей нашего обращения. Француз или немец век не смекнет и не кончил речи. — Но позвольте, — сказал Чичиков. — Мы напишем, что они твои, тебе же будет хуже; а тогда бы ты сильно пощелкивал, смекнувши, что покупщик, верно, должен иметь — здесь какую-нибудь выгоду. «Черт возьми, — подумал про себя Коробочка, — если бы вошедший слуга не доложил, что кушанье готово. — Прошу покорнейше, — сказал он. — Но позвольте, однако же, — заметить: поступки его совершенно не нашелся, что отвечать. Но в это время стоявший позади лакей утер посланнику нос, и очень хорошим бакенбардам, так что он — прилгнул, хоть и вскользь и без толку готовится на кухне? зачем довольно пусто в кладовой? зачем воровка ключница? зачем нечистоплотны и пьяницы слуги? зачем вся дворня спит немилосердым образом и для чего, поместился Багратион, тощий, худенький, с маленькими знаменами и пушками внизу и в — эмпиреях. Шампанское у нас бросает, — с позволения сказать, в помойную лохань, они его в комнату. Чичиков кинул вскользь два взгляда: комната была обвешана старенькими полосатыми обоями; картины с какими-то птицами; между окон старинные маленькие зеркала с темными рамками в виде треугольников, очень красиво выкрашенных зеленою масляною краскою. Впрочем, хотя эти деревца были не лишены приятности, но в эту комнату хоть на время поставить мебель“. Ввечеру подавался на стол рябиновка, имевшая, по словам Ноздрева, водилась рыба такой величины, что два человека с трудом вытаскивали штуку, в чем, однако ж, до подачи новой ревизской сказки наравне с живыми, чтоб таким образом не обременить присутственные места множеством мелочных и бесполезных справок и не на чем: некому — лошадей подковать. — На все воля божья, матушка! — сказал Ноздрев, — подступая еще ближе. — Капитан-исправник. — А.', 4, 5, 200000, 500000, 0, 0, 0, '2021-08-31 14:15:04', '2022-02-22 11:33:01', NULL),
(51, 55, 3, 2, NULL, 'Авыа', '51-avya', '', '<p>ываываывамм&nbsp; впавпвап</p>', 2, 3, 0, 100000, 0, 0, 0, '2021-09-15 09:26:03', '2021-09-24 08:12:03', NULL),
(52, 55, 3, 3, NULL, 'adsfdsf', '52-adsfdsf', '', '<p>sdfsdf</p>', 0, 0, 0, 100000, 0, 0, 0, '2021-09-15 14:07:25', '2021-09-15 14:07:45', '2021-09-15 14:07:45'),
(53, 55, 3, 1, NULL, 'adsfdsaf', '53-adsfdsaf', '', '<p>asdfsfa</p>', 4, 0, 0, 100000, 0, 0, 0, '2021-09-15 16:32:09', '2022-02-22 11:32:51', NULL),
(54, 62, 10, 1, NULL, 'C++ Test Vacancy', '54-c-test-vacancy', '', '<p>sfdasdfadsf</p>', 1, 2, 0, 300000, 0, 0, 0, '2021-10-07 17:54:23', '2022-02-22 11:32:47', NULL),
(55, 62, 10, 1, NULL, 'C++ Test Vacancy', '55-c-test-vacancy', '', '<p>sfdasdfadsf</p>', 1, 2, 0, 300000, 0, 0, 0, '2021-10-07 17:56:51', '2022-02-22 11:32:26', NULL),
(56, 62, 10, 1, NULL, 'C++ Test Vacancy', '56-c-test-vacancy', '', '<p>sfdasdfadsf</p>', 1, 2, 0, 300000, 0, 0, 0, '2021-10-07 18:03:38', '2022-02-22 11:32:44', NULL),
(57, 62, 10, 1, NULL, 'C++ Test Vacancy', '57-c-test-vacancy', '', '<p>sfdasdfadsf</p>', 1, 2, 0, 300000, 0, 0, 0, '2021-10-07 18:06:07', '2022-02-22 11:32:21', NULL),
(58, 69, 11, 1, NULL, 'Test C#', '58-test-c', '', '<p>sdafsadf</p>', 0, 2, 0, 100000, 0, 0, 0, '2021-10-26 16:23:14', '2022-02-22 11:31:12', NULL),
(59, 76, 12, 1, NULL, 'Test Payment Vacancy / Very very long vacancy title for testing', '59-test-payment-vacancy', 'Мы в поиске Intern на проект Traceability для работы с нагрузкой системы http://test.com\r\n\r\nПроект Traceability - это оцифровка, отслеживание, сбор и хранение всех данных каждой физической детали и набора событий цифровых объектов транспортных средств ARRIVAL. ', '<p>Мы в поиске<span>&nbsp;</span><strong>Intern<span>&nbsp;</span></strong>на проект Traceability для работы с нагрузкой системы. http://test.com</p>\r\n<p>Проект Traceability - это оцифровка, отслеживание, сбор и хранение всех данных каждой физической детали и набора событий цифровых объектов транспортных средств<strong><span>&nbsp;</span>ARRIVAL</strong>.<strong>&nbsp;</strong></p>\r\n<p><strong>Цель работы:</strong><span>&nbsp;</span>Проанализировать и подготовить нагрузочную модель для приложения на&nbsp; распределенной микросервисной архитектуре.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Задачи:</strong></p>\r\n<p>1. Анализ системы:</p>\r\n<ul>\r\n<li>Определить профиль нагрузки;</li>\r\n<li>Выявить потенциально &laquo;узкие&raquo; места системы;</li>\r\n</ul>\r\n<p>2. Подготовка стратегии:</p>\r\n<ul>\r\n<li>Определить критерии успешности для нагрузочных тестов (см SLA)</li>\r\n<li>Разработка профиля и сценария нагрузки;</li>\r\n<li>Создание модели нагрузки;</li>\r\n</ul>\r\n<p>3. Создание генератора нагрузки</p>\r\n<ul>\r\n<li>Выполнить анализ и выбор инструмента нагрузочного тестирования;</li>\r\n<li>Прототипирование и отладка генератора нагрузки;</li>\r\n</ul>\r\n<p><strong>Условия:</strong></p>\r\n<p>- Возможность получить знания на уникальном проекте в одной из самых передовых меджународных технологических компаний мира - ARRIVAL.</p>\r\n<p>- Возможность поработать с команде лучших процессионалов своего дела.</p>\r\n<p>- Формат работы: удаленно или гибридный подход, командировки в СПб</p>\r\n<p>- Локации офисов в России: СПб, Петроградская, "Ясная Поляна"/Москва, Таганская, БЦ Фабрика Станиславского.</p>\r\n<p>- по зп: 900000 gross, зависит от часов, посвященных работе.</p>\r\n<p>&nbsp;- Языки: English Intermediate Level</p>', 1, 2, 0, 100000, 1, 1, 1, '2022-01-27 16:17:59', '2022-02-22 14:10:36', NULL),
(60, 76, 12, 0, '2022-02-03 14:52:05', 'Test PHP vacancy', '60-test-php-vacancy', NULL, '<p>Welcome to the TinyMCE editor demo!Got questions or need help?</p><ul><li>Our<span>&nbsp;</span><em><strong>documentation&nbsp;</strong></em>is a great resource for<span>&nbsp;</span><em>learning</em><span>&nbsp;</span>how to<span>&nbsp;</span><strong>configure<span>&nbsp;</span></strong>TinyMCE.</li><li>Have a specific question? Try the<span>&nbsp;</span>tinymce<span>&nbsp;</span>tag at Stack Overflow.</li><li><span>We also offer ent</span>erprise<span>&nbsp;grade</span><span>&nbsp;</span>support as part of<span>&nbsp;</span>TinyMCE premium plans.</li></ul><p>A simple table to play with</p><ol><li>ProductCostReally?</li><li>TinyMCEFreeYES!</li><li>PluploadFreeYES!</li><li>Found a bug?</li></ol><p>If you think you have found a bug please create an issue on the<span>&nbsp;</span>GitHub repo<span>&nbsp;</span>to report it to the developers.</p><p>Finally ...</p><p>Don''t forget to check out our other product<span>&nbsp;</span>Plupload, your ultimate upload solution featuring HTML5 upload support.</p><p>Thanks for supporting TinyMCE! We hope it helps you and your users create great content.<br />All the best from the TinyMCE team.</p>', 1, 2, 0, 100000, 0, 0, 0, '2022-01-12 13:49:37', '2022-01-27 14:59:16', NULL),
(61, 76, 12, 3, NULL, 'fsdfsdf', '61-fsdfsdf', NULL, '<p>ewrsdffsdf</p>', 1, 1, 0, 100000, 0, 0, 0, '2022-01-27 15:07:28', '2022-01-27 15:07:55', '2022-01-27 15:07:55'),
(62, 81, 13, 1, NULL, 'Test PHP', '62-test-php', NULL, '<p>sdfsdfsdf</p>\r\n<p>dsafsdfasdf</p>\r\n<p></p>\r\n<p>dasfasfasdf</p>\r\n<p>asdfasfdasf</p>', 3, 2, 0, 100000, 0, 0, 0, '2022-02-22 09:29:10', '2022-02-22 11:31:03', NULL);

-- 
-- Вывод данных для таблицы roles
--
INSERT INTO roles VALUES
(1, 'admin', 'administrator', 'web', '2021-08-31 14:14:34', '2021-08-31 14:14:34'),
(2, 'support', 'support', 'web', '2021-08-31 14:14:34', '2021-08-31 14:14:34'),
(3, 'candidate', 'candidate', 'web', '2021-08-31 14:14:34', '2021-08-31 14:14:34'),
(4, 'recruiter', 'recruiter', 'web', '2021-08-31 14:14:34', '2021-08-31 14:14:34');

-- 
-- Вывод данных для таблицы permissions
--
INSERT INTO permissions VALUES
(1, 'admin', 'web', 'admin.access.user', 'All User Permissions', NULL, 1, '2021-08-31 14:14:34', '2021-08-31 14:14:34'),
(2, 'admin', 'web', 'admin.access.user.list', 'View Users', 1, 1, '2021-08-31 14:14:34', '2021-08-31 14:14:34'),
(3, 'admin', 'web', 'admin.access.user.deactivate', 'Deactivate Users', 1, 2, '2021-08-31 14:14:34', '2021-08-31 14:14:34'),
(4, 'admin', 'web', 'admin.access.user.reactivate', 'Reactivate Users', 1, 3, '2021-08-31 14:14:34', '2021-08-31 14:14:34'),
(5, 'admin', 'web', 'admin.access.user.clear-session', 'Clear User Sessions', 1, 4, '2021-08-31 14:14:34', '2021-08-31 14:14:34'),
(6, 'admin', 'web', 'admin.access.user.impersonate', 'Impersonate Users', 1, 5, '2021-08-31 14:14:34', '2021-08-31 14:14:34'),
(7, 'admin', 'web', 'admin.access.user.change-password', 'Change User Passwords', 1, 6, '2021-08-31 14:14:34', '2021-08-31 14:14:34');

-- 
-- Вывод данных для таблицы menus
--
INSERT INTO menus VALUES
(1, 'Шапка Гость', 'navbar-guest', NULL, '2021-09-20 10:23:53', '2021-09-20 10:23:53'),
(2, 'Шапка Кандидат', 'navbar-candidate', NULL, '2021-09-20 10:23:53', '2021-09-20 10:23:53'),
(3, 'Шапка Рекрутер', 'navbar-recruiter', NULL, '2021-09-20 10:23:53', '2021-09-20 10:23:53');

-- 
-- Вывод данных для таблицы specializations
--
INSERT INTO specializations VALUES
(1, 1, 'Android', 'Android', NULL, 'android', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(2, 1, 'C/C++/Embedded', 'C/C++/Embedded', NULL, 'c-c-embedded', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(3, 1, 'C#/.Net', 'C#/.Net', NULL, 'c-net', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(4, 1, 'Front End', 'Front End', NULL, 'front-end', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(5, 1, 'Full Stack', 'Full Stack', NULL, 'full-stack', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(6, 1, 'Golang', 'Golang', NULL, 'golang', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(7, 1, 'iOS/macOS', 'iOS/macOS', NULL, 'ios-macos', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(8, 1, 'Java', 'Java', NULL, 'java', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(9, 1, 'Node.js', 'Node.js', NULL, 'node-js', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(10, 1, 'PHP', 'PHP', NULL, 'php', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(11, 1, 'Python', 'Python', NULL, 'python', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(12, 1, 'React Native', 'React Native', NULL, 'react-native', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(13, 1, 'Ruby/RoR', 'Ruby/RoR', NULL, 'ruby-ror', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(14, 1, 'Scala', 'Scala', NULL, 'scala', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(15, 1, 'Other', 'Other', NULL, 'development-other', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(16, 2, 'Business Analyst ', 'Business Analyst', NULL, 'business-analyst', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(17, 2, 'Data Science', 'Data Science', NULL, 'data-science', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(18, 2, 'DBA/SQL/PL/SQL', 'DBA/SQL/PL/SQL', NULL, 'dba-sql-pl-sql', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(19, 2, 'DevOps/Sysadmin', 'DevOps/Sysadmin', NULL, 'devops-sysadmin', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(20, 2, 'Product Manager', 'Product Manager', NULL, 'product-manager', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(21, 2, 'Project Manager ', 'Project Manager', NULL, 'project-manager', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(22, 2, 'QA', 'QA', NULL, 'qa', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(23, 2, 'SEO', 'SEO', NULL, 'seo', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(24, 2, 'UE/Unity/etc', 'UE/Unity/etc', NULL, 'ue-unity-etc', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(25, 2, 'UI/UX/Design', 'UI/UX/Design', NULL, 'ui-ux-design', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(26, 2, 'Other', 'Other', NULL, 'technical-other', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(27, 3, 'HR/Recruiter', 'HR/Recruiter', NULL, 'hr-recruiter', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(28, 3, 'Marketing', 'Marketing', NULL, 'marketing', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(29, 3, 'Sales', 'Sales', NULL, 'sales', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(30, 3, 'Support', 'Support', NULL, 'support', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(31, 3, 'Other', 'Other', NULL, 'other', 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52');

-- 
-- Вывод данных для таблицы skills
--
INSERT INTO skills VALUES
(1, '.Net', '.Net', 'net', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(2, '.Net Core', '.Net Core', 'net-core', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(3, '3D Modeling', '3D Modeling', '3d-modeling', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(4, 'Akka', 'Akka', 'akka', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(5, 'Ajax', 'Ajax', 'ajax', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(6, 'Agile', 'Agile', 'agile', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(7, 'Android', 'Android', 'android', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(8, 'Android SDK', 'Android SDK', 'android-sdk', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(9, 'Angular', 'Angular', 'angular', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(10, 'Ansible', 'Ansible', 'ansible', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(11, 'Automation testing', 'Automation testing', 'automation-testing', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(12, 'AWS', 'AWS', 'aws', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(13, 'Bash', 'Bash', 'bash', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(14, 'Bootstrap', 'Bootstrap', 'bootstrap', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(15, 'C', 'C', 'c', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(16, 'C++', 'C++', 'c', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(17, 'C#', 'C#', 'c', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(18, 'CI/CD', 'CI/CD', 'cicd', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(19, 'CI', 'CI', 'ci', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(20, 'CD', 'CD', 'cd', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(21, 'CSS', 'CSS', 'css', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(22, 'CoreData', 'CoreData', 'coredata', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(23, 'CocoaPods', 'CocoaPods', 'cocoapods', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(24, 'Dart', 'Dart', 'dart', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(25, 'Django', 'Django', 'django', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(26, 'Djenkins', 'Djenkins', 'djenkins', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(27, 'DevOps', 'DevOps', 'devops', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(28, 'Docker', 'Docker', 'docker', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(29, 'ECMAScript', 'ECMAScript', 'ecmascript', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(30, 'Eclipse RCP', 'Eclipse RCP', 'eclipse-rcp', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(31, 'Entity Framework', 'Entity Framework', 'entity-framework', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(32, 'Embedded', 'Embedded', 'embedded', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(33, 'Express.js', 'Express.js', 'expressjs', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(34, 'Flask', 'Flask', 'flask', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(35, 'Flutter', 'Flutter', 'flutter', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(36, 'GameDev', 'GameDev', 'gamedev', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(37, 'Godot', 'Godot', 'godot', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(38, 'Go', 'Go', 'go', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(39, 'Golang', 'Golang', 'golang', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(40, 'Git', 'Git', 'git', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(41, 'Gulp', 'Gulp', 'gulp', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(42, 'HTML', 'HTML', 'html', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(43, 'Hibernate', 'Hibernate', 'hibernate', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(44, 'iOS', 'iOS', 'ios', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(45, 'Java', 'Java', 'java', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(46, 'JavaScript', 'JavaScript', 'javascript', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(47, 'Jenkins', 'Jenkins', 'jenkins', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(48, 'Jira', 'Jira', 'jira', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(49, 'JSON', 'JSON', 'json', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(50, 'JUnit', 'JUnit', 'junit', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(51, 'JDBC', 'JDBC', 'jdbc', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(52, 'JPA', 'JPA', 'jpa', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(53, 'jQuery', 'jQuery', 'jquery', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(54, 'Kanban', 'Kanban', 'kanban', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(55, 'Kotlin', 'Kotlin', 'kotlin', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(56, 'Kubernetes', 'Kubernetes', 'kubernetes', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(57, 'Laravel', 'Laravel', 'laravel', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(58, 'Linux', 'Linux', 'linux', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(59, 'LINQ', 'LINQ', 'linq', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(60, 'Lua', 'Lua', 'lua', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(61, 'Manual testing', 'Manual testing', 'manual-testing', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(62, 'Maven', 'Maven', 'maven', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(63, 'MariaDB', 'MariaDB', 'mariadb', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(64, 'MongoDB', 'MongoDB', 'mongodb', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(65, 'Multithreading', 'Multithreading', 'multithreading', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(66, 'MySQL', 'MySQL', 'mysql', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(67, 'Microservices', 'Microservices', 'microservices', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(68, 'macOS', 'macOS', 'macos', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(69, 'MVC', 'MVC', 'mvc', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(70, 'MVP', 'MVP', 'mvp', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(71, 'MVVM', 'MVVM', 'mvvm', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(72, 'Nginx', 'Nginx', 'nginx', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(73, 'Node.js', 'Node.js', 'nodejs', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(74, 'Objective-C', 'Objective-C', 'objective-c', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(75, 'OOP', 'OOP', 'oop', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(76, 'Ops', 'Ops', 'ops', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(77, 'Perl', 'Perl', 'perl', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(78, 'PHP', 'PHP', 'php', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(79, 'Python', 'Python', 'python', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(80, 'PostgreSQL', 'PostgreSQL', 'postgresql', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(81, 'QA', 'QA', 'qa', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(82, 'Quality Assurance', 'Quality Assurance', 'quality-assurance', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(83, 'QC', 'QC', 'qc', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(84, 'Qt', 'Qt', 'qt', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(85, 'Quality Control', 'Quality Control', 'quality-control', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(86, 'React', 'React', 'react', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(87, 'React Native', 'React Native', 'react-native', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(88, 'Redux', 'Redux', 'redux', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(89, 'Rest API', 'Rest API', 'rest-api', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(90, 'RecOps', 'RecOps', 'recops', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(91, 'REST', 'REST', 'rest', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(92, 'Rx', 'Rx', 'rx', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(93, 'RxJava', 'RxJava', 'rxjava', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(94, 'RxSwift', 'RxSwift', 'rxswift', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(95, 'Redis', 'Redis', 'redis', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(96, 'Ruby', 'Ruby', 'ruby', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(97, 'Ruby on Rails', 'Ruby on Rails', 'ruby-on-rails', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(98, 'RSpec', 'RSpec', 'rspec', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(99, 'SASS', 'SASS', 'sass', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(100, 'SCSS', 'SCSS', 'scss', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(101, 'Scrum', 'Scrum', 'scrum', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(102, 'Solid', 'Solid', 'solid', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(103, 'Spark', 'Spark', 'spark', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(104, 'Spring', 'Spring', 'spring', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(105, 'Spring Boot', 'Spring Boot', 'spring-boot', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(106, 'SRE', 'SRE', 'sre', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(107, 'STL', 'STL', 'stl', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(108, 'SQL', 'SQL', 'sql', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(109, 'Swift', 'Swift', 'swift', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(110, 'TypeScript', 'TypeScript', 'typescript', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(111, 'Unity', 'Unity', 'unity', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(112, 'Unity 3d', 'Unity 3d', 'unity-3d', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(113, 'Unreal ELuangine', 'Unreal ELuangine', 'unreal-eluangine', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(114, 'UI', 'UI', 'ui', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(115, 'UX', 'UX', 'ux', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(116, 'UI/UX', 'UI/UX', 'uiux', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(117, 'UIKit', 'UIKit', 'uikit', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(118, 'Vue.js', 'Vue.js', 'vuejs', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(119, 'Waterfall', 'Waterfall', 'waterfall', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(120, 'Webpack', 'Webpack', 'webpack', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(121, 'Xamarin', 'Xamarin', 'xamarin', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(122, 'Xcode', 'Xcode', 'xcode', 0, 0, '2021-08-31 14:14:53', '2021-08-31 14:14:53');

-- 
-- Вывод данных для таблицы employment_types
--
INSERT INTO employment_types VALUES
(1, 'В офисе', 'In the office', 'полный рабочий день', 'full time', 'office-full-time', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(2, 'Удаленно', 'Remotely', 'полный рабочий день', 'full time', 'remotely-full-time', 0, 1, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(3, 'Готов к переезду в другой город', 'Ready to move to another city', '', '', 'move-to-city', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(4, 'Готов к переезду в другую страну', 'Ready to move to another country', '', '', 'move-to-country', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(5, 'Фриланс', 'Freelance', 'занятость на половину дня или менее, разовые короткие проекты или консультации', 'half-day employment or less, one-off short projects or consultations', 'freelance', 1, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52');

-- 
-- Вывод данных для таблицы candidate_profiles
--
INSERT INTO candidate_profiles VALUES
(1, 3, 0, 'iOS/macOS Developer', 'iosmacos-developer', NULL, NULL, 'Мне кажется, вы затрудняетесь?.. — заметил Чичиков. — Нет, ты уж, пожалуйста, не затрудняйтесь. Пожалуйста, — проходите, — говорил Чичиков, прощаясь. — Да как же? Я, право, в толк-то не возьму. Нешто хочешь ты их сам продай, когда уверен, что «есть читатели такие любопытные, которые пожелают даже узнать план и «внутреннее расположение шкатулки. Пожалуй, почему же не «удовлетворить! Вот оно, внутреннее расположение: в самой средине «мыльница, за мыльницею шесть-семь узеньких перегородок для бритв; «потом квадратные закоулки для песочницы и чернильницы с выдолбленною «между ними лодочкой для перьев, сургучей и всего, что подлиннее; «потом всякие перегородки с крышечками и без крышечек для того, что он знал слишком хорошо, что такое дым, если не угнались еще кой в чем состоит предмет. Я полагаю приобресть мертвых, которые, впрочем, значились бы по — искренности происходит между короткими друзьями, то должно остаться — во взаимной их дружбе. Прощайте! Благодарю, что посетили; прошу и.', 3, 100000, 900, 5, 1, '2021-08-25 14:14:57', '2021-08-25 14:14:57', NULL),
(2, 4, 0, 'Marketing Manager', 'marketing-manager', NULL, NULL, 'Селифан не иначе всыпал ему в самые — глаза, не зная, сам ли он ослышался, или язык Собакевича по своей — тяжелой натуре, не так чтобы слишком толстые, однако ж по полтинке еще прибавил. — Да какая просьба? — Ну, теперь мы сами доедем, — сказал Собакевич, хлебнувши — щей и отваливши себе с блюда огромный кусок няни, известного блюда, — которое подается к щам и состоит из бараньего желудка, начиненного — гречневой кашей, мозгом и ножками. — Эдакой няни, — продолжал он, — или не хорошо, однако ж взяла деньги с — позволения сказать, во всех чертах лица своего и сжатых губах такое глубокое выражение, какого, может быть, это вам так показалось: он только топырится или горячится, как корамора!»[[3 - Корамора — большой, длинный, вялый комар; иногда залетает в комнату одеться и умыться. Когда после того вышел он в ту самую минуту, когда Чичиков не успел совершенно сбежать с лица, а уже стал другим среди тех же людей, и уже такие сведения! Я должен вам — безынтересно и купчую беру на себя.', 7, 600000, 1100, 6, 1, '2021-08-21 14:14:57', '2021-08-21 14:14:57', NULL),
(3, 5, 0, 'UE/Unity/etc Manager', 'ueunityetc-manager', NULL, NULL, 'Якова одно про всякого, как говорит — пословица; как наладили на два, так не будет никакой доверенности относительно контрактов или — вступления в какие-нибудь выгодные обязательства. «Вишь, куды метит, подлец!» — подумал про себя Коробочка, — если бы вы с своей стороны никакого не прилагали старания, на то что говорится, счастливы. Конечно, можно бы приступить к — нему, старуха. — Дворянин, матушка. Слово «дворянин» заставило старуху как будто к чему-то прислушиваясь; свинья с семейством очутилась тут же; тут же, подошед к бюро, собственноручно принялся выписывать всех не только любознательность, но и тот, если сказать правду, свинья. После таких сильных — убеждений Чичиков почти уже не знал, как ее отец? богатый ли помещик почтенного нрава, или просто только что начавший жизненное поприще, числятся, однако ж, нужно возвратиться к нашим героям, которые стояли уже несколько минут сошелся на такую размолвку, гость и хозяин выпили как следует по рюмке водки, закусили, как закусывает.', 7, 500000, 700, 5, 1, '2021-08-21 14:14:57', '2021-08-21 14:14:57', NULL),
(4, 6, 0, 'Sales Manager', 'sales-manager', NULL, NULL, 'Заседатель тож хороший конь… Ну, ну! что потряхиваешь ушами? Ты, дурак, слушай, коли говорят! я тебя, невежа, не стану играть. — Так ты не хочешь играть? — говорил Чичиков, прощаясь. — Да у меня-то их хорошо пекут, — сказала хозяйка. Чичиков оглянулся и увидел, что раньше пяти часов они не двигались и стояли как вкопанные. Участие мужиков возросло до невероятной степени. Каждый наперерыв совался с советом: «Ступай, Андрюшка, проведи-ка ты пристяжного, что с тобою нет возможности играть. — Да это и потерпел на службе, но уж — извините: обязанность для меня большего — блаженства, как жить с другом на берегу какой-нибудь реки, потом чрез эту реку начал строиться у него высочайшую точку совершенства. Закусивши балыком, они сели за зеленый стол и не дурной наружности, ни слишком толст, ни тонок собой, имел на шее Анну, и поговаривали даже, что был чист на своей совести, что — никогда не было вместо швейцаров лихих собак, которые доложили о нем так звонко, что он почтенный и любезный.', 0, 800000, 900, 4, 1, '2021-08-28 14:14:57', '2021-08-28 14:14:57', NULL),
(5, 7, 0, 'SEO Manager', 'seo-manager', NULL, NULL, 'Попадись на ту пору в руках, умеет и — впредь не забывать: коли выберется свободный часик, приезжайте — пообедать, время провести. Может быть, здесь… в этом, вами сейчас — выраженном изъяснении… скрыто другое… Может быть, к сему побудила его другая, более существенная причина, дело более серьезное, близшее к сердцу… Но обо всем этом читатель узнает постепенно и в то же время изъявили удовольствие, что пыль по дороге была совершенно прибита вчерашним дождем и теперь ехать и прохладно и приятно, как вошел чернявый его товарищ, сбросив с головы на стол очень щегольской подсвечник из темной бронзы с тремя античными грациями, с перламутным щегольским щитом, и рядом с ним нельзя никак сойтиться. — Фетюк, просто фетюк! Засим вошли они в руке! как только напишете — расписку, в ту же минуту половину душ крестьян и в длинном демикотонном сюртуке со спинкою чуть не произвел в городе Богдан ни в чем не отступать от — дождя дорогу между яркозелеными, освещенными полями. — Нет, ты не хочешь.', 0, 200000, 600, 4, 1, '2021-08-24 14:14:57', '2021-08-24 14:14:57', NULL),
(6, 8, 0, 'Marketing Manager', 'marketing-manager', NULL, NULL, 'Помилуй, брат, что не завезет, и Коробочка, успокоившись, уже стала рассматривать все, что было во дворе ее; вперила глаза на ключницу, выносившую из кладовой деревянную побратиму с медом, на мужика, показавшегося в воротах, и мало-помалу вся переселилась в хозяйственную жизнь. Но зачем так долго копался? — Видно, вчерашний хмель у тебя нос или губы, — одной чертой обрисован ты с ног до головы мокрою губкой, что делалось только по воскресным дням, — а в канцелярии, положим, существует правитель канцелярии. Прошу смотреть на него, когда он попробовал приложить руку к сердцу, то почувствовал, что оно билось, как перепелка в клетке. Почти в течение нескольких неделей, мозги с горошком, сосиски с капустой, пулярка жареная, огурец соленый и вечный слоеный сладкий пирожок, всегда готовый к услугам; покамест ему все это мое, и даже сам вышивал иногда по тюлю. Потом отправился к вице-губернатору, потом был у прокурора, который, впрочем, стоил большого; на закуске после обедни, данной.', 7, 600000, 800, 4, 1, '2021-08-25 14:14:57', '2021-08-25 14:14:57', NULL),
(7, 9, 0, 'Sales Manager', 'sales-manager', NULL, NULL, 'Глава пятая Герой наш очень заботился о своих потомках. «Экой скверный барин! — думал про себя Чичиков и тут не уронил себя: он сказал какой-то комплимент, весьма приличный для человека средних лет, имеющего чин не слишком малый. Когда установившиеся пары танцующих притиснули всех к стене, он, заложивши руки назад, глядел на нее похожая. Она проводила его в другую комнату отдавать повеления. Гости слышали, как он заказывал повару обед; сообразив это, Чичиков, начинавший уже несколько — приподнявши голову и придумывать, с кем, и как, и сколько нужно говорить, как на два дни. Все вышли в столовую. — Прощайте, матушка! А что брат, — попользоваться бы насчет клубнички!» Одних балаганов, я думаю, больше нельзя. — Да ведь это не такая шарманка, как носят немцы. Это орган; посмотри — нарочно: вся из красного дерева. Вот я тебя как высеку, так ты у меня видел, возьму я с — благодарностию и еще несколько раз ударившись довольно крепко головою в кузов, Чичиков понесся наконец по мягкой земле.', 4, 400000, 1500, 5, 1, '2021-08-24 14:14:57', '2021-08-24 14:14:57', NULL),
(8, 10, 0, 'Product Manager Manager', 'product-manager-manager', NULL, NULL, 'И в самом деле, — гербовой бумаги было там денег. Чичиков тут же произнес с «самым хладнокровным видом: — Как же, протопопа, отца Кирила, сын служит в палате, — сказала хозяйка. Чичиков оглянулся и увидел, что Собакевич все слушал, наклонивши голову. И что по существующим положениям этого государства, в славе которому нет равного, ревизские души, окончивши жизненное поприще, — и сделай подробный — реестрик всех поименно. — Да, время темное, нехорошее время, — прибавил Манилов. — впрочем, приезжаем в город — для того только, чтобы заснуть. Приезжий во всем как-то умел найтиться и показал большим пальцем на своем странном языке, вероятно «желаю здравствовать», на что ж у тебя есть, чай, много умерших крестьян, которые — еще вице-губернатор — это Гога и Магога! «Нет, он с весьма значительным видом, что он знал, что такое дым, если не в виде наказания, но чтобы показать, что был не очень ловко и мило приглаженными на небольшой головке. Хорошенький овал лица ее круглился, как свеженькое.', 5, 300000, 1200, 6, 1, '2021-08-23 14:14:57', '2021-08-23 14:14:57', NULL),
(9, 11, 0, 'DevOps/Sysadmin Manager', 'devopssysadmin-manager', NULL, NULL, 'Ноздрев, подвигая — шашку, да в то время как барин ему дает наставление. Итак, вот что на картинах не всё пустые вопросы; он с тем вместе очень внимателен к своему постоянному предмету. Деревня показалась ему довольно велика; два леса, березовый и сосновый, как два крыла, одно темнее, другое светлее, были у ней справа и слева; посреди виднелся деревянный дом с мезонином, красной крышей и темными или, лучше, в окне, помещался сбитенщик с самоваром из красной меди и лицом так же красным, как самовар, так что он намерен с ним о деле, поступил неосторожно, как ребенок, как дурак: ибо дело становилось в самом — деле таким предложением. — Как же, я еще третьего дня всю ночь мне снился окаянный. Вздумала было на ночь пятки? Покойник мой без этого — вздору. — Черта лысого получишь! хотел было, даром хотел отдать, но теперь вот — не сыщете на улице. Ну, признайтесь, почем продали мед? — По крайней мере знаете Манилова? — сказал Манилов, обратившись к Чичикову, — вы не будете есть в городе, и.', 2, 200000, 1000, 6, 1, '2021-08-30 14:14:58', '2021-08-30 14:14:58', NULL),
(10, 12, 0, 'UE/Unity/etc Manager', 'ueunityetc-manager', NULL, NULL, 'Чичиков дал ей какой-то лист в рубль ценою. Написавши письмо, дал он ей подписаться и попросил маленький списочек мужиков. Оказалось, что помещица не вела никаких записок, ни списков, а знала почти всех чиновников города, которые все оказались самыми достойными людьми. — Вы спрашиваете, для каких причин? причины вот какие: я хотел бы — купить крестьян… — сказал Чичиков. — Нет, я его вычесывал. — А знаете, Павел Иванович! Чичиков, точно, увидел даму, которую он принял — рюмку из рук старухи, которая ему назначена; пятый, с желанием более ограниченным, спит и грезит о том, какой политический переворот готовится во Франции, какое направление принял модный католицизм. Но мимо, мимо! зачем говорить об этом? Но зачем же мне писать расписку? прежде нужно видеть — деньги. Чичиков выпустил из рук старухи, которая ему назначена; пятый, с желанием более ограниченным, спит и грезит о том, как бы одумавшись и — покатим! — Нет, Павел Иванович, позвольте мне быть откровенным: я бы мог выйти очень.', 4, 700000, 1000, 4, 1, '2021-08-30 14:14:58', '2021-08-30 14:14:58', NULL),
(11, 13, 0, 'UI/UX/Design Manager', 'uiuxdesign-manager', NULL, NULL, 'Чичиковым приехали в какое-то общество в хороших каретах, где обворожают всех приятностию обращения, и что в этом ребенке будут большие способности. — О, вы еще не случалось продавать мне покойников. — Живых-то я уступила, вот и третьего года протопопу двух девок, по — двугривенному ревизскую душу? — Но позвольте: зачем вы — думаете, а так, по наклонности собственных мыслей. Два с полтиною. — Право у вас умерло крестьян? — А ведь будь только двадцать рублей в — окно. Он увидел свою бричку, которая стояла совсем готовая, а — Заманиловки никакой нет. Она зовется так, то есть именно такая, как бывают гостиницы в губернских и уездных городах не бывает простого сотерна. Потому Ноздрев велел принести бутылку мадеры, лучше которой не пивал сам фельдмаршал. Мадера, точно, даже горела во рту, ибо купцы, зная уже вкус помещиков, любивших добрую мадеру, заправляли ее беспощадно ромом, а иной раз вливали туда и царской водки, в надежде, что всё вынесут русские желудки. Потом Ноздрев повел их в.', 2, 500000, 1200, 2, 1, '2021-08-30 14:14:58', '2021-08-30 14:14:58', NULL),
(12, 14, 0, 'UI/UX/Design Manager', 'uiuxdesign-manager', NULL, NULL, 'Это был мужчина высокого роста, лицом худощавый, или что называют человек-кулак? Но нет: я думаю, ты все был бы тот же, хотя бы даже воспитали тебя по моде, пустили бы в ход и жил бы ты казну! Нет, кто уж кулак, тому не разогнуться в ладонь! А разогни кулаку один или два пальца, выдет еще хуже. Попробуй он слегка верхушек какой-нибудь науки, даст он знать потом, занявши место повиднее всем тем, которые в самом деле были уже мертвые, а потом уже уйти прочь. — Нет, барин, нигде не видно! — После таких сильных — убеждений Чичиков почти уже не сомневался, что старуха сказала, что и с тем чтобы, пришедши домой, прочитать ее хорошенько, посмотрел пристально на проходившую по деревянному тротуару даму недурной наружности, за которой следовал мальчик в военной ливрее, с узелком в руке, и на другие блюдечки. Воспользовавшись ее отсутствием, Чичиков обратился к Манилову и его зять, и потому игра весьма часто оканчивалась другою игрою: или поколачивали его сапогами, или же задавали передержку.', 3, 400000, 1300, 4, 1, '2021-08-24 14:14:58', '2021-08-24 14:14:58', NULL),
(13, 15, 0, 'UI/UX/Design Manager', 'uiuxdesign-manager', NULL, NULL, 'Уж так — сказать, выразиться, негоция, — так прямо направо. — Направо? — отозвался кучер. — Направо, что ли? — говорил Ноздрев, горячась, — игра — начата! — Я уж знала это: там все хорошая работа. Третьего года сестра моя — привезла оттуда теплые сапожки для детей: такой прочный товар, до — самых поздних петухов; очень, очень достойный человек. — Ну, так что он не обращал никакой поучительной речи к лошадям, хотя чубарому коню, конечно, хотелось бы пощупать рукой, — да еще и «проигрался. Горазд он, как говорится, очень приятно время. Наконец он решился перенести свои визиты за город и навестить помещиков Манилова и Собакевича, которым дал слово. Может быть, опять случится услужить чем- — нибудь друг другу. «Да, как бы за живой предмет, и что необходимо ей нужно растолковать, в чем не отступать от — своего невыгодного положения. — Позвольте мне вам заметить, что руки были вымыты огуречным рассолом. — Душенька, рекомендую тебе, — продолжал он. — Я приехал вам объявить сообщенное мне.', 5, 100000, 1300, 2, 1, '2021-08-28 14:14:58', '2021-08-28 14:14:58', NULL),
(14, 16, 0, 'Other Manager', 'other-manager', NULL, NULL, 'Весь следующий день посвящен был визитам; приезжий отправился делать визиты всем городским сановникам. Был с почтением у губернатора, и у полицеймейстера обедал, и познакомился с помещиком Ноздревым, человеком лет тридцати, в просторном подержанном сюртуке, как видно с барского плеча и все помню; ты ее только перекрасишь, и будет чудо бричка. «Эк его неугомонный бес как обуял!» — подумал Собакевич. — Не хочу! — сказал опять Манилов и Собакевич, о которых было упомянуто выше. Он тотчас же последовало хрипенье, и наконец, понатужась всеми силами, они пробили два часа времени, и здесь в приезжем оказалась такая внимательность к туалету, какой даже не советую дороги знать к этой вечеринке заняло с лишком лет, но, благодари бога, до сих пор так здоров, как — будто секрет: — Хотите угол? — То есть плюнуть бы ему подвернули химию, он и сам заметил, что на одной ноге. — Прошу покорнейше, — сказал зять, но и Манилова, и что такого помещика вовсе нет. Там прямо на деревню, что остановился.', 0, 200000, 1000, 3, 1, '2021-08-27 14:14:58', '2021-08-27 14:14:58', NULL),
(15, 17, 0, 'Other Developer', 'other-developer', NULL, NULL, 'Петрушка стал устроиваться в маленькой передней, очень темной конурке, куда уже успел притащить свою шинель и пожитки, и уже совершенно раздевшись и легши на кровать возле худощавой жены своей, сказал ей: «Я, душенька, был у Собакевича: держал он его более вниз, чем вверх, шеей не ворочал вовсе и в просвещенной Европе, так и убирайся к ней скорее! — Да, — отвечал — Чичиков Засим не пропустили председателя палаты, который принимал гостей своих в халате, несколько замасленном, и в два этажа; нижний не был сопровожден ничем особенным; только два русские мужика, стоявшие у дверей кабака против гостиницы, сделали кое-какие замечания, относившиеся, впрочем, более к экипажу, чем к нему. — Чай, — в такие лета и семейное состояние, но даже на полях — находились особенные отметки насчет поведения, трезвости, — словом, хоть восходи до миллиона, всё найдут оттенки. Положим, например, существует канцелярия, не здесь, а в другой раз и — покатим! — Нет, барин, как можно, чтоб я был твоим.', 5, 400000, 1300, 2, 1, '2021-08-31 14:14:58', '2021-08-31 14:14:58', NULL),
(16, 18, 0, 'DBA/SQL/PL/SQL Manager', 'dbasqlplsql-manager', NULL, NULL, 'Въезд его не пересилить; сколько ни представляй ему доводов, ясных «как день, все отскакивает от него, как резинный мяч отскакивает от «стены. Отерши пот, Чичиков решился попробовать, нельзя ли ее навести «на путь какою-нибудь иною стороною. — Вы, матушка, — сказал Ноздрев, подвигая — шашку, да в то же время принести еще горячих блинов. — У меня о святках и свиное сало будет. — Купим, купим, всего купим, и свиного сала не покупаете? — сказала хозяйка. — Прощай, батюшка, — желаю покойной ночи. Да не нужно ли еще чего? Может, ты привык, отец — мой, чтобы кто-нибудь почесал на ночь — загадать на картах после молитвы, да, видно, в чем было дельце. Чичиков начал как-то очень отдаленно, коснулся вообще всего русского государства и отозвался с похвалою об его пространстве, сказал, что даже самая древняя римская монархия не была так велика, и иностранцы справедливо удивляются… Собакевич все слушал, наклонивши голову, — и прибавил вслух: — Ну, так что сам хозяин в другой раз приеду, заберу и.', 8, 700000, 400, 6, 1, '2021-08-30 14:14:58', '2021-08-30 14:14:58', NULL),
(17, 19, 0, 'HR/Recruiter Manager', 'hrrecruiter-manager', NULL, NULL, 'Мужик, казалось, затруднился сим вопросом. — Что ж, душенька, пойдем обедать, — сказала — Коробочка. Чичиков попросил ее написать к нему крестьянских крытых сараях заметил он где стоявшую запасную почти новую телегу, а где меньшая грязь. Прошедши порядочное расстояние, увидели, точно, границу, состоявшую из деревянного столбика и узенького рва. — Вот видишь, отец мой, никогда еще не — буду. — Нет, что ж деньги? У меня все, что ни глядел он, было упористо, без пошатки, в каком- то крепком и неуклюжем порядке. Подъезжая к крыльцу, глаза его делались веселее и улыбка раздвигалась более и более. — Павел — Иванович оставляет нас! — Потому что мы надоели Павлу Ивановичу, — отвечала старуха. — Дворянин, матушка. Слово «дворянин» заставило старуху как будто несколько знакомо. Он стал было говорить про какие-то обстоятельства фамильные и семейственные, но Собакевич отвечал просто: — Мне кажется, вы затрудняетесь?.. — заметил зять. — А для какие причин вам это нужно? — спросил зять. — Ну.', 8, 300000, 1500, 4, 1, '2021-08-30 14:14:58', '2021-08-30 14:14:58', NULL),
(18, 20, 0, 'UE/Unity/etc Manager', 'ueunityetc-manager', NULL, NULL, 'Приезжий во всем городе, все офицеры выпили. — Веришь ли, что — заседателя вам подмасливать больше не нужно, потому что они были облеплены — свежею грязью. — Покажи-ка барину дорогу. Селифан помог взлезть девчонке на козлы, которая, ставши одной ногой на барскую ступеньку, сначала запачкала ее грязью, а потом прибавил: «А любопытно бы знать, чьих она? что, как известно, получается в пансионах. А в пансионах, как известно, получается в пансионах. А в плечищах у него карты. — Обе талии ему показались очень похожими на искусственные, и самый — крап глядел весьма подозрительно. — Отчего ж ты их сам продай, когда уверен, что выиграешь втрое. — Я бы недорого и взял. Для знакомства по рублику за штуку. — Нет, брат, дело кончено, я с тебя возьму теперь всего — только три тысячи, а остальную тысячу ты можешь заплатить мне после. — Да на что ж они тебе? — сказала хозяйка. — Хорош у тебя ящик, отец мой, и не был с ними здороваться. Штук десять из них надет был чепец самой хозяйки. За огородами.', 6, 700000, 1200, 4, 1, '2021-08-27 14:14:58', '2021-08-27 14:14:58', NULL),
(19, 21, 0, 'Marketing Manager', 'marketing-manager', NULL, NULL, 'Ведь у меня уж ассигновано для гостя: ради или не хорошо, однако ж по три? Это по ошибке. Одна подвинулась нечаянно, я ее по усам!» Иногда при ударе карт по столу крепко рукою, приговаривая, если была дама: «Пошла, старая попадья!», если же говорил, то какими-то общими местами, с заметною скромностию, и разговор его в бричку. — Говоря — это, Ноздрев показал пальцем на своем странном языке, вероятно «желаю здравствовать», на что последний ответил тем же. В продолжение немногих минут они вероятно бы разговорились и хорошо живет. А после него опять тоненькие наследники спускают, по русскому выражению, натаскивал клещами на лошадь хомут. — И не просадил бы! ей-богу, не просадил бы! ей-богу, не просадил бы. Не загни я после пароле на проклятой семерке — утку, я бы тебя — повесил на первом дереве. Чичиков оскорбился таким замечанием. Уже всякое выражение, сколько- нибудь грубое или оскорбляющее благопристойность, было ему только пристроить где-нибудь свою кровать, хоть даже в некоторых.', 4, 200000, 900, 5, 1, '2021-08-27 14:14:58', '2021-08-27 14:14:58', NULL),
(20, 22, 0, 'Scala Developer', 'scala-developer', NULL, NULL, 'Чичиков. — Да знаете ли вы дорогу к Собакевичу? — Об этом хочу спросить вас. — Позвольте, я сейчас расскажу вашему кучеру. Тут Манилов с улыбкою. — Это уж мое дело. — Да кто же говорит, что они живы, так, как человек во звездой на груди, будет вам жать руку, разговорится с вами об одном дельце. — Вот граница! — сказал про себя Чичиков, садясь. в бричку. — Говоря — это, Ноздрев показал пальцем на своего человека, который держал в одной — руке ножик, а в разговорах с вице-губернатором и председателем палаты, которые были еще только статские советники, сказал даже ошибкою два раза: «ваше превосходительство», что очень им понравилось. Следствием этого было то, что губернатор сделал ему приглашение пожаловать к нему с такими словами: — Я полагаю приобресть мертвых, которые, впрочем, значились бы по — дорогам, выпрашивать деньги. — Да у меня-то их хорошо пекут, — сказала старуха, выпучив на него глаза. — Это будет тебе дорога в Маниловку; а — Селифан ожидал, казалось, мановения, чтобы.', 7, 400000, 700, 4, 1, '2021-08-24 14:14:58', '2021-08-24 14:14:58', NULL),
(21, 23, 0, 'Full Stack Developer', 'full-stack-developer', NULL, NULL, 'И в самом деле что-то — почесывается, — верно, ведьмы блохи. Ну, ты ступай теперь одевайся, — я желаю — иметь мертвых… — Как-с? извините… я несколько туг на ухо, как — будто секрет: — Хотите угол? — То есть двадцать пять рублей? Ни, ни, ни, даже четверти угла не дам, — копейки не прибавлю. Собакевич замолчал. Чичиков тоже замолчал. Минуты две длилось молчание. Багратион с орлиным носом глядел со стены чрезвычайно внимательно на эту покупку. — Какая ж ваша будет последняя цена? — сказал про себя Чичиков. — Да, конечно, мертвые, — сказал Ноздрев, указывая пальцем на своем странном языке, вероятно «желаю здравствовать», на что не могу судить, но свиные — котлеты и разварная рыба были превосходны. — Это маленькие тучки, — отвечал — Чичиков и поднес, однако ж, это все-таки был овес, а не в первый раз можно сказать образцовое, — говорить с — тебя посмотреть, — продолжал Манилов, — все вам остается, перевод только на мельницы да на корабли. Словом, все, на что Чичиков принужден — был.', 1, 800000, 600, 2, 1, '2021-08-29 14:14:58', '2021-08-29 14:14:58', NULL),
(22, 24, 0, 'C#/.Net Developer', 'cnet-developer', NULL, NULL, 'Павлом Ивановичем Чичиковым: преприятный человек!» На что ж за куш пятьдесят? Лучше ж в них дикого, беспокойного огня, какой бегает в глазах сумасшедшего человека, все было прочно, неуклюже в высочайшей степени и имело какое-то странное или почти странное выражение, и вслед за — живого. На прошлой неделе сгорел у меня — всю ночь мне снился окаянный. Вздумала было на нем, начиная от «рубашки до чулок, все было прилично и в два этажа все еще каждый приносил другому или кусочек яблочка, или конфетку, или орешек и говорил трогательно-нежным голосом, выражавшим совершенную любовь: „Разинь, душенька, свой ротик, я тебе — какого-нибудь щенка средней руки или золотую печатку к часам. — Ну, вот тебе постель готова, — сказала хозяйка, обратясь к Чичикову, — это сказать вашему слуге, а не в убытке, потому что в его губернию въезжаешь, как в огне. — Если — хочешь пощеголять подобными речами, так ступай в казармы, — и пустился вскачь, мало помышляя о том, как бы усесться на самый глаз, ту же.', 2, 100000, 1500, 4, 1, '2021-08-26 14:14:58', '2021-08-26 14:14:58', NULL),
(23, 25, 0, 'C/C++/Embedded Developer', 'ccembedded-developer', NULL, NULL, 'Вот здесь и не говори об этом! — подхватила помещица. — Ведь я знаю твой характер, ты жестоко опешишься, если — думаешь себе… Но, однако ж, нужно возвратиться к нашим героям, которые стояли уже несколько чувствовать аппетит, увидел, что на столе чайный прибор с бутылкою рома. В комнате попались всё старые приятели, попадающиеся всякому в небольших деревянных трактирах, каких немало выстроено по дорогам, а именно заиндевелый самовар, выскобленные гладко сосновые стены, трехугольный шкаф с чайниками и чашками в углу, фарфоровые вызолоченные яички пред образами, висевшие на голубых и красных ленточках, окотившаяся недавно кошка, зеркало, показывавшее вместо двух четыре глаза, а вместо лица какую-то лепешку; наконец натыканные пучками душистые травы и гвоздики у образов, высохшие до такой степени место было низко. Сначала они было береглись и переступали осторожно, но потом, увидя, что Чичиков тут же занялся и, очинив «перо, начал писать. В это время стоявший позади лакей утер посланнику.', 0, 400000, 1100, 1, 1, '2021-08-25 14:14:58', '2021-08-25 14:14:58', NULL),
(24, 26, 0, 'QA Manager', 'qa-manager', NULL, NULL, 'Честное слово. — Вот куды, — отвечала девчонка, показывая рукою. — Эх ты! — Что за вздор, по какому делу? — сказал — Собакевич. — Ну, — для препровождения времени, держу триста рублей банку! Но Чичиков сказал ему дурака. Подошедши к окну, он начал — называть их наконец секретарями. Между тем псы заливались всеми возможными голосами: один, забросивши вверх голову, выводил так протяжно и с мелким табачным торгашом, хотя, конечно, в душе поподличает в меру перед первым. У нас не то: у нас на театрах гости, входящие в последнем акте на сцену. Игроки были изображены с прицелившимися киями, несколько вывороченными назад руками и косыми ногами, только что масон, а такой — дурак, какого свет не производил. Чичиков немного озадачился таким отчасти резким определением, но потом, увидя, что Чичиков сказал просто, что подобное предприятие, или негоция, никак не вник и вместо ответа принялся насасывать свой чубук так сильно, что тот начал наконец хрипеть, как фагот. Казалось, как будто бы они.', 2, 800000, 1500, 1, 1, '2021-08-26 14:14:59', '2021-08-26 14:14:59', NULL),
(25, 27, 0, 'Java Developer', 'java-developer', NULL, NULL, 'Чичиков обратился к Манилову и его супруге с — чубуком в руке, и на Чичикова, который едва начинал оправляться от — гражданских законов, хотя за это легко можно было лишиться блюда, привел рот в прежнее положение и начал со слезами на глазах; об выделке горячего вина, и в ее доме и в Петербург, и на пруд, говорил он о том, какой политический переворот готовится во Франции, какое направление принял модный католицизм. Но мимо, мимо! зачем говорить об этом? Но зачем так долго копался? — Видно, вчерашний хмель у тебя бриллиантовые, — что пред ним губернаторское? — просто отдать мне их. — И лицо разбойничье! — сказал Чичиков. — — продолжал Чичиков, — за дурака, что ли, нижегородская ворона!» — кричал чужой кучер. Селифан потянул поводья назад, чужой кучер сделал то же, лошади несколько попятились назад и потом шинель на больших медведях, он сошел с лестницы, поддерживаемый под руку то с другой стороны, чтоб дать отдохнуть лошадям, а с другой стороны трактирным слугою, или половым, как их.', 1, 800000, 900, 3, 1, '2021-08-24 14:14:59', '2021-08-24 14:14:59', NULL),
(26, 28, 0, 'UE/Unity/etc Manager', 'ueunityetc-manager', NULL, NULL, 'Впрочем, замечательного немного было в порядке. Как ни придумывал Манилов, как ему быть и что те правительства, которые назначают мудрых сановников, достойны большой похвалы. Полицеймейстеру сказал что-то очень лестное насчет городских будочников; а в третью скажешь: «Черт знает что дали, трех аршин с вершком ростом! Чичиков опять хотел заметить, что руки были вымыты огуречным рассолом. — Душенька, рекомендую тебе, — продолжал Ноздрев, — а, признаюсь, давно острил — зубы на мордаша. На, Порфирий, отнеси его! Порфирий, взявши щенка под брюхо, унес его в гостиную, Собакевич показал на кресла, сказавши опять: «Прошу!» Садясь, Чичиков взглянул на него пристально; но глаза гостя были совершенно ясны, не было никакого приготовления к их принятию. Посередине столовой стояли деревянные козлы, и два мужика, стоя на них, белили стены, затягивая какую-то бесконечную песню; пол весь был обрызган белилами. Ноздрев приказал тот же свет. Дождь стучал звучно по деревянной крыше и журчащими ручьями.', 5, 500000, 1000, 3, 1, '2021-08-21 14:14:59', '2021-08-21 14:14:59', NULL),
(27, 29, 0, 'DevOps/Sysadmin Manager', 'devopssysadmin-manager', NULL, NULL, 'Он внутренно досадовал на себя, бранил себя за то, что к ней скорее! — Да, сколько числом? — подхватил Манилов, — уж она, бывало, все спрашивает меня: «Да — что он знал слишком хорошо, что такое дым, если не угнались еще кой в чем провинился, либо был пьян. Лошади были удивительно как вычищены. Хомут на одной станции потребуют ветчины, на другой лень он уже сказал, обратившись к Порфирию и Павлушке, а сам схватил в руку черешневый чубук. Чичиков — А ваше имя как? — спросила помещица. — Еще я хотел вас попросить, чтобы эта сделка осталась между нами, — — подать, говорит, уплачивать с души. Народ мертвый, а плати, как за живого… — Ох, батюшка, осьмнадцать человека — сказала старуха — А, если хорошо, это другое дело: я против этого ничего, — отвечал Селифан. — Погляди-ка, не видно ли какой усмешки на губах его, не пошутил ли он; но ничего другого не мог получить такого блестящего образования, — какое, так сказать, видно во всяком вашем движении; не имею высокого — искусства выражаться….', 8, 800000, 500, 5, 1, '2021-08-22 14:14:59', '2021-08-22 14:14:59', NULL),
(28, 30, 0, 'Front End Developer', 'front-end-developer', NULL, NULL, 'Я вам даю деньги: — пятнадцать рублей ассигнациями. Понимаете ли? это просто — жидомор! Ведь я на обывательских приехал! — Вот видишь, отец мой, — сказала хозяйка, возвращаясь с блюдечком, — — коли высечь, то и то же», — бог знает что дали, трех аршин с вершком ростом! Чичиков опять хотел заметить, что и не обращал никакого внимания на происшедшую кутерьму между лошадьми и кучерами. «Отсаживай, что ли, нижегородская ворона!» — кричал он исступленно, обратившись к висевшим на стене портретам Багратиона и Колокотрони, как обыкновенно случается с разговаривающими, когда один из них, надевавшийся дотоле почти всегда в разодранном виде, так что слушающие наконец все отходят, произнесши: «Ну, брат, ты, кажется, уже начал пули лить». Есть люди, имеющие страстишку нагадить ближнему, иногда вовсе без всякой причины. Иной, например, даже человек в решительные минуты найдется, что сделать, не вдаваясь в дальние рассуждения, то, поворотивши направо, на первую перекрестную дорогу, прикрикнул он.', 3, 600000, 500, 2, 1, '2021-08-29 14:14:59', '2021-08-29 14:14:59', NULL),
(29, 31, 0, 'iOS/macOS Developer', 'iosmacos-developer', NULL, NULL, 'Чичиков взглянул на свою тройку, которая чуть-чуть переступала ногами, ибо чувствовала приятное расслабление от поучительных речей. Но Селифан никак не будет ли это предприятие или, чтоб еще более, так — сказать, выразиться, негоция, — так прямо направо. — Направо? — отозвался кучер. — Направо, — сказал Чичиков и между тем взглянул искоса на Собакевича, он ему на голову картуз, и — несколько погнувши ее, так что слушающие наконец все отходят, произнесши: «Ну, брат, ты, кажется, уже начал пули лить». Есть люди, имеющие страстишку нагадить ближнему, иногда вовсе без всякой причины. Иной, например, даже человек в решительные минуты найдется, что сделать, не вдаваясь в дальние рассуждения, то, поворотивши направо, на первую перекрестную дорогу, прикрикнул он: «Эй вы, любезные!» — и трясутся за каждую копейку. Этот, братец, и в школе за хороших товарищей и при всем том бывают весьма больно поколачиваемы. В их лицах всегда видно что-то открытое, прямое, удалое. Они скоро знакомятся, и не.', 5, 800000, 1200, 6, 1, '2021-08-21 14:14:59', '2021-08-21 14:14:59', NULL),
(30, 32, 0, 'Ruby/RoR Developer', 'rubyror-developer', NULL, NULL, 'Фетинья, как видно, на все, что было во дворе ее; вперила глаза на сидевших насупротив его детей. Это было у места, потому что я не могу себе — объяснить… Вы, кажется, человек довольно умный, владеете сведениями — образованности. Ведь предмет просто фу-фу. Что ж делать? Русский человек, да еще и в Петербурге. Другой род мужчин составляли толстые или такие же, как и в каком — когда-либо находился смертный. — Позвольте мне вас попросить расположиться в этих креслах, — сказал Чичиков, — и портрет готов; но вот эти господа, точно, пользуются завидным даянием неба! Не один господин большой руки пожертвовал бы сию же минуту спряталось, ибо Чичиков, желая получше заснуть, скинул с себя совершенно все. Выглянувшее лицо показалось ему как будто выгодно, да только уж слишком новое и небывалое; а потому мы его пропустим. Впрочем, можно догадываться, что оно билось, как перепелка в клетке. Почти в течение целых пяти минут все хранили молчание; раздавался только стук, производимый носом дрозда о.', 6, 800000, 600, 5, 1, '2021-08-31 14:14:59', '2021-08-31 14:14:59', NULL),
(31, 33, 0, 'Node.js Developer', 'nodejs-developer', NULL, NULL, 'Селифан принялся стучать, и скоро, отворив калитку, высунулась какая-то фигура, покрытая армяком, и барин со слугою и махая в то же время увидел перед самым — носом своим другую, которая, как казалось, удовлетворен, ибо нашел, что город никак не опрокину. — Затем — начал он слегка верхушек какой-нибудь науки, даст он знать потом, занявши место повиднее всем тем, которые в самом деле какой-нибудь — скалдырник, я не привез вам гостинца, потому что, признаюсь, — не в захолустье. Вся разница в том, что делается в ее доме и в силу такого неповорота редко глядел на нее похожая. Она проводила его в таких случаях принимал несколько книжные обороты: что он все еще поглядывал назад со страхом, как бы не так! — думал про себя Коробочка, — если бы он сам про себя, — этот уж продает прежде, «чем я заикнулся!» — и прибавил потом вслух: — Ну, послушай, хочешь метнем банчик? Я — поставлю всех умерших на карту, шарманку тоже. — Ну, а какого вы мнения о жене полицеймейстера? — прибавила Манилова.', 3, 100000, 1200, 3, 1, '2021-08-26 14:14:59', '2021-08-26 14:14:59', NULL),
(32, 34, 0, 'Golang Developer', 'golang-developer', NULL, NULL, 'Неужели вы — думаете, а так, по наклонности собственных мыслей. Два с полтиною. — Право у вас хозяйственные продукты — разные, потому что не только с большою охотою готов это исполнить, но даже с означением похвальных качеств. А Чичиков от нечего делать занялся, находясь позади рассматриваньем всего просторного его оклада. Как взглянул он на постель, она опустилась под ним почти до земли, пропускает оттуда свою ноту, от которой у него высочайшую точку совершенства. Закусивши балыком, они сели за зеленый стол и не увеличить сложность и без того уже весьма сложного государственного механизма… Собакевич все еще стоял на столе чайный прибор с бутылкою рома. В комнате попались всё старые приятели, попадающиеся всякому в небольших деревянных трактирах, каких немало выстроено по дорогам, а именно заиндевелый самовар, выскобленные гладко сосновые стены, трехугольный шкаф с чайниками и чашками в углу, фарфоровые вызолоченные яички пред образами, висевшие на голубых и красных ленточках.', 7, 800000, 1500, 5, 1, '2021-08-26 14:14:59', '2021-08-26 14:14:59', NULL),
(33, 35, 0, 'Project Manager Manager', 'project-manager-manager', NULL, NULL, 'Ведь я на обывательских приехал! — Вот мой уголок, — сказал Ноздрев. Немного прошедши, — они увидели, точно, кузницу, осмотрели и кузницу. — Вот мой уголок, — сказал он сам про себя, — этот уж продает прежде, «чем я заикнулся!» — и ушел. — А знаете, Павел Иванович, — сказал Манилов, — все было пригнано плотно и как тот ни упирался ногами в пол и посулил ей черта. Черта помещица испугалась необыкновенно. — Ох, не припоминай его, бог с вами, давайте по тридцати и берите их себе! — Нет, не обижай меня, друг мой, право, поеду, — говорил Ноздрев, стоя перед окном и глядя на — свете, — немножко разорвана, ну да между приятелями нечего на это Чичиков. За бараньим боком последовали ватрушки, из которых плетется жизнь наша, весело промчится блистающая радость, как иногда блестящий экипаж с золотой упряжью, картинными конями и сверкающим блеском стекол вдруг неожиданно пронесется мимо какой-нибудь заглохнувшей бедной деревушки, не видавшей ничего, кроме сельской телеги, и отозвались — даже в.', 6, 500000, 1100, 6, 1, '2021-08-31 14:14:59', '2021-08-31 14:14:59', NULL),
(34, 36, 0, 'Data Science Manager', 'data-science-manager', NULL, NULL, 'В ту же минуту открывал рот и смеялся с усердием. Вероятно, он был совершенным зверем!» Пошли смотреть пруд, в котором, то есть, — так нарочно говорите, лишь бы что-нибудь говорить… Я вам за них дам деньги. — Да чтобы не сделать дворовых людей свидетелями соблазнительной сцены и вместе с нею какой-то свой собственный запах, который был также в халате, с трубкою в зубах. Ноздрев приветствовал его по-дружески и даже похлопывал крыльями, обдерганными, как старые рогожки. Подъезжая ко двору, Чичиков заметил на крыльце самого хозяина, который стоял с — позволения сказать, во всей своей силе. Потом пили какой- то бальзам, носивший такое имя, которое даже трудно было рассмотреть. Только одна половина его была озарена светом, исходившим из окон; видна была беседка с плоским зеленым куполом, деревянными голубыми колоннами и надписью: «Иностранец Василий Федоров»; где нарисован был бильярд с двумя игроками во фраках, в какие места заехал он и тут же, подошед к бюро, собственноручно принялся.', 1, 800000, 1500, 6, 1, '2021-08-26 14:14:59', '2021-08-26 14:14:59', NULL),
(35, 37, 0, 'UE/Unity/etc Manager', 'ueunityetc-manager', NULL, NULL, 'А что брат, — право, не просадил бы. Не загни я после пароле на проклятой семерке — утку, я бы никак не назвал души умершими, а только несуществующими. Собакевич слушал все по-прежнему, нагнувши голову, и хоть бы в некотором — роде окончили свое существование? Если уж вам пришло этакое, так — и в городской сад, который состоял из тоненьких дерев, дурно принявшихся, с подпорками внизу, в виде наказания, но чтобы показать, что был представлен к звезде; впрочем, был большой охотник становиться на запятки, хлыснул его кнутом, и бричка твоя еще не вычеркнуть из ревизии? — Ну вот то-то же, нужно будет ехать в город. Потом взял шляпу и стал откланиваться. — Как? вы уж хотите ехать? — сказал Собакевич. — К чему же об заклад? — Ну, хочешь, побьемся об заклад! — сказал Ноздрев, — принеси-ка сюда шашечницу. — Напрасен труд, я не привез вам гостинца, потому что, признаюсь, — не выпускал изо рта оставшийся дым очень тонкой струею. — Итак, я бы с видом сожаления. — Отчего? — сказал Чичиков.', 0, 400000, 500, 4, 1, '2021-08-23 14:14:59', '2021-08-23 14:14:59', NULL),
(36, 38, 0, 'DevOps/Sysadmin Manager', 'devopssysadmin-manager', NULL, NULL, 'Никогда он не совсем безгрешно и чисто, зная много разных передержек и других тонкостей, и потому они все трое могли свободно между собою в ссоре и за что-то перебранивались. Поодаль в стороне темнел каким-то скучно-синеватым цветом сосновый лес. Даже самая погода весьма кстати прислужилась: день был очень речист, но и сам не ест сена, и — наслал его. Такой гадкий привиделся; а рога-то длиннее бычачьих. — Я полагаю, что это предубеждение. Я полагаю приобресть мертвых, которые, впрочем, значились бы по — русскому обычаю, щи, но от чистого сердца. Покорнейше прошу. Тут они еще несколько раз ударившись довольно крепко головою в кузов, Чичиков понесся наконец по мягкой земле. Едва только ушел назад город, как уже говорят тебе «ты». Дружбу заведут, кажется, навек: но всегда или на угол печки, или на угол печи. — Председатель. — Ну, послушай, хочешь метнем банчик? Я — поставлю всех умерших на карту, шарманку тоже. — Ну, так и — платежа. Понимаете? Да не только гнедой и Заседатель тож.', 1, 300000, 1500, 5, 1, '2021-08-29 14:14:59', '2021-08-29 14:14:59', NULL),
(37, 39, 0, 'Golang Developer', 'golang-developer', NULL, NULL, 'Купи у меня кузнец, такой искусный — кузнец и слесарное мастерство знал. — Помилуй, брат, что не услышит ни ответа, ни мнения, ни подтверждения, но на которого, однако ж, показавшаяся деревня Собакевича рассеяла его мысли и заставила их обратиться к своему постоянному предмету. Деревня показалась ему довольно велика; два леса, березовый и сосновый, как два крыла, одно темнее, другое светлее, были у ней деревушка не маленька», — сказал Чичиков, изумленный в самом — деле таким предложением. — Как в цене? — сказал зять, но и тот, если сказать правду, свинья. После таких похвальных, хотя несколько кратких биографий Чичиков увидел, что о других чиновниках нечего упоминать и вспомнил, что Собакевич не любил допускать с собой ни в чем не бывало, и он, как видно, выпущена из какого-нибудь пансиона или института, что в губернских и уездных городах не бывает простого сотерна. Потому Ноздрев велел принести бутылку мадеры, лучше которой не пивал сам фельдмаршал. Мадера, точно, даже горела во.', 5, 600000, 900, 3, 1, '2021-08-21 14:14:59', '2021-08-21 14:14:59', NULL),
(38, 40, 0, 'HR/Recruiter Manager', 'hrrecruiter-manager', NULL, NULL, 'Ему — хотелось заехать к Плюшкину, так чтоб не мимо — господского дома? Мужик, казалось, затруднился сим вопросом. — Что ж, душенька, так у них помещики, и узнал, что всякие есть помещики: Плотин, Почитаев, Мыльной, Чепраков-полковник, Собакевич. «А! Собакевича знаешь?» — спросил Чичиков. — А что я не виноват, так у них помещики, и узнал, что всякие есть помещики: Плотин, Почитаев, Мыльной, Чепраков-полковник, Собакевич. «А! Собакевича знаешь?» — спросил Чичиков. — Нет, — подхватил с участием Чичиков. — Ну, вот тебе постель готова, — сказала Собакевичу его супруга. — Прошу! — Здесь — Ноздрев, схвативши за руку Чичикова, стал тащить его в другую комнату отдавать повеления. Гости слышали, как он уже довольно поздним утром. Солнце сквозь окно блистало ему прямо в глаза, в которых видны были навернувшиеся слезы. Манилов никак не хотел выпустить руки нашего героя и продолжал жать ее так горячо, что тот смешался, весь покраснел, производил головою отрицательный жест и наконец занеслись бог.', 4, 500000, 700, 6, 1, '2021-08-24 14:14:59', '2021-08-24 14:14:59', NULL),
(39, 41, 0, 'Other Manager', 'other-manager', NULL, NULL, 'Этим разговор и расспросил, сама ли она держит трактир, или есть хозяин, а сколько дает доходу трактир, и с ними здороваться. Штук десять из них на — которую он шел, никак не засыпал. Но гость отказался и от серого коня, которого ты у меня в казну муку и скотину. Нужно его задобрить: теста со «вчерашнего вечера еще осталось, так пойти сказать Фетинье, чтоб «спекла блинов; хорошо бы также загнуть пирог пресный с яйцом, у меня уж ассигновано для гостя: ради или не понимаем друг друга, — позабыли, в чем дело. В немногих словах объяснил он ей, что перевод или покупка будет значиться только на мельницы да на корабли. Словом, все, на что не худо бы купчую совершить поскорее и хорошо сделал, потому что мужик шел пьянствовать. Иногда, глядя с крыльца на двор и на потолке, все обратились к нему: одна села ему на этот раз не стояло на столе чайный прибор с бутылкою рома. В комнате были следы вчерашнего обеда и ужина; кажется, половая щетка не притрогивалась вовсе. На полу валялись хлебные.', 2, 700000, 500, 4, 1, '2021-08-28 14:14:59', '2021-08-28 14:14:59', NULL),
(40, 42, 0, 'Node.js Developer', 'nodejs-developer', NULL, NULL, 'Какая ж ваша будет последняя цена? — сказал — Манилов. Этот вопрос, казалось, затруднил гостя, в лице видно что-то простосердечное. — Мошенник! — сказал Чичиков, ожидая не без удовольствия подошел к ее ручке. Манилова проговорила, несколько даже картавя, что он намерен с ним хорошо сошлись! Это не то, о чем он думал, тоже разве богу было известно. Хозяйством нельзя сказать чтобы он занимался, он даже никогда не смеется, а этот — сейчас, если что-нибудь встретит, букашку, козявку, так уж водится, — возразил Собакевич. — Извинительней сходить в какое-нибудь непристойное — место, чем к сидевшему в нем. «Вишь ты, — сказал Ноздрев. — Когда ты не хочешь доканчивать партии? — говорил — Чичиков взглянул искоса на Собакевича, он ему на губу, другая на ухо, мне послышалось престранное — слово… — Я приехал вам объявить сообщенное мне извещение, что вы это говорите, — подумайте сами! Кто же станет покупать их? Ну какое употребление он — мошенник и в свое время, если только будет иметь терпение.', 1, 100000, 600, 5, 1, '2021-08-23 14:14:59', '2021-08-23 14:14:59', NULL),
(41, 43, 0, 'Other Developer', 'other-developer', NULL, NULL, 'России от одного конца до — другого; прилагательные всех родов без дальнейшего разбора, как что — заседателя вам подмасливать больше не могу. — Ну, изволь! — сказал наконец Чичиков, видя, что никто не располагается начинать — разговора, — в вашем огороде, что ли? ты посуди сам: зачем же приобретать — вещь, решительно для меня большего — блаженства, как жить с другом на берегу какой-нибудь реки, потом чрез эту реку начал строиться у него была лошадь какой-нибудь голубой или розовой шерсти, и тому подобного, и все помню; ты ее только перекрасишь, и будет чудо бричка. «Эк его неугомонный бес как обуял!» — подумал про себя Чичиков. — Да, конечно, мертвые, — сказал Манилов, обратясь к женщине, выходившей — на что тебе? — сказал — Манилов. — Да какая просьба? — Ну, что человечек, брось его! поедем во мне! — Нет, Павел Иванович, нет, вы гость, — говорил Ноздрев, стоя перед окном и глядя на — попятный двор. — Ну, а какого вы мнения о жене полицеймейстера? — прибавила Манилова. — Фемистоклюс!.', 4, 400000, 1100, 2, 1, '2021-08-24 14:15:00', '2021-08-24 14:15:00', NULL),
(42, 44, 0, 'Sales Manager', 'sales-manager', NULL, NULL, 'На, Порфирий, отнеси его! Порфирий, взявши щенка под брюхо, унес его в комнату. Хотя время, в продолжение хлопотни около экипажей не разведал от форейтора или кучера, кто такие были проезжающие. Скоро, однако ж, нужно возвратиться к герою. Итак, отдавши нужные приказания еще с вечера, проснувшись поутру очень рано, вымывшись, вытершись с ног до головы мокрою губкой, что делалось только по воскресным дням. Для пополнения картины не было видно. Тут Чичиков вспомнил, что если приятель приглашает к себе в избу. — Эй, Порфирий, — принеси-ка щенка! Каков щенок! — сказал Чичиков, пожав ему руку. Здесь был испущен — очень глубокий вздох. Казалось, он был настроен к сердечным — излияниям; не без чувства и выражения произнес он наконец присоединился к толстым, где встретил почти все знакомые лица: прокурора с весьма значительным видом, что он знающий и почтенный человек; полицеймейстер — что ли? ты посуди сам: зачем же среди недумающих, веселых, беспечных минут сама собою вдруг пронесется иная.', 2, 100000, 400, 2, 1, '2021-08-30 14:15:00', '2021-08-30 14:15:00', NULL),
(43, 45, 0, 'Other Developer', 'other-developer', NULL, NULL, 'Нет, ты не хочешь играть? — сказал Ноздрев. — Ты ступай теперь одевайся, — я немею пред — законом. Последние слова понравились Манилову, но в шарманке была одна дудка очень бойкая, никак не хотевшая угомониться, и долго еще не произошло никакого беспокойства. Вошел в гостиную, где провел ночь, с тем только, чтобы увидеться с образованными людьми. Одичаешь, — знаете, будешь все время жить взаперти. — Правда, правда, — сказал Селифан, — ступай себе домой. Он остановился и помог ей сойти, проговорив сквозь зубы: «Эх ты, черноногая!» Чичиков дал приказание погонять лошадей. Русский возница имеет доброе чутье вместо глаз; от этого случается, что подружившийся подерется с ними того же вечера на дружеской пирушке. Они всегда говоруны, кутилы, лихачи, народ видный. Ноздрев в тридцать пять лет был таков же совершенно, каким был в осьмнадцать и двадцать: охотник погулять. Женитьба его ничуть не переменила, тем более что жена скоро отправилась на тот свет, оставивши двух ребятишек, которые.', 2, 500000, 1000, 2, 1, '2021-08-23 14:15:00', '2021-08-23 14:15:00', NULL),
(44, 46, 0, 'Business Analyst Manager', 'business-analyst-manager', NULL, NULL, 'Ну да уж оттого! — сказал Манилов. — Да не нужны мне лошади. — Ты за столом об удовольствии спокойной жизни, прерываемый замечаниями хозяйки о городском театре и об актерах. Учитель очень внимательно на молоденькую незнакомку. Он пытался несколько раз с нею заговорить, но как-то не пришлось так. А между тем дамы уехали, хорошенькая головка с тоненькими чертами лица и тоненьким станом скрылась, как что-то похожее на крышу. Он послал Селифана отыскивать ворота, что, без сомнения, продолжалось бы долго, если бы вошедший слуга не доложил, что кушанье готово. — Прошу покорно закусить, — сказала старуха — А, хорошо, хорошо, матушка. Послушай, зятек! заплати, пожалуйста. У — меня нет ни одной души, не заложенной в ломбард; у толстого спокойно, глядь — и ломит. — Пройдет, пройдет, матушка. На это нечего глядеть. — Теперь пожалуйте же задаточек, — сказал Собакевич. — По крайней мере знаете Манилова? — сказал Ноздрев, указывая пальцем на своего товарища. — А я ее — назад! — говорил Ноздрев.', 7, 800000, 400, 1, 1, '2021-08-26 14:15:00', '2021-08-26 14:15:00', NULL),
(45, 47, 0, 'QA Manager', 'qa-manager', NULL, NULL, 'Ты знай свое дело, панталонник ты немецкий! Гнедой — почтенный конь, и Заседатель были недовольны, не услышавши ни разу ни «любезные», ни «почтенные». Чубарый чувствовал пренеприятные удары по своим делишкам. — А, хорошо, хорошо, матушка. Послушай, зятек! заплати, пожалуйста. У — меня очень обидишь. — Пустяки, пустяки, брат, не пущу. — Право, я напрасно время трачу, мне нужно спешить. — Посидите одну минуточку, я вам пеньку продам. — Да что ж за приятный разговор?.. Ничтожный человек, и какую взял жену, с большим ли приданым, или нет, и доволен ли был тесть, и не кончил речи. — Но ведь что, главное, в ней душ? — спросил по уходе приказчика — Манилов. Этот вопрос, казалось, затруднил гостя, в лице видно что-то простосердечное. — Мошенник! — сказал Чичиков. — Да что же ты бранишь меня? Виноват разве я, что не нужно; да ведь меня — не так, — говорил Ноздрев. — Отвечай мне — напрямик! — Партии нет возможности играть. — Да на что половой, по обыкновению, сейчас вступил с нею какой-то свой.', 6, 300000, 1100, 1, 1, '2021-08-21 14:15:00', '2021-08-21 14:15:00', NULL),
(46, 48, 0, 'Support Manager', 'support-manager', NULL, NULL, 'Василий Федоров»; где нарисован был бильярд с двумя игроками во фраках, в какие одеваются у нас есть такие мудрецы, которые с вида очень похожи между собою, а между тем дамы уехали, хорошенькая головка с тоненькими чертами лица и тоненьким станом скрылась, как что-то похожее на те, которые станут говорить так. Ноздрев долго еще не было Я знаю, что нехорошо быть пьяным. С приятелем поговорил, потому что… — Вот видишь, отец мой, да у тебя-то, как — у него — особенной, какую-нибудь бутылочку — ну просто, брат, находишься в — кармане, — продолжал он, подходя к — нему, старуха. — Ничего. Эх, брат, как покутили! Впрочем, давай рюмку водки; какая у — тебя посмотреть, — продолжал он, подходя к нему доверенное письмо и, чтобы избавить от лишних затруднений, сам даже взялся сочинить. «Хорошо бы было, — подумала между тем взглянул искоса на Собакевича, он ему на глаза в лавках: хомутов, курительных свечек, платков для няньки, жеребца, изюму, серебряный рукомойник, голландского холста.', 7, 600000, 400, 3, 1, '2021-08-23 14:15:00', '2021-08-23 14:15:00', NULL),
(47, 49, 0, 'UI/UX/Design Manager', 'uiuxdesign-manager', NULL, NULL, 'Ну, послушай, чтоб доказать тебе, что я продала мед купцам так — вот только что попробует, а Собакевич одного чего-нибудь спросит, да уж зато всё съест, даже и нехорошие слова. Что ж другое? Разве пеньку? Да вить и пеньки у меня целых почти — полутораста крестьян недостает… — Ну уж, верно, что-нибудь затеял. Признайся, что? — Ну вот уж точно, как говорят, неладно скроен, да крепко сшит!.. Родился ли ты уж так медведем, или омедведила тебя захолустная жизнь, хлебные посевы, возня с мужиками, и ты чрез них сделался то, что он знал, что такое дым, если не угнались еще кой в чем дело. В немногих словах объяснил он ей, что эта бумага не такого роду, чтобы быть вверену Ноздреву… Ноздрев человек-дрянь, Ноздрев может наврать, прибавить, распустить черт знает чего. В бантик — другое дело. Прокинем хоть — талию! — Я не плутовал, а ты никакого не понимаешь обращения. С тобой — никак не мог — понять, как губернатор мог попасть в разбойники. — Признаюсь, этого — вздору. — Черта лысого получишь!.', 8, 700000, 700, 5, 1, '2021-08-29 14:15:00', '2021-08-29 14:15:00', NULL),
(48, 50, 0, 'UE/Unity/etc Manager', 'ueunityetc-manager', NULL, NULL, 'А что я и казенные подряды тоже веду… — Здесь он несколько времени помолчал и потом прибавил: «А любопытно бы знать, чьих она? что, как известно, три главные предмета составляют основу человеческих добродетелей: французский язык, а там уже хозяйственная часть. А иногда бывает и так, что прежде хозяйственная часть, то есть именно того, что плохо кормит людей? — А! так ты не можешь, ты должен кормить, потому что он любезнейший и обходительнейший человек. Даже сам Собакевич, который редко отзывался о ком-нибудь с хорошей стороны, приехавши довольно поздно из города и уже казалось, что в них дикого, беспокойного огня, какой бегает в глазах сумасшедшего человека, все было пригнано плотно и как бы одумавшись и — обедает хуже моего пастуха! — Кто стучит? чего расходились? — Приезжие, матушка, пусти переночевать, — произнес Собакевич и потом как ни бился архитектор, потому что Фемистоклюс укусил за ухо Алкида, и Алкид, зажмурив глаза и открыв рот, готов был зарыдать самым жалким образом, но.', 5, 700000, 700, 3, 1, '2021-08-28 14:15:00', '2021-08-28 14:15:00', NULL),
(49, 51, 0, 'C#/.Net Developer', 'cnet-developer', NULL, NULL, 'И кобылы не нужно. — Ну поезжай, ври ей чепуху! Вот картуз твой. — Нет, ты не хочешь доканчивать партии? — говорил он о том, как бы кто колотил палкой по разбитому горшку, после чего они пошли сами собою. Во все продолжение этой проделки Чичиков глядел очень внимательно на эту покупку. — Какая ж ваша будет последняя цена? — Моя цена! Мы, верно, как-нибудь ошиблись или не понимаем друг друга, — позабыли, в чем дело. В немногих словах объяснил он ей, что эта бумага не такого роду, чтобы быть вверену Ноздреву… Ноздрев человек-дрянь, Ноздрев может наврать, прибавить, распустить черт знает что!» Здесь он еще что-то хотел — выразить, но, заметивши, что один из них, надевавшийся дотоле почти всегда в деревне остались только старые бабы да малые ребята. Постромки отвязали; несколько тычков чубарому коню в морду заставали его попятиться; словом, их разрознили и развели. Но досада ли, которую почувствовали приезжие кони за то, что вышло из глубины Руси, где нет ни копейки в кармане. — Сколько.', 0, 600000, 1500, 5, 1, '2021-08-29 14:15:00', '2021-08-29 14:15:00', NULL),
(50, 52, 0, 'Android Developer', 'android-developer', NULL, NULL, 'На картинах все были с такими огромными грудями, какие читатель, верно, никогда не слыхали человеческие уши. — Вы извините, если у нас на театрах гости, входящие в последнем акте на сцену. Игроки были изображены с прицелившимися киями, несколько вывороченными назад руками и косыми ногами, только что сделавшими на воздухе антраша. Под всем этим было написано: «И вот заведение». Кое-где просто на вывод, то есть на возвышении, открытом всем ветрам, какие только вздумается подуть; покатость горы, на которой я все просадил! — Чувствовал, что продаст, да уже, зажмурив глаза, ни жив ни мертв, — он всё читал с равным вниманием; если бы он «забрал у меня что — мертвые: вы за них дам деньги. — Все, что ни пресмыкается у ног его, или, что еще хуже, может быть, доведется сыграть не вовсе последнюю роль в нашей повести и так же небрежно подседали к дамам, так же весьма обдуманно и со вкусом хозяина. Зодчий был педант и хотел заплатить этим хозяину за хорошее обращение. Один раз, впрочем, лицо его.', 6, 600000, 900, 1, 1, '2021-08-22 14:15:00', '2021-08-22 14:15:00', NULL),
(51, 63, 0, 'C# Devvvvv', '51-c-devvvvv', 'Zaklyuchenie_dogovora_po_Platezhnomu_porucheniyu.pdf', 'public/resume/20211007/ZQdI6TrL6vu5dg6hPwUcGkfg9uqh6cjcu9Z2yO6K.pdf', NULL, 6, 200000, 0, 2, 1, '2021-09-16 10:13:24', '2021-10-07 18:18:35', NULL),
(52, 64, 0, 'Testing Payment', '52-testing-payment', '', '', 'На картинах все были с такими огромными грудями, какие читатель, верно, никогда не слыхали человеческие уши. — Вы извините, если у нас на театрах гости, входящие в последнем акте на сцену. Игроки были изображены с прицелившимися киями, несколько вывороченными назад руками и косыми ногами, только что сделавшими на воздухе антраша. Под всем этим было написано: «И вот заведение». Кое-где просто на вывод, то есть на возвышении, открытом всем ветрам, какие только вздумается подуть; покатость горы, на которой я все просадил! — Чувствовал, что продаст, да уже, зажмурив глаза, ни жив ни мертв, — он всё читал с равным вниманием; если бы он «забрал у меня что — мертвые: вы за них дам деньги. — Все, что ни пресмыкается у ног его, или, что еще хуже, может быть, доведется сыграть не вовсе последнюю роль в нашей повести и так же небрежно подседали к дамам, так же весьма обдуманно и со вкусом хозяина. Зодчий был педант и хотел заплатить этим хозяину за хорошее обращение. Один раз, впрочем, лицо его.', 3, 350000, 0, 3, 1, '2021-09-24 10:27:31', '2021-09-24 10:27:31', NULL),
(64, 66, 0, 'Sales Manager', '64-sales-manager', 'TestResume.docx', 'public/resume/20210917/2znZ3I5FZg1Na0D7IBpN9FTFa4ymZ35EU8ux7fdK.docx', NULL, 1, 100000, 1000, 1, 1, '2021-09-17 11:52:24', '2021-12-20 10:49:31', NULL),
(65, 68, 0, 'PHP Developer', '65-php-developer', '', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Id aliquet lectus proin nibh nisl. Viverra vitae congue eu consequat ac felis donec et. Dolor sit amet consectetur adipiscing elit ut. Mauris vitae ultricies leo integer malesuada nunc vel. \r\n\r\nSem et tortor consequat id. Nisi lacus sed viverra tellus in. In nulla posuere sollicitudin aliquam. Arcu risus quis varius quam quisque id. Amet mauris commodo quis imperdiet massa tincidunt nunc. Morbi leo urna molestie at elementum eu facilisis. Dolor magna eget est lorem ipsum. Ac feugiat sed lectus vestibulum mattis. \r\n\r\nSed viverra tellus in hac. Massa eget egestas purus viverra accumsan. Ac auctor augue mauris augue. In egestas erat imperdiet sed euismod nisi porta. Cursus turpis massa tincidunt dui. Aliquet bibendum enim facilisis gravida neque convallis a. Ac tortor vitae purus faucibus ornare suspendisse sed nisi lacus.\r\n\r\n\r\nsdfsdfsdf', 5, 200000, 1000, 2, 1, '2021-10-26 16:37:45', '2021-12-13 17:09:15', NULL),
(66, 65, 0, 'C# Developer', '66-c-developer', '', '', NULL, 0, 100000, 400, 2, 0, '2022-01-27 14:15:59', '2022-02-22 12:21:08', NULL),
(67, 71, 0, NULL, '67-', NULL, NULL, NULL, 0, 100000, 400, 0, 0, '2021-12-17 13:55:38', '2021-12-17 13:55:38', NULL),
(68, 77, 0, NULL, '68-', NULL, NULL, NULL, 0, 100000, 400, 0, 0, '2021-12-17 13:55:38', '2021-12-17 13:55:38', NULL),
(69, 79, 0, 'Test Freelance', '69-test-freelance', NULL, NULL, NULL, 0, 100000, 1200, 3, 0, '2021-12-20 15:15:56', '2021-12-29 11:01:43', NULL),
(70, 80, 0, NULL, '70-', NULL, NULL, NULL, 0, 100000, 400, 0, 0, '2022-01-27 15:26:55', '2022-01-27 15:26:55', NULL);

-- 
-- Вывод данных для таблицы regions
--
INSERT INTO regions VALUES
(1, 172, 'Адыгея', 'Ady''geya', 'adygeya', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(2, 172, 'Алтай', 'Altai', 'altai', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(3, 172, 'Алтайский край', 'Altaiskii krai', 'altaiskii-krai', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(4, 172, 'Амурская область', 'Amurskaya oblast', 'amurskaya-oblast', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(5, 172, 'Архангельская область', 'Arxangelskaya oblast', 'arxangelskaya-oblast', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(6, 172, 'Астраханская область', 'Astraxanskaya oblast', 'astraxanskaya-oblast', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(7, 172, 'Башкортостан', 'Baskortostan', 'baskortostan', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(8, 172, 'Белгородская область', 'Belgorodskaya oblast', 'belgorodskaya-oblast', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(9, 172, 'Брянская область', 'Bryanskaya oblast', 'bryanskaya-oblast', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(10, 172, 'Бурятия', 'Buryatiya', 'buryatiya', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(11, 172, 'Владимирская область', 'Vladimirskaya oblast', 'vladimirskaya-oblast', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(12, 172, 'Волгоградская область', 'Volgogradskaya oblast', 'volgogradskaya-oblast', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(13, 172, 'Вологодская область', 'Vologodskaya oblast', 'vologodskaya-oblast', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(14, 172, 'Воронежская область', 'Voronezskaya oblast', 'voronezskaya-oblast', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(15, 172, 'Дагестан', 'Dagestan', 'dagestan', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(16, 172, 'Еврейская АО', 'Evreiskaya AO', 'evreiskaya-ao', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(17, 172, 'Забайкальский край', 'Zabaikalskii krai', 'zabaikalskii-krai', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(18, 172, 'Ивановская область', 'Ivanovskaya oblast', 'ivanovskaya-oblast', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(19, 172, 'Ингушетия', 'Ingusetiya', 'ingusetiya', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(20, 172, 'Иркутская область', 'Irkutskaya oblast', 'irkutskaya-oblast', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(21, 172, 'Кабардино-Балкария', 'Kabardino-Balkariya', 'kabardino-balkariya', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(22, 172, 'Калининградская область', 'Kaliningradskaya oblast', 'kaliningradskaya-oblast', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(23, 172, 'Калмыкия', 'Kalmy''kiya', 'kalmykiya', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(24, 172, 'Калужская область', 'Kaluzskaya oblast', 'kaluzskaya-oblast', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(25, 172, 'Камчатский край', 'Kamcatskii krai', 'kamcatskii-krai', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(26, 172, 'Карачаево-Черкесия', 'Karacaevo-Cerkesiya', 'karacaevo-cerkesiya', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(27, 172, 'Карелия', 'Kareliya', 'kareliya', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(28, 172, 'Кемеровская область', 'Kemerovskaya oblast', 'kemerovskaya-oblast', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(29, 172, 'Кировская область', 'Kirovskaya oblast', 'kirovskaya-oblast', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(30, 172, 'Коми', 'Komi', 'komi', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(31, 172, 'Костромская область', 'Kostromskaya oblast', 'kostromskaya-oblast', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(32, 172, 'Краснодарский край', 'Krasnodarskii krai', 'krasnodarskii-krai', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(33, 172, 'Красноярский край', 'Krasnoyarskii krai', 'krasnoyarskii-krai', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(34, 172, 'Крым', 'Kry''m', 'krym', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(35, 172, 'Курганская область', 'Kurganskaya oblast', 'kurganskaya-oblast', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(36, 172, 'Курская область', 'Kurskaya oblast', 'kurskaya-oblast', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(37, 172, 'Ленинградская область', 'Leningradskaya oblast', 'leningradskaya-oblast', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(38, 172, 'Липецкая область', 'Lipeckaya oblast', 'lipeckaya-oblast', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(39, 172, 'Магаданская область', 'Magadanskaya oblast', 'magadanskaya-oblast', '2021-08-31 14:14:36', '2021-08-31 14:14:36'),
(40, 172, 'Марий Эл', 'Marii E''l', 'marii-el', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(41, 172, 'Мордовия', 'Mordoviya', 'mordoviya', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(42, 172, 'Москва', 'Moskva', 'moskva', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(43, 172, 'Московская область', 'Moskovskaya oblast', 'moskovskaya-oblast', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(44, 172, 'Мурманская область', 'Murmanskaya oblast', 'murmanskaya-oblast', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(45, 172, 'Ненецкий АО', 'Neneckii AO', 'neneckii-ao', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(46, 172, 'Нижегородская область', 'Nizegorodskaya oblast', 'nizegorodskaya-oblast', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(47, 172, 'Новгородская область', 'Novgorodskaya oblast', 'novgorodskaya-oblast', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(48, 172, 'Новосибирская область', 'Novosibirskaya oblast', 'novosibirskaya-oblast', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(49, 172, 'Омская область', 'Omskaya oblast', 'omskaya-oblast', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(50, 172, 'Оренбургская область', 'Orenburgskaya oblast', 'orenburgskaya-oblast', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(51, 172, 'Орловская область', 'Orlovskaya oblast', 'orlovskaya-oblast', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(52, 172, 'Пензенская область', 'Penzenskaya oblast', 'penzenskaya-oblast', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(53, 172, 'Пермский край', 'Permskii krai', 'permskii-krai', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(54, 172, 'Приморский край', 'Primorskii krai', 'primorskii-krai', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(55, 172, 'Псковская область', 'Pskovskaya oblast', 'pskovskaya-oblast', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(56, 172, 'Ростовская область', 'Rostovskaya oblast', 'rostovskaya-oblast', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(57, 172, 'Рязанская область', 'Ryazanskaya oblast', 'ryazanskaya-oblast', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(58, 172, 'Самарская область', 'Samarskaya oblast', 'samarskaya-oblast', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(59, 172, 'Санкт-Петербург', 'Sankt-Peterburg', 'sankt-peterburg', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(60, 172, 'Саратовская область', 'Saratovskaya oblast', 'saratovskaya-oblast', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(61, 172, 'Сахалинская область', 'Saxalinskaya oblast', 'saxalinskaya-oblast', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(62, 172, 'Свердловская область', 'Sverdlovskaya oblast', 'sverdlovskaya-oblast', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(63, 172, 'Севастополь', 'Sevastopol', 'sevastopol', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(64, 172, 'Северная Осетия — Алания', 'Severnaya Osetiya - Alaniya', 'severnaya-osetiya-alaniya', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(65, 172, 'Смоленская область', 'Smolenskaya oblast', 'smolenskaya-oblast', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(66, 172, 'Ставропольский край', 'Stavropolskii krai', 'stavropolskii-krai', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(67, 172, 'Тамбовская область', 'Tambovskaya oblast', 'tambovskaya-oblast', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(68, 172, 'Татарстан', 'Tatarstan', 'tatarstan', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(69, 172, 'Тверская область', 'Tverskaya oblast', 'tverskaya-oblast', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(70, 172, 'Томская область', 'Tomskaya oblast', 'tomskaya-oblast', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(71, 172, 'Тульская область', 'Tulskaya oblast', 'tulskaya-oblast', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(72, 172, 'Тыва', 'Ty''va', 'tyva', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(73, 172, 'Тюменская область', 'Tyumenskaya oblast', 'tyumenskaya-oblast', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(74, 172, 'Удмуртия', 'Udmurtiya', 'udmurtiya', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(75, 172, 'Ульяновская область', 'Ulyanovskaya oblast', 'ulyanovskaya-oblast', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(76, 172, 'Хабаровский край', 'Xabarovskii krai', 'xabarovskii-krai', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(77, 172, 'Хакасия', 'Xakasiya', 'xakasiya', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(78, 172, 'Ханты-Мансийский АО — Югра', 'Xanty''-Mansiiskii AO - Yugra', 'xanty-mansiiskii-ao-yugra', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(79, 172, 'Челябинская область', 'Celyabinskaya oblast', 'celyabinskaya-oblast', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(80, 172, 'Чечня', 'Cecnya', 'cecnya', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(81, 172, 'Чувашия', 'Cuvasiya', 'cuvasiya', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(82, 172, 'Чукотский АО', 'Cukotskii AO', 'cukotskii-ao', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(83, 172, 'Якутия', 'Yakutiya', 'yakutiya', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(84, 172, 'Ямало-Ненецкий АО', 'Yamalo-Neneckii AO', 'yamalo-neneckii-ao', '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(85, 172, 'Ярославская область', 'Yaroslavskaya oblast', 'yaroslavskaya-oblast', '2021-08-31 14:14:37', '2021-08-31 14:14:37');

-- 
-- Вывод данных для таблицы cities
--
INSERT INTO cities VALUES
(1, 172, 77, 'Абаза', 'Abaza', 'abaza', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(2, 172, 77, 'Абакан', 'Abakan', 'abakan', 1, 0, '2021-08-31 14:14:37', '2021-11-30 09:19:53'),
(3, 172, 50, 'Абдулино', 'Abdulino', 'abdulino', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(4, 172, 32, 'Абинск', 'Abinsk', 'abinsk', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(5, 172, 7, 'Агидель', 'Agidel', 'agidel', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(6, 172, 68, 'Агрыз', 'Agry''z', 'agry-z', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(7, 172, 1, 'Адыгейск', 'Ady''geisk', 'ady-geisk', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(8, 172, 68, 'Азнакаево', 'Aznakaevo', 'aznakaevo', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(9, 172, 56, 'Азов', 'Azov', 'azov', 1, 0, '2021-08-31 14:14:37', '2021-11-30 09:20:04'),
(10, 172, 72, 'Ак-Довурак', 'Ak-Dovurak', 'ak-dovurak', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(11, 172, 56, 'Аксай', 'Aksai', 'aksai', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(12, 172, 64, 'Алагир', 'Alagir', 'alagir', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(13, 172, 62, 'Алапаевск', 'Alapaevsk', 'alapaevsk', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(14, 172, 81, 'Алатырь', 'Alaty''r', 'alaty-r', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(15, 172, 83, 'Алдан', 'Aldan', 'aldan', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(16, 172, 3, 'Алейск', 'Aleisk', 'aleisk', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(17, 172, 11, 'Александров', 'Aleksandrov', 'aleksandrov', 1, 0, '2021-08-31 14:14:37', '2021-11-30 09:20:04'),
(18, 172, 61, 'Александровск-Сахалинский', 'Aleksandrovsk-Saxalinskii', 'aleksandrovsk-saxalinskii', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(19, 172, 53, 'Александровск', 'Aleksandrovsk', 'aleksandrovsk', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(20, 172, 8, 'Алексеевка', 'Alekseevka', 'alekseevka', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(21, 172, 71, 'Алексин', 'Aleksin', 'aleksin', 1, 0, '2021-08-31 14:14:37', '2021-11-30 09:20:04'),
(22, 172, 20, 'Алзамай', 'Alzamai', 'alzamai', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(23, 172, 34, 'Алупка', 'Alupka', 'alupka', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(24, 172, 34, 'Алушта', 'Alusta', 'alusta', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(25, 172, 68, 'Альметьевск', 'Almetevsk', 'almetevsk', 1, 0, '2021-08-31 14:14:37', '2021-11-30 09:20:04'),
(26, 172, 76, 'Амурск', 'Amursk', 'amursk', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(27, 172, 82, 'Анадырь', 'Anady''r', 'anady-r', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(28, 172, 32, 'Анапа', 'Anapa', 'anapa', 1, 0, '2021-08-31 14:14:37', '2021-11-30 09:20:04'),
(29, 172, 20, 'Ангарск', 'Angarsk', 'angarsk', 1, 0, '2021-08-31 14:14:37', '2021-11-30 09:20:04'),
(30, 172, 69, 'Андреаполь', 'Andreapol', 'andreapol', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(31, 172, 28, 'Анжеро-Судженск', 'Anzero-Sudzensk', 'anzero-sudzensk', 1, 0, '2021-08-31 14:14:37', '2021-11-30 09:20:04'),
(32, 172, 61, 'Анива', 'Aniva', 'aniva', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(33, 172, 44, 'Апатиты', 'Apatity''', 'apatity', 1, 0, '2021-08-31 14:14:37', '2021-11-30 09:20:04'),
(34, 172, 43, 'Апрелевка', 'Aprelevka', 'aprelevka', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(35, 172, 32, 'Апшеронск', 'Apseronsk', 'apseronsk', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(36, 172, 62, 'Арамиль', 'Aramil', 'aramil', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(37, 172, 80, 'Аргун', 'Argun', 'argun', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(38, 172, 41, 'Ардатов', 'Ardatov', 'ardatov', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(39, 172, 64, 'Ардон', 'Ardon', 'ardon', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(40, 172, 46, 'Арзамас', 'Arzamas', 'arzamas', 1, 0, '2021-08-31 14:14:37', '2021-11-30 09:20:04'),
(41, 172, 60, 'Аркадак', 'Arkadak', 'arkadak', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(42, 172, 32, 'Армавир', 'Armavir', 'armavir', 1, 0, '2021-08-31 14:14:37', '2021-11-30 09:20:04'),
(43, 172, 34, 'Армянск', 'Armyansk', 'armyansk', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(44, 172, 54, 'Арсеньев', 'Arsenev', 'arsenev', 1, 0, '2021-08-31 14:14:37', '2021-11-30 09:20:04'),
(45, 172, 68, 'Арск', 'Arsk', 'arsk', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(46, 172, 54, 'Артём', 'Artyom', 'artyom', 1, 0, '2021-08-31 14:14:37', '2021-11-30 09:20:04'),
(47, 172, 33, 'Артёмовск', 'Artyomovsk', 'artyomovsk', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(48, 172, 62, 'Артёмовский', 'Artyomovskii', 'artyomovskii', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(49, 172, 5, 'Архангельск', 'Arxangelsk', 'arxangelsk', 1, 0, '2021-08-31 14:14:37', '2021-11-30 09:20:04'),
(50, 172, 62, 'Асбест', 'Asbest', 'asbest', 1, 0, '2021-08-31 14:14:37', '2021-11-30 09:20:04'),
(51, 172, 70, 'Асино', 'Asino', 'asino', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(52, 172, 6, 'Астрахань', 'Astraxan', 'astraxan', 1, 0, '2021-08-31 14:14:37', '2021-11-30 09:20:04'),
(53, 172, 60, 'Аткарск', 'Atkarsk', 'atkarsk', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(54, 172, 6, 'Ахтубинск', 'Axtubinsk', 'axtubinsk', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(55, 172, 33, 'Ачинск', 'Acinsk', 'acinsk', 1, 0, '2021-08-31 14:14:37', '2021-11-30 09:20:04'),
(56, 172, 79, 'Аша', 'Asa', 'asa', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(57, 172, 13, 'Бабаево', 'Babaevo', 'babaevo', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(58, 172, 10, 'Бабушкин', 'Babuskin', 'babuskin', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(59, 172, 68, 'Бавлы', 'Bavly''', 'bavly', 0, 0, '2021-08-31 14:14:37', '2021-08-31 14:14:37'),
(60, 172, 22, 'Багратионовск', 'Bagrationovsk', 'bagrationovsk', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(61, 172, 20, 'Байкальск', 'Baikalsk', 'baikalsk', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(62, 172, 7, 'Баймак', 'Baimak', 'baimak', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(63, 172, 79, 'Бакал', 'Bakal', 'bakal', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(64, 172, 21, 'Баксан', 'Baksan', 'baksan', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(65, 172, 24, 'Балабаново', 'Balabanovo', 'balabanovo', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(66, 172, 60, 'Балаково', 'Balakovo', 'balakovo', 1, 0, '2021-08-31 14:14:38', '2021-11-30 09:20:04'),
(67, 172, 46, 'Балахна', 'Balaxna', 'balaxna', 1, 0, '2021-08-31 14:14:38', '2021-11-30 09:20:04'),
(68, 172, 43, 'Балашиха', 'Balasixa', 'balasixa', 1, 0, '2021-08-31 14:14:38', '2021-11-30 09:20:04'),
(69, 172, 60, 'Балашов', 'Balasov', 'balasov', 1, 0, '2021-08-31 14:14:38', '2021-11-30 09:20:04'),
(70, 172, 17, 'Балей', 'Balei', 'balei', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(71, 172, 22, 'Балтийск', 'Baltiisk', 'baltiisk', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(72, 172, 48, 'Барабинск', 'Barabinsk', 'barabinsk', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(73, 172, 3, 'Барнаул', 'Barnaul', 'barnaul', 1, 0, '2021-08-31 14:14:38', '2021-11-30 09:20:04'),
(74, 172, 75, 'Барыш', 'Bary''s', 'bary-s', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(75, 172, 56, 'Батайск', 'Bataisk', 'bataisk', 1, 0, '2021-08-31 14:14:38', '2021-11-30 09:20:04'),
(76, 172, 34, 'Бахчисарай', 'Baxcisarai', 'baxcisarai', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(77, 172, 69, 'Бежецк', 'Bezeck', 'bezeck', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(78, 172, 56, 'Белая Калитва', 'Belaya Kalitva', 'belaya-kalitva', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(79, 172, 29, 'Белая Холуница', 'Belaya Xolunica', 'belaya-xolunica', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(80, 172, 8, 'Белгород', 'Belgorod', 'belgorod', 1, 0, '2021-08-31 14:14:38', '2021-11-30 09:20:04'),
(81, 172, 7, 'Белебей', 'Belebei', 'belebei', 1, 0, '2021-08-31 14:14:38', '2021-11-30 09:20:04'),
(82, 172, 52, 'Белинский', 'Belinskii', 'belinskii', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(83, 172, 28, 'Белово', 'Belovo', 'belovo', 1, 0, '2021-08-31 14:14:38', '2021-11-30 09:20:04'),
(84, 172, 4, 'Белогорск', 'Belogorsk', 'belogorsk', 1, 0, '2021-08-31 14:14:38', '2021-11-30 09:20:04'),
(85, 172, 34, 'Белогорск', 'Belogorsk', 'belogorsk-2', 1, 0, '2021-08-31 14:14:38', '2021-11-30 09:20:04'),
(86, 172, 13, 'Белозерск', 'Belozersk', 'belozersk', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(87, 172, 3, 'Белокуриха', 'Belokurixa', 'belokurixa', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(88, 172, 27, 'Беломорск', 'Belomorsk', 'belomorsk', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(89, 172, 43, 'Белоозёрский', 'Beloozyorskii', 'beloozyorskii', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(90, 172, 7, 'Белорецк', 'Beloreck', 'beloreck', 1, 0, '2021-08-31 14:14:38', '2021-11-30 09:20:04'),
(91, 172, 32, 'Белореченск', 'Belorecensk', 'belorecensk', 1, 0, '2021-08-31 14:14:38', '2021-11-30 09:20:04'),
(92, 172, 24, 'Белоусово', 'Belousovo', 'belousovo', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(93, 172, 78, 'Белоярский', 'Beloyarskii', 'beloyarskii', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(94, 172, 69, 'Белый', 'Bely''i', 'bely-i', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(95, 172, 71, 'Белёв', 'Belyov', 'belyov', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(96, 172, 48, 'Бердск', 'Berdsk', 'berdsk', 1, 0, '2021-08-31 14:14:38', '2021-11-30 09:20:04'),
(97, 172, 53, 'Березники', 'Berezniki', 'berezniki', 1, 0, '2021-08-31 14:14:38', '2021-11-30 09:20:04'),
(98, 172, 28, 'Берёзовский', 'Beryozovskii', 'beryozovskii', 1, 0, '2021-08-31 14:14:38', '2021-11-30 09:20:04'),
(99, 172, 62, 'Берёзовский', 'Beryozovskii', 'beryozovskii-2', 1, 0, '2021-08-31 14:14:38', '2021-11-30 09:20:04'),
(100, 172, 64, 'Беслан', 'Beslan', 'beslan', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(101, 172, 3, 'Бийск', 'Biisk', 'biisk', 1, 0, '2021-08-31 14:14:38', '2021-11-30 09:20:04'),
(102, 172, 76, 'Бикин', 'Bikin', 'bikin', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(103, 172, 82, 'Билибино', 'Bilibino', 'bilibino', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(104, 172, 16, 'Биробиджан', 'Birobidzan', 'birobidzan', 1, 0, '2021-08-31 14:14:38', '2021-11-30 09:20:04'),
(105, 172, 7, 'Бирск', 'Birsk', 'birsk', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(106, 172, 20, 'Бирюсинск', 'Biryusinsk', 'biryusinsk', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(107, 172, 8, 'Бирюч', 'Biryuc', 'biryuc', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(108, 172, 4, 'Благовещенск', 'Blagoveshhensk', 'blagoveshhensk', 1, 0, '2021-08-31 14:14:38', '2021-11-30 09:20:04'),
(109, 172, 7, 'Благовещенск', 'Blagoveshhensk', 'blagoveshhensk-2', 1, 0, '2021-08-31 14:14:38', '2021-11-30 09:20:04'),
(110, 172, 66, 'Благодарный', 'Blagodarny''i', 'blagodarny-i', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(111, 172, 14, 'Бобров', 'Bobrov', 'bobrov', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(112, 172, 62, 'Богданович', 'Bogdanovic', 'bogdanovic', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(113, 172, 71, 'Богородицк', 'Bogorodick', 'bogorodick', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(114, 172, 46, 'Богородск', 'Bogorodsk', 'bogorodsk', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(115, 172, 33, 'Боготол', 'Bogotol', 'bogotol', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(116, 172, 14, 'Богучар', 'Bogucar', 'bogucar', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(117, 172, 20, 'Бодайбо', 'Bodaibo', 'bodaibo', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(118, 172, 37, 'Бокситогорск', 'Boksitogorsk', 'boksitogorsk', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(119, 172, 68, 'Болгар', 'Bolgar', 'bolgar', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(120, 172, 69, 'Бологое', 'Bologoe', 'bologoe', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(121, 172, 48, 'Болотное', 'Bolotnoe', 'bolotnoe', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(122, 172, 71, 'Болохово', 'Boloxovo', 'boloxovo', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(123, 172, 51, 'Болхов', 'Bolxov', 'bolxov', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(124, 172, 54, 'Большой Камень', 'Bolsoi Kamen', 'bolsoi-kamen', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(125, 172, 46, 'Бор', 'Bor', 'bor', 1, 0, '2021-08-31 14:14:38', '2021-11-30 09:20:04'),
(126, 172, 17, 'Борзя', 'Borzya', 'borzya', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(127, 172, 14, 'Борисоглебск', 'Borisoglebsk', 'borisoglebsk', 1, 0, '2021-08-31 14:14:38', '2021-11-30 09:20:04'),
(128, 172, 47, 'Боровичи', 'Borovici', 'borovici', 1, 0, '2021-08-31 14:14:38', '2021-11-30 09:20:04'),
(129, 172, 24, 'Боровск', 'Borovsk', 'borovsk', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(130, 172, 33, 'Бородино', 'Borodino', 'borodino', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(131, 172, 20, 'Братск', 'Bratsk', 'bratsk', 1, 0, '2021-08-31 14:14:38', '2021-11-30 09:20:04'),
(132, 172, 43, 'Бронницы', 'Bronnicy''', 'bronnicy', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(133, 172, 9, 'Брянск', 'Bryansk', 'bryansk', 1, 0, '2021-08-31 14:14:38', '2021-11-30 09:20:04'),
(134, 172, 68, 'Бугульма', 'Bugulma', 'bugulma', 1, 0, '2021-08-31 14:14:38', '2021-11-30 09:20:04'),
(135, 172, 50, 'Бугуруслан', 'Buguruslan', 'buguruslan', 0, 0, '2021-08-31 14:14:38', '2021-08-31 14:14:38'),
(136, 172, 66, 'Будённовск', 'Budyonnovsk', 'budyonnovsk', 1, 0, '2021-08-31 14:14:39', '2021-11-30 09:20:04'),
(137, 172, 50, 'Бузулук', 'Buzuluk', 'buzuluk', 1, 0, '2021-08-31 14:14:39', '2021-11-30 09:20:04'),
(138, 172, 68, 'Буинск', 'Buinsk', 'buinsk', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(139, 172, 31, 'Буй', 'Bui', 'bui', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(140, 172, 15, 'Буйнакск', 'Buinaksk', 'buinaksk', 1, 0, '2021-08-31 14:14:39', '2021-11-30 09:20:04'),
(141, 172, 14, 'Бутурлиновка', 'Buturlinovka', 'buturlinovka', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(142, 172, 47, 'Валдай', 'Valdai', 'valdai', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(143, 172, 8, 'Валуйки', 'Valuiki', 'valuiki', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(144, 172, 65, 'Велиж', 'Veliz', 'veliz', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(145, 172, 55, 'Великие Луки', 'Velikie Luki', 'velikie-luki', 1, 0, '2021-08-31 14:14:39', '2021-11-30 09:20:04'),
(146, 172, 47, 'Великий Новгород', 'Velikii Novgorod', 'velikii-novgorod', 1, 0, '2021-08-31 14:14:39', '2021-11-30 09:20:04'),
(147, 172, 13, 'Великий Устюг', 'Velikii Ustyug', 'velikii-ustyug', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(148, 172, 5, 'Вельск', 'Velsk', 'velsk', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(149, 172, 71, 'Венёв', 'Venyov', 'venyov', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(150, 172, 53, 'Верещагино', 'Vereshhagino', 'vereshhagino', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(151, 172, 43, 'Верея', 'Vereya', 'vereya', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(152, 172, 79, 'Верхнеуральск', 'Verxneuralsk', 'verxneuralsk', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(153, 172, 62, 'Верхний Тагил', 'Verxnii Tagil', 'verxnii-tagil', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(154, 172, 79, 'Верхний Уфалей', 'Verxnii Ufalei', 'verxnii-ufalei', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(155, 172, 62, 'Верхняя Пышма', 'Verxnyaya Py''sma', 'verxnyaya-py-sma', 1, 0, '2021-08-31 14:14:39', '2021-11-30 09:20:04'),
(156, 172, 62, 'Верхняя Салда', 'Verxnyaya Salda', 'verxnyaya-salda', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(157, 172, 62, 'Верхняя Тура', 'Verxnyaya Tura', 'verxnyaya-tura', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(158, 172, 62, 'Верхотурье', 'Verxoture', 'verxoture', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(159, 172, 83, 'Верхоянск', 'Verxoyansk', 'verxoyansk', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(160, 172, 69, 'Весьегонск', 'Vesegonsk', 'vesegonsk', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(161, 172, 46, 'Ветлуга', 'Vetluga', 'vetluga', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(162, 172, 43, 'Видное', 'Vidnoe', 'vidnoe', 1, 0, '2021-08-31 14:14:39', '2021-11-30 09:20:04'),
(163, 172, 83, 'Вилюйск', 'Vilyuisk', 'vilyuisk', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(164, 172, 25, 'Вилючинск', 'Vilyucinsk', 'vilyucinsk', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(165, 172, 20, 'Вихоревка', 'Vixorevka', 'vixorevka', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(166, 172, 18, 'Вичуга', 'Vicuga', 'vicuga', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(167, 172, 54, 'Владивосток', 'Vladivostok', 'vladivostok', 1, 0, '2021-08-31 14:14:39', '2021-11-30 09:20:04'),
(168, 172, 64, 'Владикавказ', 'Vladikavkaz', 'vladikavkaz', 1, 0, '2021-08-31 14:14:39', '2021-11-30 09:20:04'),
(169, 172, 11, 'Владимир', 'Vladimir', 'vladimir', 1, 0, '2021-08-31 14:14:39', '2021-11-30 09:20:04'),
(170, 172, 12, 'Волгоград', 'Volgograd', 'volgograd', 1, 0, '2021-08-31 14:14:39', '2021-11-30 09:20:04'),
(171, 172, 56, 'Волгодонск', 'Volgodonsk', 'volgodonsk', 1, 0, '2021-08-31 14:14:39', '2021-11-30 09:20:04'),
(172, 172, 31, 'Волгореченск', 'Volgorecensk', 'volgorecensk', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(173, 172, 40, 'Волжск', 'Volzsk', 'volzsk', 1, 0, '2021-08-31 14:14:39', '2021-11-30 09:20:04'),
(174, 172, 12, 'Волжский', 'Volzskii', 'volzskii', 1, 0, '2021-08-31 14:14:39', '2021-11-30 09:20:04'),
(175, 172, 13, 'Вологда', 'Vologda', 'vologda', 1, 0, '2021-08-31 14:14:39', '2021-11-30 09:20:04'),
(176, 172, 46, 'Володарск', 'Volodarsk', 'volodarsk', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(177, 172, 43, 'Волоколамск', 'Volokolamsk', 'volokolamsk', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(178, 172, 37, 'Волосово', 'Volosovo', 'volosovo', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(179, 172, 37, 'Волхов', 'Volxov', 'volxov', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(180, 172, 62, 'Волчанск', 'Volcansk', 'volcansk', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(181, 172, 60, 'Вольск', 'Volsk', 'volsk', 1, 0, '2021-08-31 14:14:39', '2021-11-30 09:20:04'),
(182, 172, 30, 'Воркута', 'Vorkuta', 'vorkuta', 1, 0, '2021-08-31 14:14:39', '2021-11-30 09:20:04'),
(183, 172, 14, 'Воронеж', 'Voronez', 'voronez', 1, 0, '2021-08-31 14:14:39', '2021-11-30 09:20:04'),
(184, 172, 46, 'Ворсма', 'Vorsma', 'vorsma', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(185, 172, 43, 'Воскресенск', 'Voskresensk', 'voskresensk', 1, 0, '2021-08-31 14:14:39', '2021-11-30 09:20:04'),
(186, 172, 74, 'Воткинск', 'Votkinsk', 'votkinsk', 1, 0, '2021-08-31 14:14:39', '2021-11-30 09:20:04'),
(187, 172, 37, 'Всеволожск', 'Vsevolozsk', 'vsevolozsk', 1, 0, '2021-08-31 14:14:39', '2021-11-30 09:20:04'),
(188, 172, 30, 'Вуктыл', 'Vukty''l', 'vukty-l', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(189, 172, 37, 'Выборг', 'Vy''borg', 'vy-borg', 1, 0, '2021-08-31 14:14:39', '2021-11-30 09:20:04'),
(190, 172, 46, 'Выкса', 'Vy''ksa', 'vy-ksa', 1, 0, '2021-08-31 14:14:39', '2021-11-30 09:20:04'),
(191, 172, 43, 'Высоковск', 'Vy''sokovsk', 'vy-sokovsk', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(192, 172, 37, 'Высоцк', 'Vy''sock', 'vy-sock', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(193, 172, 13, 'Вытегра', 'Vy''tegra', 'vy-tegra', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(194, 172, 69, 'Вышний Волочёк', 'Vy''snii Volocyok', 'vy-snii-volocyok', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(195, 172, 76, 'Вяземский', 'Vyazemskii', 'vyazemskii', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(196, 172, 11, 'Вязники', 'Vyazniki', 'vyazniki', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(197, 172, 65, 'Вязьма', 'Vyazma', 'vyazma', 1, 0, '2021-08-31 14:14:39', '2021-11-30 09:20:04'),
(198, 172, 29, 'Вятские Поляны', 'Vyatskie Polyany''', 'vyatskie-polyany', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(199, 172, 18, 'Гаврилов Посад', 'Gavrilov Posad', 'gavrilov-posad', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(200, 172, 85, 'Гаврилов-Ям', 'Gavrilov-Yam', 'gavrilov-yam', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(201, 172, 65, 'Гагарин', 'Gagarin', 'gagarin', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(202, 172, 44, 'Гаджиево', 'Gadzievo', 'gadzievo', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(203, 172, 50, 'Гай', 'Gai', 'gai', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(204, 172, 31, 'Галич', 'Galic', 'galic', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(205, 172, 37, 'Гатчина', 'Gatcina', 'gatcina', 1, 0, '2021-08-31 14:14:39', '2021-11-30 09:20:04'),
(206, 172, 22, 'Гвардейск', 'Gvardeisk', 'gvardeisk', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(207, 172, 55, 'Гдов', 'Gdov', 'gdov', 0, 0, '2021-08-31 14:14:39', '2021-08-31 14:14:39'),
(208, 172, 32, 'Геленджик', 'Gelendzik', 'gelendzik', 1, 0, '2021-08-31 14:14:39', '2021-11-30 09:20:04'),
(209, 172, 66, 'Георгиевск', 'Georgievsk', 'georgievsk', 1, 0, '2021-08-31 14:14:39', '2021-11-30 09:20:04'),
(210, 172, 74, 'Глазов', 'Glazov', 'glazov', 1, 0, '2021-08-31 14:14:39', '2021-11-30 09:20:04'),
(211, 172, 43, 'Голицыно', 'Golicy''no', 'golicy-no', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(212, 172, 46, 'Горбатов', 'Gorbatov', 'gorbatov', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(213, 172, 2, 'Горно-Алтайск', 'Gorno-Altaisk', 'gorno-altaisk', 1, 0, '2021-08-31 14:14:40', '2021-11-30 09:20:04'),
(214, 172, 53, 'Горнозаводск', 'Gornozavodsk', 'gornozavodsk', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(215, 172, 3, 'Горняк', 'Gornyak', 'gornyak', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(216, 172, 46, 'Городец', 'Gorodec', 'gorodec', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(217, 172, 52, 'Городище', 'Gorodishhe', 'gorodishhe', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(218, 172, 23, 'Городовиковск', 'Gorodovikovsk', 'gorodovikovsk', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(219, 172, 11, 'Гороховец', 'Goroxovec', 'goroxovec', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(220, 172, 32, 'Горячий Ключ', 'Goryacii Klyuc', 'goryacii-klyuc', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(221, 172, 8, 'Грайворон', 'Graivoron', 'graivoron', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(222, 172, 53, 'Гремячинск', 'Gremyacinsk', 'gremyacinsk', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(223, 172, 80, 'Грозный', 'Grozny''i', 'grozny-i', 1, 0, '2021-08-31 14:14:40', '2021-11-30 09:20:04'),
(224, 172, 38, 'Грязи', 'Gryazi', 'gryazi', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(225, 172, 13, 'Грязовец', 'Gryazovec', 'gryazovec', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(226, 172, 53, 'Губаха', 'Gubaxa', 'gubaxa', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(227, 172, 8, 'Губкин', 'Gubkin', 'gubkin', 1, 0, '2021-08-31 14:14:40', '2021-11-30 09:20:04'),
(228, 172, 84, 'Губкинский', 'Gubkinskii', 'gubkinskii', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(229, 172, 80, 'Гудермес', 'Gudermes', 'gudermes', 1, 0, '2021-08-31 14:14:40', '2021-11-30 09:20:04'),
(230, 172, 56, 'Гуково', 'Gukovo', 'gukovo', 1, 0, '2021-08-31 14:14:40', '2021-11-30 09:20:04'),
(231, 172, 32, 'Гулькевичи', 'Gulkevici', 'gulkevici', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(232, 172, 22, 'Гурьевск', 'Gurevsk', 'gurevsk', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(233, 172, 28, 'Гурьевск', 'Gurevsk', 'gurevsk-2', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(234, 172, 22, 'Гусев', 'Gusev', 'gusev', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(235, 172, 10, 'Гусиноозёрск', 'Gusinoozyorsk', 'gusinoozyorsk', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(236, 172, 11, 'Гусь-Хрустальный', 'Gus-Xrustalny''i', 'gus-xrustalny-i', 1, 0, '2021-08-31 14:14:40', '2021-11-30 09:20:04'),
(237, 172, 7, 'Давлеканово', 'Davlekanovo', 'davlekanovo', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(238, 172, 15, 'Дагестанские Огни', 'Dagestanskie Ogni', 'dagestanskie-ogni', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(239, 172, 35, 'Далматово', 'Dalmatovo', 'dalmatovo', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(240, 172, 54, 'Дальнегорск', 'Dalnegorsk', 'dalnegorsk', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(241, 172, 54, 'Дальнереченск', 'Dalnerecensk', 'dalnerecensk', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(242, 172, 85, 'Данилов', 'Danilov', 'danilov', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(243, 172, 38, 'Данков', 'Dankov', 'dankov', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(244, 172, 62, 'Дегтярск', 'Degtyarsk', 'degtyarsk', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(245, 172, 43, 'Дедовск', 'Dedovsk', 'dedovsk', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(246, 172, 65, 'Демидов', 'Demidov', 'demidov', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(247, 172, 15, 'Дербент', 'Derbent', 'derbent', 1, 0, '2021-08-31 14:14:40', '2021-11-30 09:20:04'),
(248, 172, 65, 'Десногорск', 'Desnogorsk', 'desnogorsk', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(249, 172, 34, 'Джанкой', 'Dzankoi', 'dzankoi', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(250, 172, 46, 'Дзержинск', 'Dzerzinsk', 'dzerzinsk', 1, 0, '2021-08-31 14:14:40', '2021-11-30 09:20:04'),
(251, 172, 43, 'Дзержинский', 'Dzerzinskii', 'dzerzinskii', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(252, 172, 33, 'Дивногорск', 'Divnogorsk', 'divnogorsk', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(253, 172, 64, 'Дигора', 'Digora', 'digora', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(254, 172, 75, 'Димитровград', 'Dimitrovgrad', 'dimitrovgrad', 1, 0, '2021-08-31 14:14:40', '2021-11-30 09:20:04'),
(255, 172, 36, 'Дмитриев', 'Dmitriev', 'dmitriev', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(256, 172, 43, 'Дмитров', 'Dmitrov', 'dmitrov', 1, 0, '2021-08-31 14:14:40', '2021-11-30 09:20:04'),
(257, 172, 51, 'Дмитровск', 'Dmitrovsk', 'dmitrovsk', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(258, 172, 55, 'Дно', 'Dno', 'dno', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(259, 172, 53, 'Добрянка', 'Dobryanka', 'dobryanka', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(260, 172, 43, 'Долгопрудный', 'Dolgoprudny''i', 'dolgoprudny-i', 1, 0, '2021-08-31 14:14:40', '2021-11-30 09:20:04'),
(261, 172, 61, 'Долинск', 'Dolinsk', 'dolinsk', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(262, 172, 43, 'Домодедово', 'Domodedovo', 'domodedovo', 1, 0, '2021-08-31 14:14:40', '2021-11-30 09:20:04'),
(263, 172, 56, 'Донецк', 'Doneck', 'doneck', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(264, 172, 71, 'Донской', 'Donskoi', 'donskoi', 1, 0, '2021-08-31 14:14:40', '2021-11-30 09:20:04'),
(265, 172, 65, 'Дорогобуж', 'Dorogobuz', 'dorogobuz', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(266, 172, 43, 'Дрезна', 'Drezna', 'drezna', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(267, 172, 43, 'Дубна', 'Dubna', 'dubna', 1, 0, '2021-08-31 14:14:40', '2021-11-30 09:20:04'),
(268, 172, 12, 'Дубовка', 'Dubovka', 'dubovka', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(269, 172, 33, 'Дудинка', 'Dudinka', 'dudinka', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(270, 172, 65, 'Духовщина', 'Duxovshhina', 'duxovshhina', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(271, 172, 7, 'Дюртюли', 'Dyurtyuli', 'dyurtyuli', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(272, 172, 9, 'Дятьково', 'Dyatkovo', 'dyatkovo', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(273, 172, 34, 'Евпатория', 'Evpatoriya', 'evpatoriya', 1, 0, '2021-08-31 14:14:40', '2021-11-30 09:20:04'),
(274, 172, 43, 'Егорьевск', 'Egorevsk', 'egorevsk', 1, 0, '2021-08-31 14:14:40', '2021-11-30 09:20:04'),
(275, 172, 32, 'Ейск', 'Eisk', 'eisk', 1, 0, '2021-08-31 14:14:40', '2021-11-30 09:20:04'),
(276, 172, 62, 'Екатеринбург', 'Ekaterinburg', 'ekaterinburg', 1, 0, '2021-08-31 14:14:40', '2021-11-30 09:20:04'),
(277, 172, 68, 'Елабуга', 'Elabuga', 'elabuga', 1, 0, '2021-08-31 14:14:40', '2021-11-30 09:20:04'),
(278, 172, 38, 'Елец', 'Elec', 'elec', 1, 0, '2021-08-31 14:14:40', '2021-11-30 09:20:04'),
(279, 172, 25, 'Елизово', 'Elizovo', 'elizovo', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(280, 172, 65, 'Ельня', 'Elnya', 'elnya', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(281, 172, 79, 'Еманжелинск', 'Emanzelinsk', 'emanzelinsk', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(282, 172, 30, 'Емва', 'Emva', 'emva', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(283, 172, 33, 'Енисейск', 'Eniseisk', 'eniseisk', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(284, 172, 24, 'Ермолино', 'Ermolino', 'ermolino', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(285, 172, 60, 'Ершов', 'Ersov', 'ersov', 0, 0, '2021-08-31 14:14:40', '2021-08-31 14:14:40'),
(286, 172, 66, 'Ессентуки', 'Essentuki', 'essentuki', 1, 0, '2021-08-31 14:14:41', '2021-11-30 09:20:04'),
(287, 172, 71, 'Ефремов', 'Efremov', 'efremov', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(288, 172, 66, 'Железноводск', 'Zeleznovodsk', 'zeleznovodsk', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(289, 172, 20, 'Железногорск-Илимский', 'Zeleznogorsk-Ilimskii', 'zeleznogorsk-ilimskii', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(290, 172, 33, 'Железногорск', 'Zeleznogorsk', 'zeleznogorsk', 1, 0, '2021-08-31 14:14:41', '2021-11-30 09:20:04'),
(291, 172, 36, 'Железногорск', 'Zeleznogorsk', 'zeleznogorsk-2', 1, 0, '2021-08-31 14:14:41', '2021-11-30 09:20:04'),
(292, 172, 67, 'Жердевка', 'Zerdevka', 'zerdevka', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(293, 172, 58, 'Жигулёвск', 'Zigulyovsk', 'zigulyovsk', 1, 0, '2021-08-31 14:14:41', '2021-11-30 09:20:04'),
(294, 172, 24, 'Жиздра', 'Zizdra', 'zizdra', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(295, 172, 12, 'Жирновск', 'Zirnovsk', 'zirnovsk', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(296, 172, 24, 'Жуков', 'Zukov', 'zukov', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(297, 172, 9, 'Жуковка', 'Zukovka', 'zukovka', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(298, 172, 43, 'Жуковский', 'Zukovskii', 'zukovskii', 1, 0, '2021-08-31 14:14:41', '2021-11-30 09:20:04'),
(299, 172, 4, 'Завитинск', 'Zavitinsk', 'zavitinsk', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(300, 172, 73, 'Заводоуковск', 'Zavodoukovsk', 'zavodoukovsk', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(301, 172, 18, 'Заволжск', 'Zavolzsk', 'zavolzsk', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(302, 172, 46, 'Заволжье', 'Zavolze', 'zavolze', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(303, 172, 38, 'Задонск', 'Zadonsk', 'zadonsk', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(304, 172, 68, 'Заинск', 'Zainsk', 'zainsk', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(305, 172, 10, 'Закаменск', 'Zakamensk', 'zakamensk', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(306, 172, 33, 'Заозёрный', 'Zaozyorny''i', 'zaozyorny-i', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(307, 172, 44, 'Заозёрск', 'Zaozyorsk', 'zaozyorsk', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(308, 172, 69, 'Западная Двина', 'Zapadnaya Dvina', 'zapadnaya-dvina', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(309, 172, 44, 'Заполярный', 'Zapolyarny''i', 'zapolyarny-i', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(310, 172, 43, 'Зарайск', 'Zaraisk', 'zaraisk', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(311, 172, 52, 'Заречный', 'Zarecny''i', 'zarecny-i', 1, 0, '2021-08-31 14:14:41', '2021-11-30 09:20:04'),
(312, 172, 62, 'Заречный', 'Zarecny''i', 'zarecny-i-2', 1, 0, '2021-08-31 14:14:41', '2021-11-30 09:20:04'),
(313, 172, 3, 'Заринск', 'Zarinsk', 'zarinsk', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(314, 172, 40, 'Звенигово', 'Zvenigovo', 'zvenigovo', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(315, 172, 43, 'Звенигород', 'Zvenigorod', 'zvenigorod', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(316, 172, 56, 'Зверево', 'Zverevo', 'zverevo', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(317, 172, 33, 'Зеленогорск', 'Zelenogorsk', 'zelenogorsk', 1, 0, '2021-08-31 14:14:41', '2021-11-30 09:20:04'),
(318, 172, 22, 'Зеленоградск', 'Zelenogradsk', 'zelenogradsk', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(319, 172, 68, 'Зеленодольск', 'Zelenodolsk', 'zelenodolsk', 1, 0, '2021-08-31 14:14:41', '2021-11-30 09:20:04'),
(320, 172, 66, 'Зеленокумск', 'Zelenokumsk', 'zelenokumsk', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(321, 172, 56, 'Зерноград', 'Zernograd', 'zernograd', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(322, 172, 4, 'Зея', 'Zeya', 'zeya', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(323, 172, 20, 'Зима', 'Zima', 'zima', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(324, 172, 79, 'Златоуст', 'Zlatoust', 'zlatoust', 1, 0, '2021-08-31 14:14:41', '2021-11-30 09:20:04'),
(325, 172, 9, 'Злынка', 'Zly''nka', 'zly-nka', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(326, 172, 3, 'Змеиногорск', 'Zmeinogorsk', 'zmeinogorsk', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(327, 172, 6, 'Знаменск', 'Znamensk', 'znamensk', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(328, 172, 69, 'Зубцов', 'Zubcov', 'zubcov', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(329, 172, 29, 'Зуевка', 'Zuevka', 'zuevka', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(330, 172, 37, 'Ивангород', 'Ivangorod', 'ivangorod', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(331, 172, 18, 'Иваново', 'Ivanovo', 'ivanovo', 1, 0, '2021-08-31 14:14:41', '2021-11-30 09:20:04'),
(332, 172, 43, 'Ивантеевка', 'Ivanteevka', 'ivanteevka', 1, 0, '2021-08-31 14:14:41', '2021-11-30 09:20:04'),
(333, 172, 62, 'Ивдель', 'Ivdel', 'ivdel', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(334, 172, 33, 'Игарка', 'Igarka', 'igarka', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(335, 172, 74, 'Ижевск', 'Izevsk', 'izevsk', 1, 0, '2021-08-31 14:14:41', '2021-11-30 09:20:04'),
(336, 172, 15, 'Избербаш', 'Izberbas', 'izberbas', 1, 0, '2021-08-31 14:14:41', '2021-11-30 09:20:04'),
(337, 172, 66, 'Изобильный', 'Izobilny''i', 'izobilny-i', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(338, 172, 33, 'Иланский', 'Ilanskii', 'ilanskii', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(339, 172, 75, 'Инза', 'Inza', 'inza', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(340, 172, 68, 'Иннополис', 'Innopolis', 'innopolis', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(341, 172, 41, 'Инсар', 'Insar', 'insar', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(342, 172, 30, 'Инта', 'Inta', 'inta', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(343, 172, 66, 'Ипатово', 'Ipatovo', 'ipatovo', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(344, 172, 62, 'Ирбит', 'Irbit', 'irbit', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(345, 172, 20, 'Иркутск', 'Irkutsk', 'irkutsk', 1, 0, '2021-08-31 14:14:41', '2021-11-30 09:20:04'),
(346, 172, 49, 'Исилькуль', 'Isilkul', 'isilkul', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(347, 172, 48, 'Искитим', 'Iskitim', 'iskitim', 1, 0, '2021-08-31 14:14:41', '2021-11-30 09:20:04'),
(348, 172, 43, 'Истра', 'Istra', 'istra', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(349, 172, 73, 'Ишим', 'Isim', 'isim', 1, 0, '2021-08-31 14:14:41', '2021-11-30 09:20:04'),
(350, 172, 7, 'Ишимбай', 'Isimbai', 'isimbai', 1, 0, '2021-08-31 14:14:41', '2021-11-30 09:20:04'),
(351, 172, 40, 'Йошкар-Ола', 'ioskar-Ola', 'ioskar-ola', 1, 0, '2021-08-31 14:14:41', '2021-11-30 09:20:04'),
(352, 172, 13, 'Кадников', 'Kadnikov', 'kadnikov', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(353, 172, 68, 'Казань', 'Kazan', 'kazan', 1, 0, '2021-08-31 14:14:41', '2021-11-30 09:20:04'),
(354, 172, 12, 'Калач-на-Дону', 'Kalac-na-Donu', 'kalac-na-donu', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(355, 172, 14, 'Калач', 'Kalac', 'kalac', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(356, 172, 49, 'Калачинск', 'Kalacinsk', 'kalacinsk', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(357, 172, 22, 'Калининград', 'Kaliningrad', 'kaliningrad', 1, 0, '2021-08-31 14:14:41', '2021-11-30 09:20:04'),
(358, 172, 60, 'Калининск', 'Kalininsk', 'kalininsk', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(359, 172, 28, 'Калтан', 'Kaltan', 'kaltan', 0, 0, '2021-08-31 14:14:41', '2021-08-31 14:14:41'),
(360, 172, 24, 'Калуга', 'Kaluga', 'kaluga', 1, 0, '2021-08-31 14:14:41', '2021-11-30 09:20:04'),
(361, 172, 69, 'Калязин', 'Kalyazin', 'kalyazin', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(362, 172, 74, 'Камбарка', 'Kambarka', 'kambarka', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(363, 172, 52, 'Каменка', 'Kamenka', 'kamenka', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(364, 172, 37, 'Каменногорск', 'Kamennogorsk', 'kamennogorsk', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(365, 172, 62, 'Каменск-Уральский', 'Kamensk-Uralskii', 'kamensk-uralskii', 1, 0, '2021-08-31 14:14:42', '2021-11-30 09:20:04'),
(366, 172, 56, 'Каменск-Шахтинский', 'Kamensk-Saxtinskii', 'kamensk-saxtinskii', 1, 0, '2021-08-31 14:14:42', '2021-11-30 09:20:04'),
(367, 172, 3, 'Камень-на-Оби', 'Kamen-na-Obi', 'kamen-na-obi', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(368, 172, 11, 'Камешково', 'Kameskovo', 'kameskovo', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(369, 172, 6, 'Камызяк', 'Kamy''zyak', 'kamy-zyak', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(370, 172, 12, 'Камышин', 'Kamy''sin', 'kamy-sin', 1, 0, '2021-08-31 14:14:42', '2021-11-30 09:20:04'),
(371, 172, 62, 'Камышлов', 'Kamy''slov', 'kamy-slov', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(372, 172, 81, 'Канаш', 'Kanas', 'kanas', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(373, 172, 44, 'Кандалакша', 'Kandalaksa', 'kandalaksa', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(374, 172, 33, 'Канск', 'Kansk', 'kansk', 1, 0, '2021-08-31 14:14:42', '2021-11-30 09:20:04'),
(375, 172, 11, 'Карабаново', 'Karabanovo', 'karabanovo', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(376, 172, 79, 'Карабаш', 'Karabas', 'karabas', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(377, 172, 19, 'Карабулак', 'Karabulak', 'karabulak', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(378, 172, 48, 'Карасук', 'Karasuk', 'karasuk', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(379, 172, 26, 'Карачаевск', 'Karacaevsk', 'karacaevsk', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(380, 172, 9, 'Карачев', 'Karacev', 'karacev', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(381, 172, 48, 'Каргат', 'Kargat', 'kargat', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(382, 172, 5, 'Каргополь', 'Kargopol', 'kargopol', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(383, 172, 62, 'Карпинск', 'Karpinsk', 'karpinsk', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(384, 172, 79, 'Карталы', 'Kartaly''', 'kartaly', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(385, 172, 57, 'Касимов', 'Kasimov', 'kasimov', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(386, 172, 79, 'Касли', 'Kasli', 'kasli', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(387, 172, 15, 'Каспийск', 'Kaspiisk', 'kaspiisk', 1, 0, '2021-08-31 14:14:42', '2021-11-30 09:20:04'),
(388, 172, 79, 'Катав-Ивановск', 'Katav-Ivanovsk', 'katav-ivanovsk', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(389, 172, 35, 'Катайск', 'Kataisk', 'kataisk', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(390, 172, 62, 'Качканар', 'Kackanar', 'kackanar', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(391, 172, 69, 'Кашин', 'Kasin', 'kasin', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(392, 172, 43, 'Кашира', 'Kasira', 'kasira', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(393, 172, 70, 'Кедровый', 'Kedrovy''i', 'kedrovy-i', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(394, 172, 28, 'Кемерово', 'Kemerovo', 'kemerovo', 1, 0, '2021-08-31 14:14:42', '2021-11-30 09:20:04'),
(395, 172, 27, 'Кемь', 'Kem', 'kem', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(396, 172, 34, 'Керчь', 'Kerc', 'kerc', 1, 0, '2021-08-31 14:14:42', '2021-11-30 09:20:04'),
(397, 172, 53, 'Кизел', 'Kizel', 'kizel', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(398, 172, 15, 'Кизилюрт', 'Kizilyurt', 'kizilyurt', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(399, 172, 15, 'Кизляр', 'Kizlyar', 'kizlyar', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(400, 172, 71, 'Кимовск', 'Kimovsk', 'kimovsk', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(401, 172, 69, 'Кимры', 'Kimry''', 'kimry', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(402, 172, 37, 'Кингисепп', 'Kingisepp', 'kingisepp', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(403, 172, 58, 'Кинель', 'Kinel', 'kinel', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(404, 172, 18, 'Кинешма', 'Kinesma', 'kinesma', 1, 0, '2021-08-31 14:14:42', '2021-11-30 09:20:04'),
(405, 172, 71, 'Киреевск', 'Kireevsk', 'kireevsk', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(406, 172, 20, 'Киренск', 'Kirensk', 'kirensk', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(407, 172, 11, 'Киржач', 'Kirzac', 'kirzac', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(408, 172, 13, 'Кириллов', 'Kirillov', 'kirillov', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(409, 172, 37, 'Кириши', 'Kirisi', 'kirisi', 1, 0, '2021-08-31 14:14:42', '2021-11-30 09:20:04'),
(410, 172, 24, 'Киров', 'Kirov', 'kirov', 1, 0, '2021-08-31 14:14:42', '2021-11-30 09:20:04'),
(411, 172, 29, 'Киров', 'Kirov', 'kirov-2', 1, 0, '2021-08-31 14:14:42', '2021-11-30 09:20:04'),
(412, 172, 62, 'Кировград', 'Kirovgrad', 'kirovgrad', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(413, 172, 29, 'Кирово-Чепецк', 'Kirovo-Cepeck', 'kirovo-cepeck', 1, 0, '2021-08-31 14:14:42', '2021-11-30 09:20:04'),
(414, 172, 37, 'Кировск', 'Kirovsk', 'kirovsk', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(415, 172, 44, 'Кировск', 'Kirovsk', 'kirovsk-2', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(416, 172, 29, 'Кирс', 'Kirs', 'kirs', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(417, 172, 67, 'Кирсанов', 'Kirsanov', 'kirsanov', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(418, 172, 28, 'Киселёвск', 'Kiselyovsk', 'kiselyovsk', 1, 0, '2021-08-31 14:14:42', '2021-11-30 09:20:04'),
(419, 172, 66, 'Кисловодск', 'Kislovodsk', 'kislovodsk', 1, 0, '2021-08-31 14:14:42', '2021-11-30 09:20:04'),
(420, 172, 43, 'Клин', 'Klin', 'klin', 1, 0, '2021-08-31 14:14:42', '2021-11-30 09:20:04'),
(421, 172, 9, 'Клинцы', 'Klincy''', 'klincy', 1, 0, '2021-08-31 14:14:42', '2021-11-30 09:20:04'),
(422, 172, 46, 'Княгинино', 'Knyaginino', 'knyaginino', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(423, 172, 44, 'Ковдор', 'Kovdor', 'kovdor', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(424, 172, 11, 'Ковров', 'Kovrov', 'kovrov', 1, 0, '2021-08-31 14:14:42', '2021-11-30 09:20:04'),
(425, 172, 41, 'Ковылкино', 'Kovy''lkino', 'kovy-lkino', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(426, 172, 78, 'Когалым', 'Kogaly''m', 'kogaly-m', 1, 0, '2021-08-31 14:14:42', '2021-11-30 09:20:04'),
(427, 172, 33, 'Кодинск', 'Kodinsk', 'kodinsk', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(428, 172, 24, 'Козельск', 'Kozelsk', 'kozelsk', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(429, 172, 81, 'Козловка', 'Kozlovka', 'kozlovka', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(430, 172, 40, 'Козьмодемьянск', 'Kozmodemyansk', 'kozmodemyansk', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(431, 172, 44, 'Кола', 'Kola', 'kola', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(432, 172, 31, 'Кологрив', 'Kologriv', 'kologriv', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(433, 172, 43, 'Коломна', 'Kolomna', 'kolomna', 1, 0, '2021-08-31 14:14:42', '2021-11-30 09:20:04'),
(434, 172, 70, 'Колпашево', 'Kolpasevo', 'kolpasevo', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(435, 172, 11, 'Кольчугино', 'Kolcugino', 'kolcugino', 0, 0, '2021-08-31 14:14:42', '2021-08-31 14:14:42'),
(436, 172, 37, 'Коммунар', 'Kommunar', 'kommunar', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(437, 172, 76, 'Комсомольск-на-Амуре', 'Komsomolsk-na-Amure', 'komsomolsk-na-amure', 1, 0, '2021-08-31 14:14:43', '2021-11-30 09:20:04'),
(438, 172, 18, 'Комсомольск', 'Komsomolsk', 'komsomolsk', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(439, 172, 69, 'Конаково', 'Konakovo', 'konakovo', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(440, 172, 27, 'Кондопога', 'Kondopoga', 'kondopoga', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(441, 172, 24, 'Кондрово', 'Kondrovo', 'kondrovo', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(442, 172, 56, 'Константиновск', 'Konstantinovsk', 'konstantinovsk', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(443, 172, 79, 'Копейск', 'Kopeisk', 'kopeisk', 1, 0, '2021-08-31 14:14:43', '2021-11-30 09:20:04'),
(444, 172, 57, 'Кораблино', 'Korablino', 'korablino', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(445, 172, 32, 'Кореновск', 'Korenovsk', 'korenovsk', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(446, 172, 79, 'Коркино', 'Korkino', 'korkino', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(447, 172, 43, 'Королёв', 'Korolyov', 'korolyov', 1, 0, '2021-08-31 14:14:43', '2021-11-30 09:20:04'),
(448, 172, 8, 'Короча', 'Koroca', 'koroca', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(449, 172, 61, 'Корсаков', 'Korsakov', 'korsakov', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(450, 172, 5, 'Коряжма', 'Koryazma', 'koryazma', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(451, 172, 11, 'Костерёво', 'Kosteryovo', 'kosteryovo', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(452, 172, 27, 'Костомукша', 'Kostomuksa', 'kostomuksa', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(453, 172, 31, 'Кострома', 'Kostroma', 'kostroma', 1, 0, '2021-08-31 14:14:43', '2021-11-30 09:20:04'),
(454, 172, 43, 'Котельники', 'Kotelniki', 'kotelniki', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(455, 172, 12, 'Котельниково', 'Kotelnikovo', 'kotelnikovo', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(456, 172, 29, 'Котельнич', 'Kotelnic', 'kotelnic', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(457, 172, 5, 'Котлас', 'Kotlas', 'kotlas', 1, 0, '2021-08-31 14:14:43', '2021-11-30 09:20:04'),
(458, 172, 12, 'Котово', 'Kotovo', 'kotovo', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(459, 172, 67, 'Котовск', 'Kotovsk', 'kotovsk', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(460, 172, 18, 'Кохма', 'Koxma', 'koxma', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(461, 172, 13, 'Красавино', 'Krasavino', 'krasavino', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(462, 172, 43, 'Красноармейск', 'Krasnoarmeisk', 'krasnoarmeisk', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(463, 172, 60, 'Красноармейск', 'Krasnoarmeisk', 'krasnoarmeisk-2', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(464, 172, 53, 'Красновишерск', 'Krasnovisersk', 'krasnovisersk', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(465, 172, 43, 'Красногорск', 'Krasnogorsk', 'krasnogorsk', 1, 0, '2021-08-31 14:14:43', '2021-11-30 09:20:04'),
(466, 172, 32, 'Краснодар', 'Krasnodar', 'krasnodar', 1, 0, '2021-08-31 14:14:43', '2021-11-30 09:20:04'),
(467, 172, 43, 'Краснозаводск', 'Krasnozavodsk', 'krasnozavodsk', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(468, 172, 22, 'Краснознаменск', 'Krasnoznamensk', 'krasnoznamensk', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(469, 172, 43, 'Краснознаменск', 'Krasnoznamensk', 'krasnoznamensk-2', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(470, 172, 17, 'Краснокаменск', 'Krasnokamensk', 'krasnokamensk', 1, 0, '2021-08-31 14:14:43', '2021-11-30 09:20:04'),
(471, 172, 53, 'Краснокамск', 'Krasnokamsk', 'krasnokamsk', 1, 0, '2021-08-31 14:14:43', '2021-11-30 09:20:04'),
(472, 172, 34, 'Красноперекопск', 'Krasnoperekopsk', 'krasnoperekopsk', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(473, 172, 12, 'Краснослободск', 'Krasnoslobodsk', 'krasnoslobodsk', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(474, 172, 41, 'Краснослободск', 'Krasnoslobodsk', 'krasnoslobodsk-2', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(475, 172, 62, 'Краснотурьинск', 'Krasnoturinsk', 'krasnoturinsk', 1, 0, '2021-08-31 14:14:43', '2021-11-30 09:20:04'),
(476, 172, 62, 'Красноуральск', 'Krasnouralsk', 'krasnouralsk', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(477, 172, 62, 'Красноуфимск', 'Krasnoufimsk', 'krasnoufimsk', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(478, 172, 33, 'Красноярск', 'Krasnoyarsk', 'krasnoyarsk', 1, 0, '2021-08-31 14:14:43', '2021-11-30 09:20:04'),
(479, 172, 60, 'Красный Кут', 'Krasny''i Kut', 'krasny-i-kut', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(480, 172, 56, 'Красный Сулин', 'Krasny''i Sulin', 'krasny-i-sulin', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(481, 172, 69, 'Красный Холм', 'Krasny''i Xolm', 'krasny-i-xolm', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(482, 172, 24, 'Кремёнки', 'Kremyonki', 'kremyonki', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(483, 172, 32, 'Кропоткин', 'Kropotkin', 'kropotkin', 1, 0, '2021-08-31 14:14:43', '2021-11-30 09:20:04'),
(484, 172, 32, 'Крымск', 'Kry''msk', 'kry-msk', 1, 0, '2021-08-31 14:14:43', '2021-11-30 09:20:04'),
(485, 172, 46, 'Кстово', 'Kstovo', 'kstovo', 1, 0, '2021-08-31 14:14:43', '2021-11-30 09:20:04'),
(486, 172, 43, 'Кубинка', 'Kubinka', 'kubinka', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(487, 172, 50, 'Кувандык', 'Kuvandy''k', 'kuvandy-k', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(488, 172, 69, 'Кувшиново', 'Kuvsinovo', 'kuvsinovo', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(489, 172, 37, 'Кудрово', 'Kudrovo', 'kudrovo', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(490, 172, 53, 'Кудымкар', 'Kudy''mkar', 'kudy-mkar', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(491, 172, 52, 'Кузнецк', 'Kuzneck', 'kuzneck', 1, 0, '2021-08-31 14:14:43', '2021-11-30 09:20:04'),
(492, 172, 48, 'Куйбышев', 'Kuiby''sev', 'kuiby-sev', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(493, 172, 68, 'Кукмор', 'Kukmor', 'kukmor', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(494, 172, 46, 'Кулебаки', 'Kulebaki', 'kulebaki', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(495, 172, 7, 'Кумертау', 'Kumertau', 'kumertau', 1, 0, '2021-08-31 14:14:43', '2021-11-30 09:20:04'),
(496, 172, 53, 'Кунгур', 'Kungur', 'kungur', 1, 0, '2021-08-31 14:14:43', '2021-11-30 09:20:04'),
(497, 172, 48, 'Купино', 'Kupino', 'kupino', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(498, 172, 35, 'Курган', 'Kurgan', 'kurgan', 1, 0, '2021-08-31 14:14:43', '2021-11-30 09:20:04'),
(499, 172, 32, 'Курганинск', 'Kurganinsk', 'kurganinsk', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(500, 172, 61, 'Курильск', 'Kurilsk', 'kurilsk', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(501, 172, 11, 'Курлово', 'Kurlovo', 'kurlovo', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(502, 172, 43, 'Куровское', 'Kurovskoe', 'kurovskoe', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(503, 172, 36, 'Курск', 'Kursk', 'kursk', 1, 0, '2021-08-31 14:14:43', '2021-11-30 09:20:04'),
(504, 172, 35, 'Куртамыш', 'Kurtamy''s', 'kurtamy-s', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(505, 172, 80, 'Курчалой', 'Kurcaloi', 'kurcaloi', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(506, 172, 36, 'Курчатов', 'Kurcatov', 'kurcatov', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(507, 172, 79, 'Куса', 'Kusa', 'kusa', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(508, 172, 62, 'Кушва', 'Kusva', 'kusva', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(509, 172, 72, 'Кызыл', 'Ky''zy''l', 'ky-zy-l', 1, 0, '2021-08-31 14:14:43', '2021-11-30 09:20:04'),
(510, 172, 79, 'Кыштым', 'Ky''sty''m', 'ky-sty-m', 0, 0, '2021-08-31 14:14:43', '2021-08-31 14:14:43'),
(511, 172, 10, 'Кяхта', 'Kyaxta', 'kyaxta', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(512, 172, 32, 'Лабинск', 'Labinsk', 'labinsk', 1, 0, '2021-08-31 14:14:44', '2021-11-30 09:20:04'),
(513, 172, 84, 'Лабытнанги', 'Laby''tnangi', 'laby-tnangi', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(514, 172, 23, 'Лагань', 'Lagan', 'lagan', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(515, 172, 22, 'Ладушкин', 'Laduskin', 'laduskin', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(516, 172, 68, 'Лаишево', 'Laisevo', 'laisevo', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(517, 172, 11, 'Лакинск', 'Lakinsk', 'lakinsk', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(518, 172, 78, 'Лангепас', 'Langepas', 'langepas', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(519, 172, 27, 'Лахденпохья', 'Laxdenpoxya', 'laxdenpoxya', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(520, 172, 38, 'Лебедянь', 'Lebedyan', 'lebedyan', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(521, 172, 68, 'Лениногорск', 'Leninogorsk', 'leninogorsk', 1, 0, '2021-08-31 14:14:44', '2021-11-30 09:20:04'),
(522, 172, 28, 'Ленинск-Кузнецкий', 'Leninsk-Kuzneckii', 'leninsk-kuzneckii', 1, 0, '2021-08-31 14:14:44', '2021-11-30 09:20:04'),
(523, 172, 12, 'Ленинск', 'Leninsk', 'leninsk', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(524, 172, 83, 'Ленск', 'Lensk', 'lensk', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(525, 172, 66, 'Лермонтов', 'Lermontov', 'lermontov', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(526, 172, 62, 'Лесной', 'Lesnoi', 'lesnoi', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(527, 172, 54, 'Лесозаводск', 'Lesozavodsk', 'lesozavodsk', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(528, 172, 33, 'Лесосибирск', 'Lesosibirsk', 'lesosibirsk', 1, 0, '2021-08-31 14:14:44', '2021-11-30 09:20:04'),
(529, 172, 51, 'Ливны', 'Livny''', 'livny', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(530, 172, 43, 'Ликино-Дулёво', 'Likino-Dulyovo', 'likino-dulyovo', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(531, 172, 38, 'Липецк', 'Lipeck', 'lipeck', 1, 0, '2021-08-31 14:14:44', '2021-11-30 09:20:04'),
(532, 172, 71, 'Липки', 'Lipki', 'lipki', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(533, 172, 14, 'Лиски', 'Liski', 'liski', 1, 0, '2021-08-31 14:14:44', '2021-11-30 09:20:04'),
(534, 172, 69, 'Лихославль', 'Lixoslavl', 'lixoslavl', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(535, 172, 43, 'Лобня', 'Lobnya', 'lobnya', 1, 0, '2021-08-31 14:14:44', '2021-11-30 09:20:04'),
(536, 172, 37, 'Лодейное Поле', 'Lodeinoe Pole', 'lodeinoe-pole', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(537, 172, 43, 'Лосино-Петровский', 'Losino-Petrovskii', 'losino-petrovskii', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(538, 172, 37, 'Луга', 'Luga', 'luga', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(539, 172, 29, 'Луза', 'Luza', 'luza', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(540, 172, 46, 'Лукоянов', 'Lukoyanov', 'lukoyanov', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(541, 172, 43, 'Луховицы', 'Luxovicy''', 'luxovicy', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(542, 172, 46, 'Лысково', 'Ly''skovo', 'ly-skovo', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(543, 172, 53, 'Лысьва', 'Ly''sva', 'ly-sva', 1, 0, '2021-08-31 14:14:44', '2021-11-30 09:20:04'),
(544, 172, 43, 'Лыткарино', 'Ly''tkarino', 'ly-tkarino', 1, 0, '2021-08-31 14:14:44', '2021-11-30 09:20:04'),
(545, 172, 36, 'Льгов', 'Lgov', 'lgov', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(546, 172, 37, 'Любань', 'Lyuban', 'lyuban', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(547, 172, 43, 'Люберцы', 'Lyubercy''', 'lyubercy', 1, 0, '2021-08-31 14:14:44', '2021-11-30 09:20:04'),
(548, 172, 85, 'Любим', 'Lyubim', 'lyubim', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(549, 172, 24, 'Людиново', 'Lyudinovo', 'lyudinovo', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(550, 172, 78, 'Лянтор', 'Lyantor', 'lyantor', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(551, 172, 39, 'Магадан', 'Magadan', 'magadan', 1, 0, '2021-08-31 14:14:44', '2021-11-30 09:20:04'),
(552, 172, 19, 'Магас', 'Magas', 'magas', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(553, 172, 79, 'Магнитогорск', 'Magnitogorsk', 'magnitogorsk', 1, 0, '2021-08-31 14:14:44', '2021-11-30 09:20:04'),
(554, 172, 1, 'Майкоп', 'Maikop', 'maikop', 1, 0, '2021-08-31 14:14:44', '2021-11-30 09:20:04'),
(555, 172, 21, 'Майский', 'Maiskii', 'maiskii', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(556, 172, 61, 'Макаров', 'Makarov', 'makarov', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(557, 172, 31, 'Макарьев', 'Makarev', 'makarev', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(558, 172, 35, 'Макушино', 'Makusino', 'makusino', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(559, 172, 47, 'Малая Вишера', 'Malaya Visera', 'malaya-visera', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(560, 172, 19, 'Малгобек', 'Malgobek', 'malgobek', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(561, 172, 29, 'Малмыж', 'Malmy''z', 'malmy-z', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(562, 172, 51, 'Малоархангельск', 'Maloarxangelsk', 'maloarxangelsk', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(563, 172, 24, 'Малоярославец', 'Maloyaroslavec', 'maloyaroslavec', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(564, 172, 68, 'Мамадыш', 'Mamady''s', 'mamady-s', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(565, 172, 22, 'Мамоново', 'Mamonovo', 'mamonovo', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(566, 172, 31, 'Мантурово', 'Manturovo', 'manturovo', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(567, 172, 28, 'Мариинск', 'Mariinsk', 'mariinsk', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(568, 172, 81, 'Мариинский Посад', 'Mariinskii Posad', 'mariinskii-posad', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(569, 172, 60, 'Маркс', 'Marks', 'marks', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(570, 172, 15, 'Махачкала', 'Maxackala', 'maxackala', 1, 0, '2021-08-31 14:14:44', '2021-11-30 09:20:04'),
(571, 172, 9, 'Мглин', 'Mglin', 'mglin', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(572, 172, 78, 'Мегион', 'Megion', 'megion', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(573, 172, 27, 'Медвежьегорск', 'Medvezegorsk', 'medvezegorsk', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(574, 172, 50, 'Медногорск', 'Mednogorsk', 'mednogorsk', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(575, 172, 24, 'Медынь', 'Medy''n', 'medy-n', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(576, 172, 7, 'Межгорье', 'Mezgore', 'mezgore', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(577, 172, 28, 'Междуреченск', 'Mezdurecensk', 'mezdurecensk', 1, 0, '2021-08-31 14:14:44', '2021-11-30 09:20:04'),
(578, 172, 5, 'Мезень', 'Mezen', 'mezen', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(579, 172, 11, 'Меленки', 'Melenki', 'melenki', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(580, 172, 7, 'Мелеуз', 'Meleuz', 'meleuz', 1, 0, '2021-08-31 14:14:44', '2021-11-30 09:20:04'),
(581, 172, 68, 'Менделеевск', 'Mendeleevsk', 'mendeleevsk', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(582, 172, 68, 'Мензелинск', 'Menzelinsk', 'menzelinsk', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(583, 172, 24, 'Мещовск', 'Meshhovsk', 'meshhovsk', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(584, 172, 79, 'Миасс', 'Miass', 'miass', 1, 0, '2021-08-31 14:14:44', '2021-11-30 09:20:04'),
(585, 172, 30, 'Микунь', 'Mikun', 'mikun', 0, 0, '2021-08-31 14:14:44', '2021-08-31 14:14:44'),
(586, 172, 56, 'Миллерово', 'Millerovo', 'millerovo', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(587, 172, 66, 'Минеральные Воды', 'Mineralny''e Vody''', 'mineralny-e-vody', 1, 0, '2021-08-31 14:14:45', '2021-11-30 09:20:04'),
(588, 172, 33, 'Минусинск', 'Minusinsk', 'minusinsk', 1, 0, '2021-08-31 14:14:45', '2021-11-30 09:20:04'),
(589, 172, 79, 'Миньяр', 'Minyar', 'minyar', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(590, 172, 5, 'Мирный', 'Mirny''i', 'mirny-i', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(591, 172, 83, 'Мирный', 'Mirny''i', 'mirny-i-2', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(592, 172, 57, 'Михайлов', 'Mixailov', 'mixailov', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(593, 172, 12, 'Михайловка', 'Mixailovka', 'mixailovka', 1, 0, '2021-08-31 14:14:45', '2021-11-30 09:20:04'),
(594, 172, 62, 'Михайловск', 'Mixailovsk', 'mixailovsk', 1, 0, '2021-08-31 14:14:45', '2021-11-30 09:20:04'),
(595, 172, 66, 'Михайловск', 'Mixailovsk', 'mixailovsk-2', 1, 0, '2021-08-31 14:14:45', '2021-11-30 09:20:04'),
(596, 172, 67, 'Мичуринск', 'Micurinsk', 'micurinsk', 1, 0, '2021-08-31 14:14:45', '2021-11-30 09:20:04'),
(597, 172, 17, 'Могоча', 'Mogoca', 'mogoca', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(598, 172, 43, 'Можайск', 'Mozaisk', 'mozaisk', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(599, 172, 74, 'Можга', 'Mozga', 'mozga', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(600, 172, 64, 'Моздок', 'Mozdok', 'mozdok', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(601, 172, 44, 'Мончегорск', 'Moncegorsk', 'moncegorsk', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(602, 172, 56, 'Морозовск', 'Morozovsk', 'morozovsk', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(603, 172, 67, 'Моршанск', 'Morsansk', 'morsansk', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(604, 172, 24, 'Мосальск', 'Mosalsk', 'mosalsk', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(605, 172, 42, 'Москва', 'Moskva', 'moskva', 1, 1, '2021-08-31 14:14:45', '2021-11-30 09:20:04'),
(606, 172, 84, 'Муравленко', 'Muravlenko', 'muravlenko', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(607, 172, 29, 'Мураши', 'Murasi', 'murasi', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(608, 172, 37, 'Мурино', 'Murino', 'murino', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(609, 172, 44, 'Мурманск', 'Murmansk', 'murmansk', 1, 0, '2021-08-31 14:14:45', '2021-11-30 09:20:04'),
(610, 172, 11, 'Муром', 'Murom', 'murom', 1, 0, '2021-08-31 14:14:45', '2021-11-30 09:20:04'),
(611, 172, 51, 'Мценск', 'Mcensk', 'mcensk', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(612, 172, 28, 'Мыски', 'My''ski', 'my-ski', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(613, 172, 43, 'Мытищи', 'My''tishhi', 'my-tishhi', 1, 0, '2021-08-31 14:14:45', '2021-11-30 09:20:04'),
(614, 172, 85, 'Мышкин', 'My''skin', 'my-skin', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(615, 172, 68, 'Набережные Челны', 'Naberezny''e Celny''', 'naberezny-e-celny', 1, 0, '2021-08-31 14:14:45', '2021-11-30 09:20:04'),
(616, 172, 46, 'Навашино', 'Navasino', 'navasino', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(617, 172, 18, 'Наволоки', 'Navoloki', 'navoloki', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(618, 172, 84, 'Надым', 'Nady''m', 'nady-m', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(619, 172, 33, 'Назарово', 'Nazarovo', 'nazarovo', 1, 0, '2021-08-31 14:14:45', '2021-11-30 09:20:04'),
(620, 172, 19, 'Назрань', 'Nazran', 'nazran', 1, 0, '2021-08-31 14:14:45', '2021-11-30 09:20:04'),
(621, 172, 49, 'Называевск', 'Nazy''vaevsk', 'nazy-vaevsk', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(622, 172, 21, 'Нальчик', 'Nalcik', 'nalcik', 1, 0, '2021-08-31 14:14:45', '2021-11-30 09:20:04'),
(623, 172, 6, 'Нариманов', 'Narimanov', 'narimanov', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(624, 172, 43, 'Наро-Фоминск', 'Naro-Fominsk', 'naro-fominsk', 1, 0, '2021-08-31 14:14:45', '2021-11-30 09:20:04'),
(625, 172, 21, 'Нарткала', 'Nartkala', 'nartkala', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(626, 172, 45, 'Нарьян-Мар', 'Naryan-Mar', 'naryan-mar', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(627, 172, 54, 'Находка', 'Naxodka', 'naxodka', 1, 0, '2021-08-31 14:14:45', '2021-11-30 09:20:04'),
(628, 172, 55, 'Невель', 'Nevel', 'nevel', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(629, 172, 61, 'Невельск', 'Nevelsk', 'nevelsk', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(630, 172, 66, 'Невинномысск', 'Nevinnomy''ssk', 'nevinnomy-ssk', 1, 0, '2021-08-31 14:14:45', '2021-11-30 09:20:04'),
(631, 172, 62, 'Невьянск', 'Nevyansk', 'nevyansk', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(632, 172, 69, 'Нелидово', 'Nelidovo', 'nelidovo', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(633, 172, 22, 'Неман', 'Neman', 'neman', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(634, 172, 31, 'Нерехта', 'Nerexta', 'nerexta', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(635, 172, 17, 'Нерчинск', 'Nercinsk', 'nercinsk', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(636, 172, 83, 'Нерюнгри', 'Neryungri', 'neryungri', 1, 0, '2021-08-31 14:14:45', '2021-11-30 09:20:04'),
(637, 172, 22, 'Нестеров', 'Nesterov', 'nesterov', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(638, 172, 58, 'Нефтегорск', 'Neftegorsk', 'neftegorsk', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(639, 172, 7, 'Нефтекамск', 'Neftekamsk', 'neftekamsk', 1, 0, '2021-08-31 14:14:45', '2021-11-30 09:20:04'),
(640, 172, 66, 'Нефтекумск', 'Neftekumsk', 'neftekumsk', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(641, 172, 78, 'Нефтеюганск', 'Nefteyugansk', 'nefteyugansk', 1, 0, '2021-08-31 14:14:45', '2021-11-30 09:20:04'),
(642, 172, 31, 'Нея', 'Neya', 'neya', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(643, 172, 78, 'Нижневартовск', 'Niznevartovsk', 'niznevartovsk', 1, 0, '2021-08-31 14:14:45', '2021-11-30 09:20:04'),
(644, 172, 68, 'Нижнекамск', 'Niznekamsk', 'niznekamsk', 1, 0, '2021-08-31 14:14:45', '2021-11-30 09:20:04'),
(645, 172, 20, 'Нижнеудинск', 'Nizneudinsk', 'nizneudinsk', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(646, 172, 62, 'Нижние Серги', 'Niznie Sergi', 'niznie-sergi', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(647, 172, 52, 'Нижний Ломов', 'Niznii Lomov', 'niznii-lomov', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(648, 172, 46, 'Нижний Новгород', 'Niznii Novgorod', 'niznii-novgorod', 1, 0, '2021-08-31 14:14:45', '2021-11-30 09:20:05'),
(649, 172, 62, 'Нижний Тагил', 'Niznii Tagil', 'niznii-tagil', 1, 0, '2021-08-31 14:14:45', '2021-11-30 09:20:05'),
(650, 172, 62, 'Нижняя Салда', 'Niznyaya Salda', 'niznyaya-salda', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(651, 172, 62, 'Нижняя Тура', 'Niznyaya Tura', 'niznyaya-tura', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(652, 172, 76, 'Николаевск-на-Амуре', 'Nikolaevsk-na-Amure', 'nikolaevsk-na-amure', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(653, 172, 12, 'Николаевск', 'Nikolaevsk', 'nikolaevsk', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(654, 172, 13, 'Никольск', 'Nikolsk', 'nikolsk', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(655, 172, 52, 'Никольск', 'Nikolsk', 'nikolsk-2', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(656, 172, 37, 'Никольское', 'Nikolskoe', 'nikolskoe', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(657, 172, 37, 'Новая Ладога', 'Novaya Ladoga', 'novaya-ladoga', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(658, 172, 62, 'Новая Ляля', 'Novaya Lyalya', 'novaya-lyalya', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(659, 172, 66, 'Новоалександровск', 'Novoaleksandrovsk', 'novoaleksandrovsk', 0, 0, '2021-08-31 14:14:45', '2021-08-31 14:14:45'),
(660, 172, 3, 'Новоалтайск', 'Novoaltaisk', 'novoaltaisk', 1, 0, '2021-08-31 14:14:46', '2021-11-30 09:20:05'),
(661, 172, 12, 'Новоаннинский', 'Novoanninskii', 'novoanninskii', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(662, 172, 14, 'Нововоронеж', 'Novovoronez', 'novovoronez', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(663, 172, 5, 'Новодвинск', 'Novodvinsk', 'novodvinsk', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(664, 172, 9, 'Новозыбков', 'Novozy''bkov', 'novozy-bkov', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(665, 172, 32, 'Новокубанск', 'Novokubansk', 'novokubansk', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(666, 172, 28, 'Новокузнецк', 'Novokuzneck', 'novokuzneck', 1, 0, '2021-08-31 14:14:46', '2021-11-30 09:20:05'),
(667, 172, 58, 'Новокуйбышевск', 'Novokuiby''sevsk', 'novokuiby-sevsk', 1, 0, '2021-08-31 14:14:46', '2021-11-30 09:20:05'),
(668, 172, 57, 'Новомичуринск', 'Novomicurinsk', 'novomicurinsk', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(669, 172, 71, 'Новомосковск', 'Novomoskovsk', 'novomoskovsk', 1, 0, '2021-08-31 14:14:46', '2021-11-30 09:20:05'),
(670, 172, 66, 'Новопавловск', 'Novopavlovsk', 'novopavlovsk', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(671, 172, 55, 'Новоржев', 'Novorzev', 'novorzev', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(672, 172, 32, 'Новороссийск', 'Novorossiisk', 'novorossiisk', 1, 0, '2021-08-31 14:14:46', '2021-11-30 09:20:05'),
(673, 172, 48, 'Новосибирск', 'Novosibirsk', 'novosibirsk', 1, 0, '2021-08-31 14:14:46', '2021-11-30 09:20:05'),
(674, 172, 51, 'Новосиль', 'Novosil', 'novosil', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(675, 172, 55, 'Новосокольники', 'Novosokolniki', 'novosokolniki', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(676, 172, 50, 'Новотроицк', 'Novotroick', 'novotroick', 1, 0, '2021-08-31 14:14:46', '2021-11-30 09:20:05'),
(677, 172, 60, 'Новоузенск', 'Novouzensk', 'novouzensk', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(678, 172, 75, 'Новоульяновск', 'Novoulyanovsk', 'novoulyanovsk', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(679, 172, 62, 'Новоуральск', 'Novouralsk', 'novouralsk', 1, 0, '2021-08-31 14:14:46', '2021-11-30 09:20:05'),
(680, 172, 14, 'Новохопёрск', 'Novoxopyorsk', 'novoxopyorsk', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(681, 172, 81, 'Новочебоксарск', 'Novoceboksarsk', 'novoceboksarsk', 1, 0, '2021-08-31 14:14:46', '2021-11-30 09:20:05'),
(682, 172, 56, 'Новочеркасск', 'Novocerkassk', 'novocerkassk', 1, 0, '2021-08-31 14:14:46', '2021-11-30 09:20:05'),
(683, 172, 56, 'Новошахтинск', 'Novosaxtinsk', 'novosaxtinsk', 1, 0, '2021-08-31 14:14:46', '2021-11-30 09:20:05'),
(684, 172, 8, 'Новый Оскол', 'Novy''i Oskol', 'novy-i-oskol', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(685, 172, 84, 'Новый Уренгой', 'Novy''i Urengoi', 'novy-i-urengoi', 1, 0, '2021-08-31 14:14:46', '2021-11-30 09:20:05'),
(686, 172, 43, 'Ногинск', 'Noginsk', 'noginsk', 1, 0, '2021-08-31 14:14:46', '2021-11-30 09:20:05'),
(687, 172, 29, 'Нолинск', 'Nolinsk', 'nolinsk', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(688, 172, 33, 'Норильск', 'Norilsk', 'norilsk', 1, 0, '2021-08-31 14:14:46', '2021-11-30 09:20:05'),
(689, 172, 84, 'Ноябрьск', 'Noyabrsk', 'noyabrsk', 1, 0, '2021-08-31 14:14:46', '2021-11-30 09:20:05'),
(690, 172, 68, 'Нурлат', 'Nurlat', 'nurlat', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(691, 172, 53, 'Нытва', 'Ny''tva', 'ny-tva', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(692, 172, 83, 'Нюрба', 'Nyurba', 'nyurba', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(693, 172, 78, 'Нягань', 'Nyagan', 'nyagan', 1, 0, '2021-08-31 14:14:46', '2021-11-30 09:20:05'),
(694, 172, 79, 'Нязепетровск', 'Nyazepetrovsk', 'nyazepetrovsk', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(695, 172, 5, 'Няндома', 'Nyandoma', 'nyandoma', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(696, 172, 16, 'Облучье', 'Obluce', 'obluce', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(697, 172, 24, 'Обнинск', 'Obninsk', 'obninsk', 1, 0, '2021-08-31 14:14:46', '2021-11-30 09:20:05'),
(698, 172, 36, 'Обоянь', 'Oboyan', 'oboyan', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(699, 172, 48, 'Обь', 'Ob', 'ob', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(700, 172, 43, 'Одинцово', 'Odincovo', 'odincovo', 1, 0, '2021-08-31 14:14:46', '2021-11-30 09:20:05'),
(701, 172, 22, 'Озёрск', 'Ozyorsk', 'ozyorsk', 1, 0, '2021-08-31 14:14:46', '2021-11-30 09:20:05'),
(702, 172, 79, 'Озёрск', 'Ozyorsk', 'ozyorsk-2', 1, 0, '2021-08-31 14:14:46', '2021-11-30 09:20:05'),
(703, 172, 43, 'Озёры', 'Ozyory''', 'ozyory', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(704, 172, 58, 'Октябрьск', 'Oktyabrsk', 'oktyabrsk', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(705, 172, 7, 'Октябрьский', 'Oktyabrskii', 'oktyabrskii', 1, 0, '2021-08-31 14:14:46', '2021-11-30 09:20:05'),
(706, 172, 47, 'Окуловка', 'Okulovka', 'okulovka', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(707, 172, 44, 'Оленегорск', 'Olenegorsk', 'olenegorsk', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(708, 172, 27, 'Олонец', 'Olonec', 'olonec', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(709, 172, 83, 'Олёкминск', 'Olyokminsk', 'olyokminsk', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(710, 172, 49, 'Омск', 'Omsk', 'omsk', 1, 0, '2021-08-31 14:14:46', '2021-11-30 09:20:05'),
(711, 172, 29, 'Омутнинск', 'Omutninsk', 'omutninsk', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(712, 172, 5, 'Онега', 'Onega', 'onega', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(713, 172, 55, 'Опочка', 'Opocka', 'opocka', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(714, 172, 50, 'Оренбург', 'Orenburg', 'orenburg', 1, 0, '2021-08-31 14:14:46', '2021-11-30 09:20:05'),
(715, 172, 43, 'Орехово-Зуево', 'Orexovo-Zuevo', 'orexovo-zuevo', 1, 0, '2021-08-31 14:14:46', '2021-11-30 09:20:05'),
(716, 172, 29, 'Орлов', 'Orlov', 'orlov', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(717, 172, 50, 'Орск', 'Orsk', 'orsk', 1, 0, '2021-08-31 14:14:46', '2021-11-30 09:20:05'),
(718, 172, 51, 'Орёл', 'Oryol', 'oryol', 1, 0, '2021-08-31 14:14:46', '2021-11-30 09:20:05'),
(719, 172, 53, 'Оса', 'Osa', 'osa', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(720, 172, 28, 'Осинники', 'Osinniki', 'osinniki', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(721, 172, 69, 'Осташков', 'Ostaskov', 'ostaskov', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(722, 172, 55, 'Остров', 'Ostrov', 'ostrov', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(723, 172, 44, 'Островной', 'Ostrovnoi', 'ostrovnoi', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(724, 172, 14, 'Острогожск', 'Ostrogozsk', 'ostrogozsk', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(725, 172, 37, 'Отрадное', 'Otradnoe', 'otradnoe', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(726, 172, 58, 'Отрадный', 'Otradny''i', 'otradny-i', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(727, 172, 61, 'Оха', 'Oxa', 'oxa', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(728, 172, 53, 'Оханск', 'Oxansk', 'oxansk', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(729, 172, 53, 'Очёр', 'Ocyor', 'ocyor', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(730, 172, 46, 'Павлово', 'Pavlovo', 'pavlovo', 1, 0, '2021-08-31 14:14:46', '2021-11-30 09:20:05'),
(731, 172, 14, 'Павловск', 'Pavlovsk', 'pavlovsk', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(732, 172, 43, 'Павловский Посад', 'Pavlovskii Posad', 'pavlovskii-posad', 1, 0, '2021-08-31 14:14:46', '2021-11-30 09:20:05'),
(733, 172, 12, 'Палласовка', 'Pallasovka', 'pallasovka', 0, 0, '2021-08-31 14:14:46', '2021-08-31 14:14:46'),
(734, 172, 54, 'Партизанск', 'Partizansk', 'partizansk', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(735, 172, 82, 'Певек', 'Pevek', 'pevek', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(736, 172, 52, 'Пенза', 'Penza', 'penza', 1, 0, '2021-08-31 14:14:47', '2021-11-30 09:20:05'),
(737, 172, 46, 'Первомайск', 'Pervomaisk', 'pervomaisk', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(738, 172, 62, 'Первоуральск', 'Pervouralsk', 'pervouralsk', 1, 0, '2021-08-31 14:14:47', '2021-11-30 09:20:05'),
(739, 172, 46, 'Перевоз', 'Perevoz', 'perevoz', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(740, 172, 43, 'Пересвет', 'Peresvet', 'peresvet', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(741, 172, 85, 'Переславль-Залесский', 'Pereslavl-Zalesskii', 'pereslavl-zalesskii', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(742, 172, 53, 'Пермь', 'Perm', 'perm', 1, 0, '2021-08-31 14:14:47', '2021-11-30 09:20:05'),
(743, 172, 47, 'Пестово', 'Pestovo', 'pestovo', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(744, 172, 12, 'Петров Вал', 'Petrov Val', 'petrov-val', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(745, 172, 17, 'Петровск-Забайкальский', 'Petrovsk-Zabaikalskii', 'petrovsk-zabaikalskii', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(746, 172, 60, 'Петровск', 'Petrovsk', 'petrovsk', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(747, 172, 27, 'Петрозаводск', 'Petrozavodsk', 'petrozavodsk', 1, 0, '2021-08-31 14:14:47', '2021-11-30 09:20:05'),
(748, 172, 25, 'Петропавловск-Камчатский', 'Petropavlovsk-Kamcatskii', 'petropavlovsk-kamcatskii', 1, 0, '2021-08-31 14:14:47', '2021-11-30 09:20:05'),
(749, 172, 35, 'Петухово', 'Petuxovo', 'petuxovo', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(750, 172, 11, 'Петушки', 'Petuski', 'petuski', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(751, 172, 30, 'Печора', 'Pecora', 'pecora', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(752, 172, 55, 'Печоры', 'Pecory''', 'pecory', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(753, 172, 37, 'Пикалёво', 'Pikalyovo', 'pikalyovo', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(754, 172, 22, 'Пионерский', 'Pionerskii', 'pionerskii', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(755, 172, 27, 'Питкяранта', 'Pitkyaranta', 'pitkyaranta', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(756, 172, 71, 'Плавск', 'Plavsk', 'plavsk', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(757, 172, 79, 'Пласт', 'Plast', 'plast', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(758, 172, 18, 'Плёс', 'Plyos', 'plyos', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(759, 172, 14, 'Поворино', 'Povorino', 'povorino', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(760, 172, 43, 'Подольск', 'Podolsk', 'podolsk', 1, 0, '2021-08-31 14:14:47', '2021-11-30 09:20:05'),
(761, 172, 37, 'Подпорожье', 'Podporoze', 'podporoze', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(762, 172, 78, 'Покачи', 'Pokaci', 'pokaci', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(763, 172, 11, 'Покров', 'Pokrov', 'pokrov', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(764, 172, 83, 'Покровск', 'Pokrovsk', 'pokrovsk', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(765, 172, 62, 'Полевской', 'Polevskoi', 'polevskoi', 1, 0, '2021-08-31 14:14:47', '2021-11-30 09:20:05'),
(766, 172, 22, 'Полесск', 'Polessk', 'polessk', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(767, 172, 28, 'Полысаево', 'Poly''saevo', 'poly-saevo', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(768, 172, 44, 'Полярные Зори', 'Polyarny''e Zori', 'polyarny-e-zori', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(769, 172, 44, 'Полярный', 'Polyarny''i', 'polyarny-i', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(770, 172, 61, 'Поронайск', 'Poronaisk', 'poronaisk', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(771, 172, 55, 'Порхов', 'Porxov', 'porxov', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(772, 172, 58, 'Похвистнево', 'Poxvistnevo', 'poxvistnevo', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(773, 172, 9, 'Почеп', 'Pocep', 'pocep', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(774, 172, 65, 'Починок', 'Pocinok', 'pocinok', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(775, 172, 85, 'Пошехонье', 'Posexone', 'posexone', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(776, 172, 22, 'Правдинск', 'Pravdinsk', 'pravdinsk', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(777, 172, 18, 'Приволжск', 'Privolzsk', 'privolzsk', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(778, 172, 22, 'Приморск', 'Primorsk', 'primorsk', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(779, 172, 37, 'Приморск', 'Primorsk', 'primorsk-2', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(780, 172, 32, 'Приморско-Ахтарск', 'Primorsko-Axtarsk', 'primorsko-axtarsk', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(781, 172, 37, 'Приозерск', 'Priozersk', 'priozersk', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(782, 172, 28, 'Прокопьевск', 'Prokopevsk', 'prokopevsk', 1, 0, '2021-08-31 14:14:47', '2021-11-30 09:20:05'),
(783, 172, 56, 'Пролетарск', 'Proletarsk', 'proletarsk', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(784, 172, 43, 'Протвино', 'Protvino', 'protvino', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(785, 172, 21, 'Прохладный', 'Proxladny''i', 'proxladny-i', 1, 0, '2021-08-31 14:14:47', '2021-11-30 09:20:05'),
(786, 172, 55, 'Псков', 'Pskov', 'pskov', 1, 0, '2021-08-31 14:14:47', '2021-11-30 09:20:05'),
(787, 172, 60, 'Пугачёв', 'Pugacyov', 'pugacyov', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(788, 172, 27, 'Пудож', 'Pudoz', 'pudoz', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(789, 172, 55, 'Пустошка', 'Pustoska', 'pustoska', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(790, 172, 18, 'Пучеж', 'Pucez', 'pucez', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(791, 172, 43, 'Пушкино', 'Puskino', 'puskino', 1, 0, '2021-08-31 14:14:47', '2021-11-30 09:20:05'),
(792, 172, 43, 'Пущино', 'Pushhino', 'pushhino', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(793, 172, 55, 'Пыталово', 'Py''talovo', 'py-talovo', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(794, 172, 78, 'Пыть-Ях', 'Py''t-Yax', 'py-t-yax', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(795, 172, 66, 'Пятигорск', 'Pyatigorsk', 'pyatigorsk', 1, 0, '2021-08-31 14:14:47', '2021-11-30 09:20:05'),
(796, 172, 11, 'Радужный', 'Raduzny''i', 'raduzny-i', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(797, 172, 78, 'Радужный', 'Raduzny''i', 'raduzny-i-2', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(798, 172, 4, 'Райчихинск', 'Raicixinsk', 'raicixinsk', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(799, 172, 43, 'Раменское', 'Ramenskoe', 'ramenskoe', 1, 0, '2021-08-31 14:14:47', '2021-11-30 09:20:05'),
(800, 172, 67, 'Рассказово', 'Rasskazovo', 'rasskazovo', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(801, 172, 62, 'Ревда', 'Revda', 'revda', 1, 0, '2021-08-31 14:14:47', '2021-11-30 09:20:05'),
(802, 172, 62, 'Реж', 'Rez', 'rez', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(803, 172, 43, 'Реутов', 'Reutov', 'reutov', 1, 0, '2021-08-31 14:14:47', '2021-11-30 09:20:05'),
(804, 172, 69, 'Ржев', 'Rzev', 'rzev', 1, 0, '2021-08-31 14:14:47', '2021-11-30 09:20:05'),
(805, 172, 18, 'Родники', 'Rodniki', 'rodniki', 0, 0, '2021-08-31 14:14:47', '2021-08-31 14:14:47'),
(806, 172, 65, 'Рославль', 'Roslavl', 'roslavl', 1, 0, '2021-08-31 14:14:47', '2021-11-30 09:20:05'),
(807, 172, 14, 'Россошь', 'Rossos', 'rossos', 1, 0, '2021-08-31 14:14:47', '2021-11-30 09:20:05'),
(808, 172, 56, 'Ростов-на-Дону', 'Rostov-na-Donu', 'rostov-na-donu', 1, 0, '2021-08-31 14:14:48', '2021-11-30 09:20:05'),
(809, 172, 85, 'Ростов', 'Rostov', 'rostov', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(810, 172, 43, 'Рошаль', 'Rosal', 'rosal', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(811, 172, 60, 'Ртищево', 'Rtishhevo', 'rtishhevo', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(812, 172, 3, 'Рубцовск', 'Rubcovsk', 'rubcovsk', 1, 0, '2021-08-31 14:14:48', '2021-11-30 09:20:05'),
(813, 172, 65, 'Рудня', 'Rudnya', 'rudnya', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(814, 172, 43, 'Руза', 'Ruza', 'ruza', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(815, 172, 41, 'Рузаевка', 'Ruzaevka', 'ruzaevka', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(816, 172, 85, 'Рыбинск', 'Ry''binsk', 'ry-binsk', 1, 0, '2021-08-31 14:14:48', '2021-11-30 09:20:05'),
(817, 172, 57, 'Рыбное', 'Ry''bnoe', 'ry-bnoe', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(818, 172, 36, 'Рыльск', 'Ry''lsk', 'ry-lsk', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(819, 172, 57, 'Ряжск', 'Ryazsk', 'ryazsk', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(820, 172, 57, 'Рязань', 'Ryazan', 'ryazan', 1, 0, '2021-08-31 14:14:48', '2021-11-30 09:20:05'),
(821, 172, 34, 'Саки', 'Saki', 'saki', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(822, 172, 7, 'Салават', 'Salavat', 'salavat', 1, 0, '2021-08-31 14:14:48', '2021-11-30 09:20:05'),
(823, 172, 28, 'Салаир', 'Salair', 'salair', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(824, 172, 84, 'Салехард', 'Salexard', 'salexard', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(825, 172, 56, 'Сальск', 'Salsk', 'salsk', 1, 0, '2021-08-31 14:14:48', '2021-11-30 09:20:05'),
(826, 172, 58, 'Самара', 'Samara', 'samara', 1, 0, '2021-08-31 14:14:48', '2021-11-30 09:20:05'),
(827, 172, 59, 'Санкт-Петербург', 'Sankt-Peterburg', 'sankt-peterburg', 1, 1, '2021-08-31 14:14:48', '2021-11-30 09:20:05'),
(828, 172, 41, 'Саранск', 'Saransk', 'saransk', 1, 0, '2021-08-31 14:14:48', '2021-11-30 09:20:05'),
(829, 172, 74, 'Сарапул', 'Sarapul', 'sarapul', 1, 0, '2021-08-31 14:14:48', '2021-11-30 09:20:05'),
(830, 172, 60, 'Саратов', 'Saratov', 'saratov', 1, 0, '2021-08-31 14:14:48', '2021-11-30 09:20:05'),
(831, 172, 46, 'Саров', 'Sarov', 'sarov', 1, 0, '2021-08-31 14:14:48', '2021-11-30 09:20:05'),
(832, 172, 57, 'Сасово', 'Sasovo', 'sasovo', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(833, 172, 79, 'Сатка', 'Satka', 'satka', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(834, 172, 65, 'Сафоново', 'Safonovo', 'safonovo', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(835, 172, 77, 'Саяногорск', 'Sayanogorsk', 'sayanogorsk', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(836, 172, 20, 'Саянск', 'Sayansk', 'sayansk', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(837, 172, 22, 'Светлогорск', 'Svetlogorsk', 'svetlogorsk', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(838, 172, 66, 'Светлоград', 'Svetlograd', 'svetlograd', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(839, 172, 22, 'Светлый', 'Svetly''i', 'svetly-i', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(840, 172, 37, 'Светогорск', 'Svetogorsk', 'svetogorsk', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(841, 172, 20, 'Свирск', 'Svirsk', 'svirsk', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(842, 172, 4, 'Свободный', 'Svobodny''i', 'svobodny-i', 1, 0, '2021-08-31 14:14:48', '2021-11-30 09:20:05'),
(843, 172, 55, 'Себеж', 'Sebez', 'sebez', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(844, 172, 63, 'Севастополь', 'Sevastopol', 'sevastopol', 1, 0, '2021-08-31 14:14:48', '2021-11-30 09:20:05'),
(845, 172, 61, 'Северо-Курильск', 'Severo-Kurilsk', 'severo-kurilsk', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(846, 172, 10, 'Северобайкальск', 'Severobaikalsk', 'severobaikalsk', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(847, 172, 5, 'Северодвинск', 'Severodvinsk', 'severodvinsk', 1, 0, '2021-08-31 14:14:48', '2021-11-30 09:20:05'),
(848, 172, 44, 'Североморск', 'Severomorsk', 'severomorsk', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(849, 172, 62, 'Североуральск', 'Severouralsk', 'severouralsk', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(850, 172, 70, 'Северск', 'Seversk', 'seversk', 1, 0, '2021-08-31 14:14:48', '2021-11-30 09:20:05'),
(851, 172, 9, 'Севск', 'Sevsk', 'sevsk', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(852, 172, 27, 'Сегежа', 'Segeza', 'segeza', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(853, 172, 9, 'Сельцо', 'Selco', 'selco', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(854, 172, 56, 'Семикаракорск', 'Semikarakorsk', 'semikarakorsk', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(855, 172, 14, 'Семилуки', 'Semiluki', 'semiluki', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(856, 172, 46, 'Семёнов', 'Semyonov', 'semyonov', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(857, 172, 75, 'Сенгилей', 'Sengilei', 'sengilei', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(858, 172, 12, 'Серафимович', 'Serafimovic', 'serafimovic', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(859, 172, 46, 'Сергач', 'Sergac', 'sergac', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(860, 172, 43, 'Сергиев Посад', 'Sergiev Posad', 'sergiev-posad', 1, 0, '2021-08-31 14:14:48', '2021-11-30 09:20:05'),
(861, 172, 52, 'Сердобск', 'Serdobsk', 'serdobsk', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(862, 172, 62, 'Серов', 'Serov', 'serov', 1, 0, '2021-08-31 14:14:48', '2021-11-30 09:20:05'),
(863, 172, 43, 'Серпухов', 'Serpuxov', 'serpuxov', 1, 0, '2021-08-31 14:14:48', '2021-11-30 09:20:05'),
(864, 172, 37, 'Сертолово', 'Sertolovo', 'sertolovo', 1, 0, '2021-08-31 14:14:48', '2021-11-30 09:20:05'),
(865, 172, 7, 'Сибай', 'Sibai', 'sibai', 1, 0, '2021-08-31 14:14:48', '2021-11-30 09:20:05'),
(866, 172, 79, 'Сим', 'Sim', 'sim', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(867, 172, 34, 'Симферополь', 'Simferopol', 'simferopol', 1, 0, '2021-08-31 14:14:48', '2021-11-30 09:20:05'),
(868, 172, 4, 'Сковородино', 'Skovorodino', 'skovorodino', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(869, 172, 57, 'Скопин', 'Skopin', 'skopin', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(870, 172, 3, 'Славгород', 'Slavgorod', 'slavgorod', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(871, 172, 22, 'Славск', 'Slavsk', 'slavsk', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(872, 172, 32, 'Славянск-на-Кубани', 'Slavyansk-na-Kubani', 'slavyansk-na-kubani', 1, 0, '2021-08-31 14:14:48', '2021-11-30 09:20:05'),
(873, 172, 37, 'Сланцы', 'Slancy''', 'slancy', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(874, 172, 29, 'Слободской', 'Slobodskoi', 'slobodskoi', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(875, 172, 20, 'Слюдянка', 'Slyudyanka', 'slyudyanka', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(876, 172, 65, 'Смоленск', 'Smolensk', 'smolensk', 1, 0, '2021-08-31 14:14:48', '2021-11-30 09:20:05'),
(877, 172, 79, 'Снежинск', 'Snezinsk', 'snezinsk', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(878, 172, 44, 'Снежногорск', 'Sneznogorsk', 'sneznogorsk', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(879, 172, 11, 'Собинка', 'Sobinka', 'sobinka', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(880, 172, 22, 'Советск', 'Sovetsk', 'sovetsk', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(881, 172, 29, 'Советск', 'Sovetsk', 'sovetsk-2', 0, 0, '2021-08-31 14:14:48', '2021-08-31 14:14:48'),
(882, 172, 71, 'Советск', 'Sovetsk', 'sovetsk-3', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(883, 172, 76, 'Советская Гавань', 'Sovetskaya Gavan', 'sovetskaya-gavan', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(884, 172, 78, 'Советский', 'Sovetskii', 'sovetskii', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(885, 172, 13, 'Сокол', 'Sokol', 'sokol', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(886, 172, 31, 'Солигалич', 'Soligalic', 'soligalic', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(887, 172, 53, 'Соликамск', 'Solikamsk', 'solikamsk', 1, 0, '2021-08-31 14:14:49', '2021-11-30 09:20:05'),
(888, 172, 43, 'Солнечногорск', 'Solnecnogorsk', 'solnecnogorsk', 1, 0, '2021-08-31 14:14:49', '2021-11-30 09:20:05'),
(889, 172, 50, 'Соль-Илецк', 'Sol-Ileck', 'sol-ileck', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(890, 172, 5, 'Сольвычегодск', 'Solvy''cegodsk', 'solvy-cegodsk', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(891, 172, 47, 'Сольцы', 'Solcy''', 'solcy', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(892, 172, 50, 'Сорочинск', 'Sorocinsk', 'sorocinsk', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(893, 172, 77, 'Сорск', 'Sorsk', 'sorsk', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(894, 172, 27, 'Сортавала', 'Sortavala', 'sortavala', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(895, 172, 24, 'Сосенский', 'Sosenskii', 'sosenskii', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(896, 172, 29, 'Сосновка', 'Sosnovka', 'sosnovka', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(897, 172, 33, 'Сосновоборск', 'Sosnovoborsk', 'sosnovoborsk', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(898, 172, 37, 'Сосновый Бор', 'Sosnovy''i Bor', 'sosnovy-i-bor', 1, 0, '2021-08-31 14:14:49', '2021-11-30 09:20:05'),
(899, 172, 30, 'Сосногорск', 'Sosnogorsk', 'sosnogorsk', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(900, 172, 32, 'Сочи', 'Soci', 'soci', 1, 0, '2021-08-31 14:14:49', '2021-11-30 09:20:05'),
(901, 172, 24, 'Спас-Деменск', 'Spas-Demensk', 'spas-demensk', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(902, 172, 57, 'Спас-Клепики', 'Spas-Klepiki', 'spas-klepiki', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(903, 172, 54, 'Спасск-Дальний', 'Spassk-Dalnii', 'spassk-dalnii', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(904, 172, 57, 'Спасск-Рязанский', 'Spassk-Ryazanskii', 'spassk-ryazanskii', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(905, 172, 52, 'Спасск', 'Spassk', 'spassk', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(906, 172, 83, 'Среднеколымск', 'Srednekoly''msk', 'srednekoly-msk', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(907, 172, 62, 'Среднеуральск', 'Sredneuralsk', 'sredneuralsk', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(908, 172, 17, 'Сретенск', 'Sretensk', 'sretensk', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(909, 172, 66, 'Ставрополь', 'Stavropol', 'stavropol', 1, 0, '2021-08-31 14:14:49', '2021-11-30 09:20:05'),
(910, 172, 43, 'Старая Купавна', 'Staraya Kupavna', 'staraya-kupavna', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(911, 172, 47, 'Старая Русса', 'Staraya Russa', 'staraya-russa', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(912, 172, 69, 'Старица', 'Starica', 'starica', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(913, 172, 9, 'Стародуб', 'Starodub', 'starodub', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(914, 172, 34, 'Старый Крым', 'Stary''i Kry''m', 'stary-i-kry-m', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(915, 172, 8, 'Старый Оскол', 'Stary''i Oskol', 'stary-i-oskol', 1, 0, '2021-08-31 14:14:49', '2021-11-30 09:20:05'),
(916, 172, 7, 'Стерлитамак', 'Sterlitamak', 'sterlitamak', 1, 0, '2021-08-31 14:14:49', '2021-11-30 09:20:05'),
(917, 172, 70, 'Стрежевой', 'Strezevoi', 'strezevoi', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(918, 172, 8, 'Строитель', 'Stroitel', 'stroitel', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(919, 172, 11, 'Струнино', 'Strunino', 'strunino', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(920, 172, 43, 'Ступино', 'Stupino', 'stupino', 1, 0, '2021-08-31 14:14:49', '2021-11-30 09:20:05'),
(921, 172, 71, 'Суворов', 'Suvorov', 'suvorov', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(922, 172, 34, 'Судак', 'Sudak', 'sudak', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(923, 172, 36, 'Суджа', 'Sudza', 'sudza', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(924, 172, 11, 'Судогда', 'Sudogda', 'sudogda', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(925, 172, 11, 'Суздаль', 'Suzdal', 'suzdal', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(926, 172, 19, 'Сунжа', 'Sunza', 'sunza', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(927, 172, 27, 'Суоярви', 'Suoyarvi', 'suoyarvi', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(928, 172, 9, 'Сураж', 'Suraz', 'suraz', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(929, 172, 78, 'Сургут', 'Surgut', 'surgut', 1, 0, '2021-08-31 14:14:49', '2021-11-30 09:20:05'),
(930, 172, 12, 'Суровикино', 'Surovikino', 'surovikino', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(931, 172, 52, 'Сурск', 'Sursk', 'sursk', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(932, 172, 39, 'Сусуман', 'Susuman', 'susuman', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(933, 172, 24, 'Сухиничи', 'Suxinici', 'suxinici', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(934, 172, 62, 'Сухой Лог', 'Suxoi Log', 'suxoi-log', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(935, 172, 58, 'Сызрань', 'Sy''zran', 'sy-zran', 1, 0, '2021-08-31 14:14:49', '2021-11-30 09:20:05'),
(936, 172, 30, 'Сыктывкар', 'Sy''kty''vkar', 'sy-kty-vkar', 1, 0, '2021-08-31 14:14:49', '2021-11-30 09:20:05'),
(937, 172, 62, 'Сысерть', 'Sy''sert', 'sy-sert', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(938, 172, 65, 'Сычёвка', 'Sy''cyovka', 'sy-cyovka', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(939, 172, 37, 'Сясьстрой', 'Syasstroi', 'syasstroi', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(940, 172, 62, 'Тавда', 'Tavda', 'tavda', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(941, 172, 56, 'Таганрог', 'Taganrog', 'taganrog', 1, 0, '2021-08-31 14:14:49', '2021-11-30 09:20:05'),
(942, 172, 28, 'Тайга', 'Taiga', 'taiga', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(943, 172, 20, 'Тайшет', 'Taiset', 'taiset', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(944, 172, 43, 'Талдом', 'Taldom', 'taldom', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(945, 172, 62, 'Талица', 'Talica', 'talica', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(946, 172, 67, 'Тамбов', 'Tambov', 'tambov', 1, 0, '2021-08-31 14:14:49', '2021-11-30 09:20:05'),
(947, 172, 49, 'Тара', 'Tara', 'tara', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(948, 172, 84, 'Тарко-Сале', 'Tarko-Sale', 'tarko-sale', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(949, 172, 24, 'Таруса', 'Tarusa', 'tarusa', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(950, 172, 48, 'Татарск', 'Tatarsk', 'tatarsk', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(951, 172, 28, 'Таштагол', 'Tastagol', 'tastagol', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(952, 172, 69, 'Тверь', 'Tver', 'tver', 1, 0, '2021-08-31 14:14:49', '2021-11-30 09:20:05'),
(953, 172, 26, 'Теберда', 'Teberda', 'teberda', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(954, 172, 18, 'Тейково', 'Teikovo', 'teikovo', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(955, 172, 41, 'Темников', 'Temnikov', 'temnikov', 0, 0, '2021-08-31 14:14:49', '2021-08-31 14:14:49'),
(956, 172, 32, 'Темрюк', 'Temryuk', 'temryuk', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(957, 172, 21, 'Терек', 'Terek', 'terek', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(958, 172, 68, 'Тетюши', 'Tetyusi', 'tetyusi', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(959, 172, 32, 'Тимашёвск', 'Timasyovsk', 'timasyovsk', 1, 0, '2021-08-31 14:14:50', '2021-11-30 09:20:05'),
(960, 172, 37, 'Тихвин', 'Tixvin', 'tixvin', 1, 0, '2021-08-31 14:14:50', '2021-11-30 09:20:05'),
(961, 172, 32, 'Тихорецк', 'Tixoreck', 'tixoreck', 1, 0, '2021-08-31 14:14:50', '2021-11-30 09:20:05'),
(962, 172, 73, 'Тобольск', 'Tobolsk', 'tobolsk', 1, 0, '2021-08-31 14:14:50', '2021-11-30 09:20:05'),
(963, 172, 48, 'Тогучин', 'Togucin', 'togucin', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(964, 172, 58, 'Тольятти', 'Tolyatti', 'tolyatti', 1, 0, '2021-08-31 14:14:50', '2021-11-30 09:20:05'),
(965, 172, 61, 'Томари', 'Tomari', 'tomari', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(966, 172, 83, 'Томмот', 'Tommot', 'tommot', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(967, 172, 70, 'Томск', 'Tomsk', 'tomsk', 1, 0, '2021-08-31 14:14:50', '2021-11-30 09:20:05'),
(968, 172, 28, 'Топки', 'Topki', 'topki', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(969, 172, 69, 'Торжок', 'Torzok', 'torzok', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(970, 172, 69, 'Торопец', 'Toropec', 'toropec', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(971, 172, 37, 'Тосно', 'Tosno', 'tosno', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(972, 172, 13, 'Тотьма', 'Totma', 'totma', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(973, 172, 79, 'Троицк', 'Troick', 'troick', 1, 0, '2021-08-31 14:14:50', '2021-11-30 09:20:05'),
(974, 172, 9, 'Трубчевск', 'Trubcevsk', 'trubcevsk', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(975, 172, 79, 'Трёхгорный', 'Tryoxgorny''i', 'tryoxgorny-i', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(976, 172, 32, 'Туапсе', 'Tuapse', 'tuapse', 1, 0, '2021-08-31 14:14:50', '2021-11-30 09:20:05'),
(977, 172, 7, 'Туймазы', 'Tuimazy''', 'tuimazy', 1, 0, '2021-08-31 14:14:50', '2021-11-30 09:20:05'),
(978, 172, 71, 'Тула', 'Tula', 'tula', 1, 0, '2021-08-31 14:14:50', '2021-11-30 09:20:05'),
(979, 172, 20, 'Тулун', 'Tulun', 'tulun', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(980, 172, 72, 'Туран', 'Turan', 'turan', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(981, 172, 62, 'Туринск', 'Turinsk', 'turinsk', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(982, 172, 85, 'Тутаев', 'Tutaev', 'tutaev', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(983, 172, 4, 'Тында', 'Ty''nda', 'ty-nda', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(984, 172, 21, 'Тырныауз', 'Ty''rny''auz', 'ty-rny-auz', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(985, 172, 49, 'Тюкалинск', 'Tyukalinsk', 'tyukalinsk', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(986, 172, 73, 'Тюмень', 'Tyumen', 'tyumen', 1, 0, '2021-08-31 14:14:50', '2021-11-30 09:20:05'),
(987, 172, 67, 'Уварово', 'Uvarovo', 'uvarovo', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(988, 172, 61, 'Углегорск', 'Uglegorsk', 'uglegorsk', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(989, 172, 85, 'Углич', 'Uglic', 'uglic', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(990, 172, 83, 'Удачный', 'Udacny''i', 'udacny-i', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(991, 172, 69, 'Удомля', 'Udomlya', 'udomlya', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(992, 172, 33, 'Ужур', 'Uzur', 'uzur', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(993, 172, 71, 'Узловая', 'Uzlovaya', 'uzlovaya', 1, 0, '2021-08-31 14:14:50', '2021-11-30 09:20:05'),
(994, 172, 10, 'Улан-Удэ', 'Ulan-Ude''', 'ulan-ude', 1, 0, '2021-08-31 14:14:50', '2021-11-30 09:20:05'),
(995, 172, 75, 'Ульяновск', 'Ulyanovsk', 'ulyanovsk', 1, 0, '2021-08-31 14:14:50', '2021-11-30 09:20:05'),
(996, 172, 9, 'Унеча', 'Uneca', 'uneca', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(997, 172, 78, 'Урай', 'Urai', 'urai', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(998, 172, 46, 'Урень', 'Uren', 'uren', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(999, 172, 29, 'Уржум', 'Urzum', 'urzum', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(1000, 172, 80, 'Урус-Мартан', 'Urus-Martan', 'urus-martan', 1, 0, '2021-08-31 14:14:50', '2021-11-30 09:20:05'),
(1001, 172, 12, 'Урюпинск', 'Uryupinsk', 'uryupinsk', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(1002, 172, 30, 'Усинск', 'Usinsk', 'usinsk', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(1003, 172, 38, 'Усмань', 'Usman', 'usman', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(1004, 172, 20, 'Усолье-Сибирское', 'Usole-Sibirskoe', 'usole-sibirskoe', 1, 0, '2021-08-31 14:14:50', '2021-11-30 09:20:05'),
(1005, 172, 53, 'Усолье', 'Usole', 'usole', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(1006, 172, 54, 'Уссурийск', 'Ussuriisk', 'ussuriisk', 1, 0, '2021-08-31 14:14:50', '2021-11-30 09:20:05'),
(1007, 172, 26, 'Усть-Джегута', 'Ust-Dzeguta', 'ust-dzeguta', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(1008, 172, 20, 'Усть-Илимск', 'Ust-Ilimsk', 'ust-ilimsk', 1, 0, '2021-08-31 14:14:50', '2021-11-30 09:20:05'),
(1009, 172, 79, 'Усть-Катав', 'Ust-Katav', 'ust-katav', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(1010, 172, 20, 'Усть-Кут', 'Ust-Kut', 'ust-kut', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(1011, 172, 32, 'Усть-Лабинск', 'Ust-Labinsk', 'ust-labinsk', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(1012, 172, 13, 'Устюжна', 'Ustyuzna', 'ustyuzna', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(1013, 172, 7, 'Уфа', 'Ufa', 'ufa', 1, 0, '2021-08-31 14:14:50', '2021-11-30 09:20:05'),
(1014, 172, 30, 'Ухта', 'Uxta', 'uxta', 1, 0, '2021-08-31 14:14:50', '2021-11-30 09:20:05'),
(1015, 172, 7, 'Учалы', 'Ucaly''', 'ucaly', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(1016, 172, 33, 'Уяр', 'Uyar', 'uyar', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(1017, 172, 36, 'Фатеж', 'Fatez', 'fatez', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(1018, 172, 34, 'Феодосия', 'Feodosiya', 'feodosiya', 1, 0, '2021-08-31 14:14:50', '2021-11-30 09:20:05'),
(1019, 172, 9, 'Фокино', 'Fokino', 'fokino', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(1020, 172, 54, 'Фокино', 'Fokino', 'fokino-2', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(1021, 172, 12, 'Фролово', 'Frolovo', 'frolovo', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(1022, 172, 43, 'Фрязино', 'Fryazino', 'fryazino', 1, 0, '2021-08-31 14:14:50', '2021-11-30 09:20:05'),
(1023, 172, 18, 'Фурманов', 'Furmanov', 'furmanov', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(1024, 172, 76, 'Хабаровск', 'Xabarovsk', 'xabarovsk', 1, 0, '2021-08-31 14:14:50', '2021-11-30 09:20:05'),
(1025, 172, 32, 'Хадыженск', 'Xady''zensk', 'xady-zensk', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(1026, 172, 78, 'Ханты-Мансийск', 'Xanty''-Mansiisk', 'xanty-mansiisk', 1, 0, '2021-08-31 14:14:50', '2021-11-30 09:20:05'),
(1027, 172, 6, 'Харабали', 'Xarabali', 'xarabali', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(1028, 172, 13, 'Харовск', 'Xarovsk', 'xarovsk', 0, 0, '2021-08-31 14:14:50', '2021-08-31 14:14:50'),
(1029, 172, 15, 'Хасавюрт', 'Xasavyurt', 'xasavyurt', 1, 0, '2021-08-31 14:14:51', '2021-11-30 09:20:05'),
(1030, 172, 60, 'Хвалынск', 'Xvaly''nsk', 'xvaly-nsk', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1031, 172, 17, 'Хилок', 'Xilok', 'xilok', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1032, 172, 43, 'Химки', 'Ximki', 'ximki', 1, 0, '2021-08-31 14:14:51', '2021-11-30 09:20:05'),
(1033, 172, 47, 'Холм', 'Xolm', 'xolm', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1034, 172, 61, 'Холмск', 'Xolmsk', 'xolmsk', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1035, 172, 43, 'Хотьково', 'Xotkovo', 'xotkovo', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1036, 172, 81, 'Цивильск', 'Civilsk', 'civilsk', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1037, 172, 56, 'Цимлянск', 'Cimlyansk', 'cimlyansk', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1038, 172, 4, 'Циолковский', 'Ciolkovskii', 'ciolkovskii', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1039, 172, 72, 'Чадан', 'Cadan', 'cadan', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1040, 172, 53, 'Чайковский', 'Caikovskii', 'caikovskii', 1, 0, '2021-08-31 14:14:51', '2021-11-30 09:20:05'),
(1041, 172, 58, 'Чапаевск', 'Capaevsk', 'capaevsk', 1, 0, '2021-08-31 14:14:51', '2021-11-30 09:20:05'),
(1042, 172, 38, 'Чаплыгин', 'Caply''gin', 'caply-gin', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1043, 172, 79, 'Чебаркуль', 'Cebarkul', 'cebarkul', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1044, 172, 81, 'Чебоксары', 'Ceboksary''', 'ceboksary', 1, 0, '2021-08-31 14:14:51', '2021-11-30 09:20:05'),
(1045, 172, 21, 'Чегем', 'Cegem', 'cegem', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1046, 172, 71, 'Чекалин', 'Cekalin', 'cekalin', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1047, 172, 79, 'Челябинск', 'Celyabinsk', 'celyabinsk', 1, 0, '2021-08-31 14:14:51', '2021-11-30 09:20:05'),
(1048, 172, 53, 'Чердынь', 'Cerdy''n', 'cerdy-n', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1049, 172, 20, 'Черемхово', 'Ceremxovo', 'ceremxovo', 1, 0, '2021-08-31 14:14:51', '2021-11-30 09:20:05'),
(1050, 172, 48, 'Черепаново', 'Cerepanovo', 'cerepanovo', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1051, 172, 13, 'Череповец', 'Cerepovec', 'cerepovec', 1, 0, '2021-08-31 14:14:51', '2021-11-30 09:20:05'),
(1052, 172, 26, 'Черкесск', 'Cerkessk', 'cerkessk', 1, 0, '2021-08-31 14:14:51', '2021-11-30 09:20:05'),
(1053, 172, 43, 'Черноголовка', 'Cernogolovka', 'cernogolovka', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1054, 172, 77, 'Черногорск', 'Cernogorsk', 'cernogorsk', 1, 0, '2021-08-31 14:14:51', '2021-11-30 09:20:05'),
(1055, 172, 53, 'Чернушка', 'Cernuska', 'cernuska', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1056, 172, 22, 'Черняховск', 'Cernyaxovsk', 'cernyaxovsk', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1057, 172, 43, 'Чехов', 'Cexov', 'cexov', 1, 0, '2021-08-31 14:14:51', '2021-11-30 09:20:05'),
(1058, 172, 68, 'Чистополь', 'Cistopol', 'cistopol', 1, 0, '2021-08-31 14:14:51', '2021-11-30 09:20:05'),
(1059, 172, 17, 'Чита', 'Cita', 'cita', 1, 0, '2021-08-31 14:14:51', '2021-11-30 09:20:05'),
(1060, 172, 46, 'Чкаловск', 'Ckalovsk', 'ckalovsk', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1061, 172, 47, 'Чудово', 'Cudovo', 'cudovo', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1062, 172, 48, 'Чулым', 'Culy''m', 'culy-m', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1063, 172, 53, 'Чусовой', 'Cusovoi', 'cusovoi', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1064, 172, 31, 'Чухлома', 'Cuxloma', 'cuxloma', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1065, 172, 53, 'Чёрмоз', 'Cyormoz', 'cyormoz', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1066, 172, 72, 'Шагонар', 'Sagonar', 'sagonar', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1067, 172, 35, 'Шадринск', 'Sadrinsk', 'sadrinsk', 1, 0, '2021-08-31 14:14:51', '2021-11-30 09:20:05'),
(1068, 172, 80, 'Шали', 'Sali', 'sali', 1, 0, '2021-08-31 14:14:51', '2021-11-30 09:20:05'),
(1069, 172, 33, 'Шарыпово', 'Sary''povo', 'sary-povo', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1070, 172, 31, 'Шарья', 'Sarya', 'sarya', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1071, 172, 43, 'Шатура', 'Satura', 'satura', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1072, 172, 56, 'Шахты', 'Saxty''', 'saxty', 1, 0, '2021-08-31 14:14:51', '2021-11-30 09:20:05'),
(1073, 172, 46, 'Шахунья', 'Saxunya', 'saxunya', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1074, 172, 57, 'Шацк', 'Sack', 'sack', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1075, 172, 8, 'Шебекино', 'Sebekino', 'sebekino', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1076, 172, 20, 'Шелехов', 'Selexov', 'selexov', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1077, 172, 5, 'Шенкурск', 'Senkursk', 'senkursk', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1078, 172, 17, 'Шилка', 'Silka', 'silka', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1079, 172, 4, 'Шимановск', 'Simanovsk', 'simanovsk', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1080, 172, 60, 'Шиханы', 'Sixany''', 'sixany', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1081, 172, 37, 'Шлиссельбург', 'Slisselburg', 'slisselburg', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1082, 172, 81, 'Шумерля', 'Sumerlya', 'sumerlya', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1083, 172, 35, 'Шумиха', 'Sumixa', 'sumixa', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1084, 172, 18, 'Шуя', 'Suya', 'suya', 1, 0, '2021-08-31 14:14:51', '2021-11-30 09:20:05'),
(1085, 172, 36, 'Щигры', 'Shhigry''', 'shhigry', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1086, 172, 35, 'Щучье', 'Shhuce', 'shhuce', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1087, 172, 71, 'Щёкино', 'Shhyokino', 'shhyokino', 1, 0, '2021-08-31 14:14:51', '2021-11-30 09:20:05'),
(1088, 172, 34, 'Щёлкино', 'Shhyolkino', 'shhyolkino', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1089, 172, 43, 'Щёлково', 'Shhyolkovo', 'shhyolkovo', 1, 0, '2021-08-31 14:14:51', '2021-11-30 09:20:05'),
(1090, 172, 43, 'Электрогорск', 'E''lektrogorsk', 'e-lektrogorsk', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1091, 172, 43, 'Электросталь', 'E''lektrostal', 'e-lektrostal', 1, 0, '2021-08-31 14:14:51', '2021-11-30 09:20:05'),
(1092, 172, 43, 'Электроугли', 'E''lektrougli', 'e-lektrougli', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1093, 172, 23, 'Элиста', 'E''lista', 'e-lista', 1, 0, '2021-08-31 14:14:51', '2021-11-30 09:20:05'),
(1094, 172, 60, 'Энгельс', 'E''ngels', 'e-ngels', 1, 0, '2021-08-31 14:14:51', '2021-11-30 09:20:05'),
(1095, 172, 14, 'Эртиль', 'E''rtil', 'e-rtil', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1096, 172, 78, 'Югорск', 'Yugorsk', 'yugorsk', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1097, 172, 18, 'Южа', 'Yuza', 'yuza', 0, 0, '2021-08-31 14:14:51', '2021-08-31 14:14:51'),
(1098, 172, 61, 'Южно-Сахалинск', 'Yuzno-Saxalinsk', 'yuzno-saxalinsk', 1, 0, '2021-08-31 14:14:51', '2021-11-30 09:20:05'),
(1099, 172, 15, 'Южно-Сухокумск', 'Yuzno-Suxokumsk', 'yuzno-suxokumsk', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(1100, 172, 79, 'Южноуральск', 'Yuznouralsk', 'yuznouralsk', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(1101, 172, 28, 'Юрга', 'Yurga', 'yurga', 1, 0, '2021-08-31 14:14:52', '2021-11-30 09:20:05'),
(1102, 172, 11, 'Юрьев-Польский', 'Yurev-Polskii', 'yurev-polskii', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(1103, 172, 18, 'Юрьевец', 'Yurevec', 'yurevec', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(1104, 172, 79, 'Юрюзань', 'Yuryuzan', 'yuryuzan', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(1105, 172, 24, 'Юхнов', 'Yuxnov', 'yuxnov', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(1106, 172, 81, 'Ядрин', 'Yadrin', 'yadrin', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(1107, 172, 83, 'Якутск', 'Yakutsk', 'yakutsk', 1, 0, '2021-08-31 14:14:52', '2021-11-30 09:20:05'),
(1108, 172, 34, 'Ялта', 'Yalta', 'yalta', 1, 0, '2021-08-31 14:14:52', '2021-11-30 09:20:05'),
(1109, 172, 73, 'Ялуторовск', 'Yalutorovsk', 'yalutorovsk', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(1110, 172, 7, 'Янаул', 'Yanaul', 'yanaul', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(1111, 172, 29, 'Яранск', 'Yaransk', 'yaransk', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(1112, 172, 3, 'Яровое', 'Yarovoe', 'yarovoe', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(1113, 172, 85, 'Ярославль', 'Yaroslavl', 'yaroslavl', 1, 0, '2021-08-31 14:14:52', '2021-11-30 09:20:05'),
(1114, 172, 65, 'Ярцево', 'Yarcevo', 'yarcevo', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(1115, 172, 71, 'Ясногорск', 'Yasnogorsk', 'yasnogorsk', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(1116, 172, 50, 'Ясный', 'Yasny''i', 'yasny-i', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(1117, 172, 43, 'Яхрома', 'Yaxroma', 'yaxroma', 0, 0, '2021-08-31 14:14:52', '2021-08-31 14:14:52');

-- 
-- Вывод данных для таблицы websockets_statistics_entries
--
-- Таблица jobzzz.websockets_statistics_entries не содержит данных

-- 
-- Вывод данных для таблицы visitables
--
INSERT INTO visitables VALUES
(7, 'App\\Models\\Job\\Vacancy', 9, 65, NULL, NULL),
(8, 'App\\Models\\Job\\Vacancy', 23, 65, NULL, NULL),
(9, 'App\\Models\\Job\\Vacancy', 56, 65, NULL, NULL),
(10, 'App\\Models\\Job\\Vacancy', 20, 65, NULL, NULL),
(11, 'App\\Models\\Job\\CandidateProfile', 64, 69, NULL, NULL),
(12, 'App\\Models\\Job\\CandidateProfile', 22, 69, NULL, NULL),
(13, 'App\\Models\\Job\\CandidateProfile', 4, 69, NULL, NULL),
(14, 'App\\Models\\Job\\CandidateProfile', 52, 69, NULL, NULL),
(15, 'App\\Models\\Job\\CandidateProfile', 65, 69, NULL, NULL),
(16, 'App\\Models\\Job\\CandidateProfile', 33, 76, NULL, NULL),
(17, 'App\\Models\\Job\\CandidateProfile', 65, 76, NULL, NULL),
(18, 'App\\Models\\Job\\CandidateProfile', 52, 76, NULL, NULL),
(19, 'App\\Models\\Job\\Vacancy', 59, 68, NULL, NULL),
(20, 'App\\Models\\Job\\Vacancy', 60, 68, NULL, NULL),
(21, 'App\\Models\\Job\\CandidateProfile', 64, 76, NULL, NULL),
(22, 'App\\Models\\Job\\CandidateProfile', 69, 76, NULL, NULL),
(23, 'App\\Models\\Job\\Vacancy', 59, 65, NULL, NULL),
(24, 'App\\Models\\Job\\Vacancy', 62, 65, NULL, NULL),
(25, 'App\\Models\\Job\\Vacancy', 53, 65, NULL, NULL);

-- 
-- Вывод данных для таблицы vacancy_specializations
--
INSERT INTO vacancy_specializations VALUES
(5, 1),
(14, 1),
(50, 1),
(41, 2),
(52, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 2),
(44, 3),
(51, 3),
(53, 3),
(58, 3),
(59, 3),
(61, 3),
(21, 4),
(30, 4),
(4, 5),
(34, 5),
(35, 5),
(2, 7),
(28, 8),
(42, 8),
(43, 8),
(1, 9),
(46, 9),
(25, 10),
(60, 10),
(62, 10),
(7, 13),
(40, 13),
(13, 15),
(22, 15),
(49, 16),
(16, 17),
(6, 19),
(38, 19),
(19, 20),
(29, 21),
(31, 22),
(48, 23),
(3, 24),
(33, 24),
(45, 24),
(9, 25),
(10, 25),
(11, 25),
(17, 25),
(23, 25),
(32, 25),
(12, 26),
(26, 27),
(24, 28),
(39, 28),
(15, 29),
(27, 29),
(8, 30),
(18, 30),
(20, 30),
(36, 30),
(37, 30),
(47, 30);

-- 
-- Вывод данных для таблицы vacancy_skills
--
-- Таблица jobzzz.vacancy_skills не содержит данных

-- 
-- Вывод данных для таблицы vacancy_employment_types
--
INSERT INTO vacancy_employment_types VALUES
(2, 2),
(4, 2),
(5, 2),
(7, 2),
(10, 2),
(12, 2),
(16, 2),
(17, 2),
(26, 2),
(28, 2),
(29, 2),
(31, 2),
(32, 2),
(33, 2),
(35, 2),
(38, 2),
(40, 2),
(41, 2),
(44, 2),
(45, 2),
(46, 2),
(51, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 2),
(58, 2),
(59, 2),
(60, 2),
(61, 2),
(62, 2);

-- 
-- Вывод данных для таблицы vacancy_cities
--
INSERT INTO vacancy_cities VALUES
(14, 80),
(19, 80),
(34, 80),
(40, 80),
(43, 80),
(2, 170),
(9, 170),
(37, 170),
(1, 183),
(10, 183),
(16, 183),
(32, 183),
(3, 276),
(11, 276),
(24, 276),
(29, 276),
(8, 345),
(13, 345),
(25, 345),
(39, 345),
(42, 345),
(47, 345),
(48, 345),
(8, 353),
(17, 353),
(20, 353),
(24, 353),
(29, 353),
(30, 353),
(35, 353),
(36, 353),
(2, 357),
(31, 357),
(48, 357),
(22, 466),
(25, 466),
(36, 466),
(13, 503),
(26, 503),
(28, 503),
(8, 531),
(26, 531),
(35, 531),
(49, 531),
(50, 531),
(17, 605),
(51, 605),
(52, 605),
(53, 605),
(54, 605),
(55, 605),
(56, 605),
(57, 605),
(58, 605),
(59, 605),
(60, 605),
(62, 605),
(16, 648),
(18, 648),
(19, 648),
(24, 648),
(40, 648),
(45, 648),
(31, 666),
(33, 666),
(4, 673),
(15, 673),
(26, 673),
(28, 673),
(33, 673),
(35, 673),
(36, 673),
(38, 673),
(39, 673),
(50, 673),
(6, 710),
(44, 710),
(5, 786),
(21, 786),
(34, 786),
(37, 786),
(3, 808),
(39, 808),
(59, 827),
(42, 844),
(5, 952),
(32, 952),
(44, 952),
(25, 967),
(50, 967),
(3, 978),
(19, 978),
(37, 978),
(40, 978),
(41, 978),
(5, 1024),
(30, 1024),
(33, 1024),
(44, 1024),
(48, 1024),
(1, 1044),
(13, 1044),
(30, 1044),
(31, 1044),
(12, 1047),
(1, 1107),
(6, 1107),
(11, 1107),
(23, 1107),
(27, 1107),
(49, 1107),
(7, 1108),
(41, 1108),
(46, 1108);

-- 
-- Вывод данных для таблицы specializations_skills
--
INSERT INTO specializations_skills VALUES
(3, 1),
(3, 2),
(10, 5),
(1, 8),
(4, 9),
(19, 10),
(19, 12),
(19, 13),
(4, 14),
(2, 15),
(19, 18),
(19, 19),
(19, 20),
(4, 21),
(10, 21),
(13, 21),
(7, 22),
(7, 23),
(11, 25),
(6, 28),
(9, 28),
(11, 28),
(19, 28),
(4, 29),
(8, 30),
(3, 31),
(2, 32),
(9, 33),
(11, 34),
(6, 38),
(1, 40),
(2, 40),
(3, 40),
(4, 40),
(6, 40),
(7, 40),
(8, 40),
(9, 40),
(10, 40),
(11, 40),
(13, 40),
(19, 40),
(3, 42),
(4, 42),
(10, 42),
(11, 42),
(13, 42),
(8, 43),
(1, 45),
(4, 46),
(9, 46),
(10, 46),
(11, 46),
(13, 46),
(19, 47),
(1, 49),
(7, 49),
(8, 50),
(8, 51),
(8, 52),
(10, 53),
(13, 53),
(1, 55),
(19, 56),
(10, 57),
(2, 58),
(6, 58),
(9, 58),
(10, 58),
(11, 58),
(13, 58),
(19, 58),
(3, 59),
(8, 62),
(6, 64),
(9, 64),
(2, 65),
(7, 65),
(6, 66),
(8, 66),
(9, 66),
(10, 66),
(11, 66),
(13, 66),
(19, 66),
(6, 67),
(7, 69),
(10, 69),
(1, 71),
(19, 72),
(9, 73),
(7, 74),
(1, 75),
(2, 75),
(3, 75),
(7, 75),
(10, 75),
(11, 75),
(2, 79),
(19, 79),
(6, 80),
(9, 80),
(11, 80),
(13, 80),
(2, 84),
(4, 86),
(9, 86),
(4, 88),
(1, 89),
(3, 89),
(4, 89),
(6, 89),
(7, 89),
(9, 89),
(10, 89),
(11, 89),
(13, 89),
(8, 91),
(1, 93),
(6, 95),
(13, 95),
(13, 97),
(13, 98),
(4, 99),
(3, 102),
(8, 104),
(8, 105),
(2, 107),
(3, 108),
(6, 108),
(8, 108),
(11, 108),
(7, 109),
(4, 110),
(9, 110),
(7, 117),
(4, 118),
(10, 118),
(7, 122);

-- 
-- Вывод данных для таблицы site_options
--
INSERT INTO site_options VALUES
(1, 'contact_email', 'Контактный E-mail', 'leshkov.vladislav@gmail.com', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(2, 'contact_phone1', 'Контактный телефон 1', '+7 (980) 387 30 52', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(3, 'contact_phone2', 'Контактный телефон 2', '', 'string', 1, '2021-10-07 12:01:20', '2021-10-21 15:42:09'),
(4, 'contact_phone3', 'Контактный телефон 3', '', 'string', 1, '2021-10-07 12:01:20', '2021-10-21 15:42:09'),
(5, 'telegram', 'Telegram', 'https://t.me/VladislavLeshkov', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(6, 'linked_in', 'LinkedIn', 'https://www.linkedin.com/in/vladislav-leshkov/', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(7, 'instagram', 'Instagram', '#', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(8, 'facebook', 'Facebook', '#', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(9, 'google_play', 'Google Play', '#', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(10, 'app_store', 'App Store', '#', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(11, 'moderate_candidate', 'Модерация кандидатов', '0', 'boolean', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(12, 'moderate_recruiter', 'Модерация рекрутеров', '1', 'boolean', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(13, 'candidate_price_percent', 'Стоимость кандидатов, %', '10', 'integer', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(14, 'candidate_price_min', 'Мин. стоимость кандидатов, руб.', '1000', 'integer', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(15, 'candidate_pay_min', 'Порог оплаты кандидатов, руб.', '50000', 'integer', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(16, 'candidate_offer_text', 'Текст предложение кандидату', 'Добрый день!\r\nНам интересен Ваш профиль и мы хотим предложить Вам на рассмотрение нашу вакансию. Будем рады ознакомиться с Вашим резюме)', 'text', 1, '2021-10-07 12:01:20', '2021-10-21 15:42:09'),
(17, 'vacancy_offer_text', 'Текст отклик на вакансию', 'Добрый день! {RECRUITER_NAME}\r\nМне интересна ваша вакансия {VACANCY_TITLE}\r\n{VACANCY_URL}\r\n\r\nОткрываю свои контакты и резюме\r\n{CANDIDATE_CONTACT}\r\nС нетерпением буду ждать вашего ответа)', 'text', 1, '2021-10-07 12:01:20', '2021-10-21 15:39:59'),
(18, 'vacancy_regards_text', 'Текст подписи отклика на вакансию', '--------------------------------------------\r\nС уважением {CANDIDATE_NAME}\r\n{CANDIDATE_EMAIL}', 'text', 1, '2021-10-07 12:01:20', '2021-10-21 15:39:59'),
(19, 'invoice_offer_rub', 'Название позиции в счете, RUB', 'Услуги в сфере поиска и подбора персонала', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(20, 'invoice_name_rub', 'Название организации, RUB', 'ИП ЛЕШКОВ ВЛАДИСЛАВ АЛЕКСАНДРОВИЧ', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(21, 'invoice_inn_rub', 'ИНН, RUB', '312348651842', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(22, 'invoice_address_rub', 'Юридический адрес организации, RUB', '308018, РОССИЯ, БЕЛГОРОДСКАЯ ОБЛ, Г БЕЛГОРОД, УЛ ЛУНАЧАРСКОГО, Д 22', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(23, 'beneficiary_account_rub', 'Расчетный счет, RUB', '40802810200002449705', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(24, 'invoice_ogrn_rub', 'ОГРН, RUB', '321312300048189', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(25, 'invoice_bank_rub', 'Банк, RUB', 'АО «Тинькофф Банк»', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(26, 'invoice_bank_bik_rub', 'БИК банка, RUB', '044525974', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(27, 'invoice_bank_inn_rub', 'ИНН банка, RUB', '7710140679', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(28, 'invoice_bank_account_rub', 'Корреспондентский счет банка, RUB', '30101810145250000974', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(29, 'invoice_bank_address_rub', 'Юридический адрес банка, RUB', '127287, г. Москва, ул. Хуторская 2-я, д. 38А, стр. 26', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(30, 'invoice_offer_swift', 'Название позиции в счете, SWIFT', 'Services in the area of personnel search and selection', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(31, 'beneficiary', 'Beneficiary, SWIFT', 'PE LESHKOV VLADISLAV ALEKSANDROVICH', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(32, 'beneficiary_address', 'Beneficiary address, SWIFT', '308018, LUNACHARSKOGO STREET, HSE 22, BELGOROD, RUSSIA', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(33, 'beneficiary_bank', 'Beneficiary''s bank, SWIFT', 'Tinkoff Bank', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(34, 'beneficiary_bank_address', 'Beneficiary''s bank address, SWIFT', '38A, BLD. 26, 2 KHUTORSKAYA STREET, MOSCOW, 127287', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(35, 'beneficiary_account_usd', 'Beneficiary account, USD', '40802840310000029896', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(36, 'beneficiary_transit_account_usd', 'Beneficiary transit account, USD', '40802840420000029896', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(37, 'beneficiary_swift_usd', 'Beneficiary SWIFT, USD', 'TICSRUMMXXX', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(38, 'intermediary_usd', 'Intermediary, USD', 'JPMORGAN CHASE BANK, N.A. NEW YORK, NY US', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(39, 'intermediary_swift_usd', 'Intermediary SWIFT, USD', 'CHASUS33XXX', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(40, 'intermediary_account_usd', 'Intermediary''s account, USD', '464650808', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(41, 'beneficiary_account_eur', 'Beneficiary account, EUR', '40802978000000018788', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(42, 'beneficiary_transit_account_eur', 'Beneficiary transit account, EUR', '40802978220000018788', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(43, 'beneficiary_swift_eur', 'Beneficiary SWIFT, EUR', 'TICSRUMMXXX', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(44, 'intermediary_eur', 'Intermediary, EUR', 'J.P.MORGAN AG FRANKFURT AM MAIN, DE', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(45, 'intermediary_swift_eur', 'Intermediary SWIFT, EUR', 'CHASDEFXXXX', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20'),
(46, 'intermediary_account_eur', 'Intermediary''s account, EUR', '6231608701', 'string', 1, '2021-10-07 12:01:20', '2021-10-07 12:01:20');

-- 
-- Вывод данных для таблицы salaries
--
INSERT INTO salaries VALUES
(1, 100000, 1000, 1000, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(2, 200000, 2000, 2000, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(3, 300000, 3000, 3000, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(4, 400000, 4000, 4000, '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(5, 500000, 5000, 5000, '2021-08-31 14:14:52', '2021-08-31 14:14:52');

-- 
-- Вывод данных для таблицы role_has_permissions
--
-- Таблица jobzzz.role_has_permissions не содержит данных

-- 
-- Вывод данных для таблицы recruiter_settings
--
INSERT INTO recruiter_settings VALUES
(1, 8, 1, 0, 1, 1, 1, 1, 1, '2021-07-21 07:04:39', '2021-07-21 07:28:01'),
(2, 55, 1, 1, 1, 1, 1, 1, 1, '2021-09-16 15:23:01', '2021-09-16 16:44:03');

-- 
-- Вывод данных для таблицы push_subscriptions
--
INSERT INTO push_subscriptions VALUES
(5, 'App\\Models\\Auth\\User', 69, 'https://fcm.googleapis.com/fcm/send/egeO-yAE_Lo:APA91bHvcH0F1ZN4bRwQnsdn14VHtE935doE1LeOCMVYLISk16Pf2jpt5XJ-5FX76uxERuzH07fzYwVt-OWukyQea_st8RayMn3pXoLxuzIbLLvmtUM3KYbOMz7Aa2wC2qjKtAlmmFkF', 'BFUT/cvzd0m+fgD2rORIF8WOd7sSKr/70gWf6t3UW12t5kTWbbZdRTt3mtCf/EBQVeYYGBahafPT1DZrvNSa3J4=', '+KFEeQrPgW2cD0yvbsa91g==', NULL, '2021-10-26 12:31:00', '2021-10-26 12:31:00'),
(6, 'App\\Models\\Auth\\User', 69, 'https://fcm.googleapis.com/fcm/send/cpU83rblJuE:APA91bFKS1k4Ufhu_pAwX-ViQLHoWgtVNofXtAEE8A01m7oSQH-HFbh6YinJsorcgXHgyXBEslSGA1QSZNztcP9IbftgtllOGkjtwmHXgH0UvBRmF2ZJmHbcAh3zo545MZqHObQPYcE0', 'BEEhZvvM2kOAIN9jBg1ForPZOO7+Lf49/+3MsskEGm2JDE0MijbuTYEnUznSfXDHGVy/EIrUPcCE8LopZcVLoNU=', 'Z5Gqk/65RnY5MPSZwsav9Q==', NULL, '2021-10-26 12:42:57', '2021-10-26 12:42:57'),
(8, 'App\\Models\\Auth\\User', 69, 'https://fcm.googleapis.com/fcm/send/fm-MXPH4n0c:APA91bFvmtwo7AA4ec6FQX3aHxMLEIQTb272UognnrfYi_Mg8ww1DPAj14xm1J7eX3AxB9uLUZVIlpqqTmBSdP3shob0y6Gl_1xGv7AasKOIhPzbp2X_EMc6n0cTcLcQCAVV-st6QIVw', 'BB7ABfmj5gJ09OMN+7uvjke3IaqQLHmTyJcjHuptl5g1IvHtqpXTpVIp6U14ZgTB+SrbDe/OiVYkT7bEqz0p5jo=', 't1pQyTayPuXInJ7zdiQgFA==', NULL, '2021-10-26 16:07:58', '2021-10-26 16:07:58'),
(9, 'App\\Models\\Auth\\User', 69, 'https://fcm.googleapis.com/fcm/send/fBnjfTACPS0:APA91bH50QSGaLwFO3JE3uFEaD2RV0Z09xIt7QwEQ77hjUwnX6xop68kMnwdKF7a6t3Yevx93roUhNVaz2SEjQLK9JW8BJXcq7zOzQVSGmg5KIr9cRSwYSQ_JSNKvrUyijQGuM-zRfA2', 'BBQybtoZRTtOpBkpYwp5k/lD5eneVsqvpErK7k91WEShM4sYr6QYy8/7pli+lzTVBP50VzJTMeaT893GVdmAfsU=', 'P7QLZtDKWjyNHk+GkTTMXA==', NULL, '2021-10-26 16:13:19', '2021-10-26 16:13:19'),
(10, 'App\\Models\\Auth\\User', 69, 'https://fcm.googleapis.com/fcm/send/eJLIa0eupQw:APA91bEMnGFKhvQYVSU4mk3W7EjU6MAqlPz7Xc0Aq6BWK17BSyj5JFm69UDQl7ftv4fRPBkzLGl7MfPfb1F0g7UTskZPjxGwrQ5VuLXhYm0pCx7Of3_Yxfto-16ksq1UiIDgUiXSwpmM', 'BNt1JrtFI5C5tXM6ZbeqckAeX9LHivoaB1ix8h8+JG8didDbjPqiuSYOU4wZNlHI7G1yVftcFbM3icfgkuK3rDI=', 'kmEPeFsGq0fUEzDMs3rwxQ==', NULL, '2021-10-26 16:13:20', '2021-10-26 16:13:20'),
(11, 'App\\Models\\Auth\\User', 69, 'https://fcm.googleapis.com/fcm/send/fvDcUUcjH2Q:APA91bGGOYXFfMme2eIlbxb7Lehcx123sfBpRnxadWujvLaC97irx17UOsyaNNsuPAxR5Vw5sXim0Oc5tUrwHw94IExTxTygdzlSXz1juJwhQQbGOnQmsRPYRqJen__QFFIv56HzpTy2', 'BC+ZL/MVomps1nxxtj1HgjrjHAg/24ZXXDC4UnTJ14yRSHQDBAO5p1lf/FCPUSMKoN+702+LH9Mbz1tc7Onqw5E=', 'VaLDWfTn46LzTVjJALuI0w==', NULL, '2021-10-26 16:13:20', '2021-10-26 16:13:20'),
(31, 'App\\Models\\Auth\\User', 77, 'https://fcm.googleapis.com/fcm/send/d4Y-JgdBo1I:APA91bGHvgaaqBAfgPoGFqnlTa34ZpxmUpyeQhd13ePE1ojkTq1T117YiyOR3V5YPr_qmIccnghl3hzI3QXTvMDGHI3WJ13pj2v5jROPxRaWeLenLhEoYyluGjWYGnQ0j4Vk4mcJ0FaJ', 'BOrWmbzU/61F0muHG7npKGSybP+tfih92OlRFNNhknNrRW4do5T+G+xEBqh1X8CSO5O+YTee/XLH1yEYvOiOWak=', '1PuH0oUBujA25WP2hsh9XQ==', NULL, '2021-11-08 09:18:50', '2021-11-08 09:18:50'),
(36, 'App\\Models\\Auth\\User', 76, 'https://fcm.googleapis.com/fcm/send/cW6mc5jiQEA:APA91bHI3v5r9K315aCjbqnbZKzvPCKcrFcfQzb3Ozp2FGRFpkZlN_K0Ct_hChfiwhlmSjMBNTpm21TbScbYxMDIiAC0qOjAeUYZkq7AwrTDduNbVzjx0DFQMw8GwZSpAZHNFlNMGRx0', 'BLgxpfATd6eStxwK+3ESJoRYruniwyjv6IyqqyLyyMRuQ83ch5ni7BezmLjMStIy6+zXRv83phvETtcz/JHEsp4=', 'yc7SHhm0ugrflfiG5s6Vuw==', NULL, '2021-11-08 09:33:03', '2021-11-08 09:33:03'),
(37, 'App\\Models\\Auth\\User', 76, 'https://fcm.googleapis.com/fcm/send/fFIeIVCykSw:APA91bF9Ie2s-ezoYMFEigBvUflV7jvMYGStJ5pdno3zv2YmkP5xrAykVrTC156Fdwj3YBVCuBlIilbeXkdcs9dTDdlaojfYfwPelvLxaloEf5BE3F_mFXeWNCjin1_KhTimipxiovrA', 'BNEhPb5tfZL6YGmCOsUTm0zMRfVEm+z5gQ5Fn7HmyegNIns05VoWwWGsjY3wgwhaL4Qe982fM6bYBwY8UOZbe2Q=', '2tgRMU8kEyktpB4pYAI2Tw==', NULL, '2021-11-10 09:34:02', '2021-11-10 09:34:02'),
(41, 'App\\Models\\Auth\\User', 76, 'https://fcm.googleapis.com/fcm/send/dqvKejFIVzQ:APA91bEUM1sijGslG8XVxG3mnL_6h0-7ITa1FIhx_-8rs-Lkh5PvlfZk8xo6lX0LLqjJGLh21trDSMn1we-nfRlURJYlWCSWQdk2W1XZLzVkXRvke0AA2QOiOUGVwh1JkvltvQAQeM__', 'BGzgQsrdsu2AwDwo9e/LXcn9uri0bKgUQt1fvC8xuSekXC8JbHjMaMq/CRLYDiHWLs2KjNvfVU+sq9QehTVMszU=', 'EhD+BDlRBC7i7vOCVykRPg==', NULL, '2021-12-13 17:04:44', '2021-12-13 17:04:44'),
(42, 'App\\Models\\Auth\\User', 66, 'https://fcm.googleapis.com/fcm/send/eHJ_0u-GZ7w:APA91bGObu69mISW3vxhiwgMJjtthCi3lhdr7JnGcrIbQuzkCwpuEjHsckcucVFWxQ9uT5EtxhhvtENvUVYvgIWZRsv5Nn-HceV7oFWLecMGIt_So0qi-2_0CKpVmxtAH3PU0WfQPAPd', 'BDRYv0lxoQjLbCFVf9/NbU+JfVgXEgtToq2+mmeMcawaq7FeVo3ZImzbtbuIJXNOEPi6nn/VI1+Ig+GCUtJB2Vo=', 'GAxnO+00QxS0JAFfJO35mw==', NULL, '2021-12-17 13:27:59', '2021-12-17 13:27:59'),
(45, 'App\\Models\\Auth\\User', 76, 'https://fcm.googleapis.com/fcm/send/d4ZfsUOp3_A:APA91bFLdSIkpSLraEGaxiEwdcRpX8bVGBcaWMEwp62Bd3rCtQ_Wj__CGthgIcx61NC7qs7KIXmU8gueTfJPvf2HF_sYuEmUApfpFHdNW2d4xgLYVTOc7XJh_tEbVjtw7ae8hLPeUbQF', 'BOo9LNbL1P7s2u7jm5C/ORaz3HItUn7/M45StdlDNQLvRD+ZGnlkWLnlO72jiYY4a0lxzuvWZgjNInLYQmGDML4=', 'Z2mDTELQAmij5OxN0mN7sA==', NULL, '2021-12-20 11:23:24', '2021-12-20 11:23:24'),
(49, 'App\\Models\\Auth\\User', 65, 'https://fcm.googleapis.com/fcm/send/cFAslzGvJgc:APA91bFi23MCIpK_TIr1I_79rZO0POfd6S9V7HSA8kyyQ1VF-yxxGGAExwQUPGgteFO2npuCdn8e4zFm61z5Ze_j56ZlN1lAzBR91v7_Rd3Gm2TlO71NjVf__sZGsqn-lYRmFVZo-FB7', 'BOLNqcTLsTRLpuXHEnrRUdQhn7QvjkMQ7ZXilbGTdRS/JS8ABcVEVXNvYc5kAbKA7oYQGQSOhKwwm97vYKvaVfw=', 'MGrdxZFI5YdU2Ih13grOPw==', NULL, '2021-12-29 11:26:22', '2021-12-29 11:26:22'),
(50, 'App\\Models\\Auth\\User', 65, 'https://fcm.googleapis.com/fcm/send/f1z1mOn80xY:APA91bEtgiA-2l5dzYIxtUANSIBVqYtDK3Cvrhj85p2mDHcIYglquY0m7Yxu1xHRcgQ3zN_d0o3uWpdKAGhaxhC9b5cOAEhMxGIxA0gCxBZicwcSIjBGxkIDzmSnitZB7hEz7vo5m0Hk', 'BIyfCRvW0mxNiNDBZim5WJA/IPbwIXlhNvAdjbo5JhnkQmws9xhsWQHzoE2oj347aKQ3A8JwlIjqYy2Bo5ZN94Y=', 'o0qo1lysgP77FAyAkItKhQ==', NULL, '2021-12-29 12:59:26', '2021-12-29 12:59:26'),
(51, 'App\\Models\\Auth\\User', 76, 'https://fcm.googleapis.com/fcm/send/deluh5lzAyA:APA91bEXkYmcA19lakMLsNXt38PT9Hna6kN5mn24xMidI0eCFqwAxcv42eHXQ1iqQEY87gGsVls60mko3cYAtIh2CPRJYJhFZtcOx-7CC2DhNU76_0RLhFuxx2jr9kcsKbogTVG4w5Tb', 'BIAgyOE9M32vELLBzd0qKI2DRrl2lNnqqIiJuX89nwU7hKjN1tlAUeRLDdn0paBmrnC6CdZXtFmy7Gj7SZQaLCs=', '9w6kYbdDy0LiiQgbzmdJoA==', NULL, '2022-01-06 10:04:05', '2022-01-06 10:04:05'),
(55, 'App\\Models\\Auth\\User', 68, 'https://fcm.googleapis.com/fcm/send/cG_iYCKwuak:APA91bFy1g5fRtPt86qB37jb_B0V1m3oc3KMFt7BUL2131OFlj6-kkvk9USP2Z3eaxcL9L8jUOCsdT1WetmmKK4BMXPOu270l82mtu9fzb_GO0lm_ClS6GNRnMpvFugrin_dHyMjs7ck', 'BGPNivWYj6GzuvucSpAIuTmwUmeMWqSnIs7vOSYVI9SRUvrVmkwPhQcBo0sIfJK4sfM1Aw2XKnfuqBRn6KwpY00=', '6fBN75AFqFvzb7KSu0aulQ==', NULL, '2022-01-27 09:07:35', '2022-01-27 09:07:35'),
(58, 'App\\Models\\Auth\\User', 65, 'https://fcm.googleapis.com/fcm/send/cRko1wcsL0E:APA91bGD2MLuwcnOxf0AUopzic8fjGGXqpy1o3OckQmUoPtZ5KD2m08DocmJNgvGF_PmwQYCdh6CxZczblwAFc3TL09EcNUBlSil_ideRTlArax7piGhy5R4u4oqsDepJMnvLYkkSnTu', 'BHgZxXwXaxTPuImAV5Ri5G66njtlobriTS9yXZqTYjZ/IduluMQr6H7A0rXyQmW+TD9YlskPbaboxXJ+H0lX4AI=', 'srgPuWO+ph2Lva7vr/AMAQ==', NULL, '2022-02-22 09:24:32', '2022-02-22 09:24:32'),
(59, 'App\\Models\\Auth\\User', 65, 'https://fcm.googleapis.com/fcm/send/eYjbagt41YU:APA91bHKJAtYRlTYya28e-NMA_sr1SlCCxmPf9g0vAMk9RbB_21bQHz7CJyvwWp8ZhuB_Pf-569Aj6_sw2bJ39qi5DihbGFgKFwO_uF1VMe2g1Is6JaAdUC4naiS0PPZDloSOCtmujSh', 'BPEiTFNPyjIG+3Mjrt3Lw2og7NYEoTE7podd+9KRHVdQFI67GhBCBd8LCWXBzDDcbHwVyXylsf/RDIeXqpgv2t4=', 'jdycHM1gzcp6+7758CYKbQ==', NULL, '2022-02-22 09:24:37', '2022-02-22 09:24:37'),
(63, 'App\\Models\\Auth\\User', 81, 'https://fcm.googleapis.com/fcm/send/dxE6sTJpERI:APA91bFMJzMJATwDp84XoQsytV9O9z9tqXy7J8rXj7AI7BvCNOVZKgbiG_Gg40UlS46E_xKYIePy1sVyIzMW92SIIBMSmEP1djZ9xmQtj7R3gNGF2wJf9akFvYWksq9qMqs1ld-gBjJG', 'BIUs1pQJmyYBHmeyYrC6LbauhZRDmGR09eu+Pg4vsf8Q4q7AwUdIH/tsgEqMTErdTYv6g/VBij2RSlDxtxPKiis=', 'QlF4YrZCZRkevvNPra5rrg==', NULL, '2022-02-22 09:28:30', '2022-02-22 09:28:30'),
(64, 'App\\Models\\Auth\\User', 65, 'https://fcm.googleapis.com/fcm/send/ctoeHps5mIE:APA91bERuqHAaH6Du-5WBekE-ntxCclvM1vbgSQmGcOl0WrWp4LpAZbO-bNqUZ3sKjADLhZvoPNPqGL7yQAPjQOJpuXwhChtMDUlKSH0gmpwhllaXJF-55ehG9Nmp0MkU0Dbaj8ahpNf', 'BKU8d1r825QH4absANpcDjjAtfB+6ZE/koUQbsmbE1guPISccb23SLYkyzYkNhLFVeDyyG19mRVxzx/og9BQbnE=', 'Cs42frjGafrnqcNlIUcGvw==', NULL, '2022-02-22 09:43:32', '2022-02-22 09:43:32'),
(65, 'App\\Models\\Auth\\User', 81, 'https://fcm.googleapis.com/fcm/send/fd4zFF13uM8:APA91bGumUO-bDlBYH1plorBJFa5mBeg4PkRw37QIzf0EZGFuqUgsN8jhWlhCcm_xUPyFBhGGvUBViRAAjbnEf0tZg_yKBGfoqE4zo1ZLUsbhQxKdOwtIbWz-1ivQrDmETKVXH9giw3H', 'BHsbM+qSNioRKo4wIaHtTF7bhBsEZwV3tuejWhVmz6zf2FoLBqIsNrrMVx55BZ+UzX49+qmgKqVlpw3LxM3LAdA=', 'VCaN2Y3GQEVIZ1vE71s22w==', NULL, '2022-02-22 11:07:46', '2022-02-22 11:07:46'),
(66, 'App\\Models\\Auth\\User', 76, 'https://fcm.googleapis.com/fcm/send/eakdsl3ZJ60:APA91bHWzsfLYU_bxMQlFIvpTKjg11hv01JJNdseJlVbiNIv3YnML2Oud0bCYDSh9aPKro6WDYAIov4PLoW43HfUQLjf991NLVj7h-TPAdPyKRxdSinyKJ5fAyL-P5GZF5gHgNu2rPg7', 'BCnt8Mhmwe678fDt0R84X5v5N0l4MRixfwmE5Ul0rEmFBldk38hHfKsQqJGi+t9uCSNSJE/nio4ZPHB2WT7ylRI=', '8mVvck5pTbFJ59+JbyDoVA==', NULL, '2022-02-22 11:16:11', '2022-02-22 11:16:11'),
(68, 'App\\Models\\Auth\\User', 82, 'https://fcm.googleapis.com/fcm/send/cQctul0BIOo:APA91bH9UjWBIAmcNYHXQMAFUjOCvTM4zF77jDt4h9K0VdkVsNc25c4CTm_2a0TsHxhn5eGp-1fUiB8L08fbKukvzEGom7hkG5bGrWJMGEoDyOLTfwxkmwiOtWf8EwYVuNiLXqHs8ku8', 'BMZn3YPFLDpiYgEQAhf12MWpM8gwRCkEWh1BC2PQ74/xUMc3+g+A4fUVMFpG16LCpo5OMOADFhvlj4GLFNi4Zno=', 'I6J5qX8sqPAODCfVolj1tQ==', NULL, '2022-02-22 12:16:36', '2022-02-22 12:16:36'),
(70, 'App\\Models\\Auth\\User', 76, 'https://fcm.googleapis.com/fcm/send/dtxT-u9A-S4:APA91bHWLnYOkSB5j4AHS4FPjQ5ZuDjh7Q1WKCR5RHFqs-nRz9SOWw_w2f052UCS8svQdUu3U2Guj3ffjUbs8JU71dndejd86RVq9xfDxVaOFJwra9yECKzPAhOo74gg8cdHAjxaDvBQ', 'BGSN7IXzS4PqLWOlzebfx2QSgr2JIP51aHwrnLeZVIQZ88NiRwuPUyn9qHsv2UnQlbaZBg2UAg5Lr5aqHhPxvU8=', 'KqKrfyAcKJIOjfPnPxr2Mw==', NULL, '2022-02-22 14:09:48', '2022-02-22 14:09:48');

-- 
-- Вывод данных для таблицы push_questions
--
INSERT INTO push_questions VALUES
(1, 4, NULL, NULL, '<div  class="push-question">\n   <div> Вы недавно познакомились с 1 работодателем. Нанял ли вас кто-то из них?</div>\n</div>\n', 'no', 'acquaintance', '2021-09-02 10:53:22', NULL, '2021-08-30 10:30:35', '2021-08-30 10:53:22'),
(2, 4, 2, 8, '<div class="push-question">\n    <span>Вы открывали свои контакты</span>\n    <a href="" class="user" target="_blank">\n        <img src="/storage/userfiles/8/avatar/7VYnfaOlnO8FInJ58sSiErYGLO9I2NoGYBchDcNO.jpg" alt="Test Recruiter" class="user-avatar">\n        <span>\n            <b  class="user-name">Test Recruiter</b>\n            <span class="user-company">Director at Super HR</span>\n            <img src="/storage/userfiles/8/avatar/7VYnfaOlnO8FInJ58sSiErYGLO9I2NoGYBchDcNO.jpg"  class="company-avatar">\n        </span>\n    </a>\n    <span>на позицию <a href="http://jobzz.loc/vacancies/android-developer" target="_blank">"Android Developer"</a> были ли вы наняты в данную компанию?</span>\n</div>\r\n', NULL, 'vacancy-candidate', '2021-09-06 14:00:58', NULL, '2021-08-30 11:13:09', '2021-08-30 14:01:06'),
(3, 64, 12, 55, '<div class="push-question">\n    <span>Вы открывали свои контакты</span>\n    <a href="" class="user" target="_blank">\n        <img src="/images/no-avatar.svg" alt="Дина Шубина" class="user-avatar">\n        <span>\n            <b class="user-name">Дина Шубина</b>\n            <span class="user-company">Director  at ЗАО МясЛенОбл</span>\n                    </span>\n    </a>\n    <span>на позицию <a href="http://jobzz.loc/vacancies/12-other-manager" target="_blank">"Other Manager"</a> были ли вы наняты в данную компанию?</span>\n</div>\n', NULL, 'vacancy-candidate', '2021-10-14 10:14:35', NULL, '2021-09-20 15:30:11', '2021-10-07 10:14:35'),
(4, 54, 6, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/6-devopssysadmin-manager">"DevOps/Sysadmin Manager"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:13:48', NULL, '2022-01-27 15:13:48', '2022-01-27 15:13:48'),
(5, 54, 7, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/7-rubyror-developer">"Ruby/RoR Developer"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:13:48', NULL, '2022-01-27 15:13:48', '2022-01-27 15:13:48'),
(6, 54, 8, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/8-support-manager">"Support Manager"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:13:48', NULL, '2022-01-27 15:13:48', '2022-01-27 15:13:48'),
(7, 54, 9, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/9-uiuxdesign-manager">"UI/UX/Design Manager"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:13:48', NULL, '2022-01-27 15:13:48', '2022-01-27 15:13:48'),
(8, 54, 10, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/10-uiuxdesign-manager">"UI/UX/Design Manager"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:13:48', NULL, '2022-01-27 15:13:48', '2022-01-27 15:13:48'),
(9, 64, 11, 55, '<div class="push-question">\n    <span>Вы открывали свои контакты</span>\n    <a href="" class="user" target="_blank">\n        <img src="/storage/userfiles/55/avatar/vr3Z92lUbKN1D9gD1SntTgUCqcy2p76lE4T2mM8M.jpg" alt="Шубина Дина" class="user-avatar">\n        <span>\n            <b class="user-name">Шубина Дина</b>\n            <span class="user-company">Director  at ЗАО МясЛенОбл</span>\n                            <img src="/storage/userfiles/logo/4omprh7MMQWQC31y1pBE8RyMUKxocPs5WTdsW3mp.jpg" alt="ЗАО МясЛенОбл"\n                     class="company-avatar">\n                    </span>\n    </a>\n    <span>на позицию <a href="http://jobzz.loc/vacancies/11-uiuxdesign-manager" target="_blank">"UI/UX/Design Manager"</a> были ли вы наняты в данную компанию?</span>\n</div>\n', NULL, 'vacancy-candidate', '2022-01-27 15:13:48', NULL, '2022-01-27 15:13:48', '2022-01-27 15:13:48'),
(10, 55, 11, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/11-uiuxdesign-manager">"UI/UX/Design Manager"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:13:48', NULL, '2022-01-27 15:13:48', '2022-01-27 15:13:48'),
(11, 56, 16, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/16-data-science-manager">"Data Science Manager"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:13:48', NULL, '2022-01-27 15:13:48', '2022-01-27 15:13:48'),
(12, 56, 17, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/17-uiuxdesign-manager">"UI/UX/Design Manager"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:13:48', NULL, '2022-01-27 15:13:48', '2022-01-27 15:13:48'),
(13, 56, 18, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/18-support-manager">"Support Manager"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:13:48', NULL, '2022-01-27 15:13:48', '2022-01-27 15:13:48'),
(14, 56, 19, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/19-product-manager-manager">"Product Manager Manager"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:13:48', NULL, '2022-01-27 15:13:48', '2022-01-27 15:13:48'),
(15, 56, 20, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/20-support-manager">"Support Manager"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:13:48', NULL, '2022-01-27 15:13:48', '2022-01-27 15:13:48'),
(16, 57, 21, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/21-front-end-developer">"Front End Developer"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:13:48', NULL, '2022-01-27 15:13:48', '2022-01-27 15:13:48'),
(17, 57, 22, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/22-other-developer">"Other Developer"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:13:48', NULL, '2022-01-27 15:13:48', '2022-01-27 15:13:48'),
(18, 57, 23, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/23-uiuxdesign-manager">"UI/UX/Design Manager"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:13:48', NULL, '2022-01-27 15:13:48', '2022-01-27 15:13:48'),
(19, 57, 24, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/24-marketing-manager">"Marketing Manager"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:13:48', NULL, '2022-01-27 15:13:48', '2022-01-27 15:13:48'),
(20, 57, 25, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/25-php-developer">"PHP Developer"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:13:48', NULL, '2022-01-27 15:13:48', '2022-01-27 15:13:48'),
(21, 58, 26, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/26-hrrecruiter-manager">"HR/Recruiter Manager"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:13:48', NULL, '2022-01-27 15:13:48', '2022-01-27 15:13:48'),
(22, 58, 27, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/27-sales-manager">"Sales Manager"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Помог ли наш сайт закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:13:48', NULL, '2022-01-27 15:13:48', '2022-01-27 15:13:48'),
(23, 58, 28, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/28-java-developer">"Java Developer"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Помог ли наш сайт закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:13:48', NULL, '2022-01-27 15:13:48', '2022-01-27 15:13:48'),
(24, 58, 29, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/29-project-manager-manager">"Project Manager Manager"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Помог ли наш сайт закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:13:48', NULL, '2022-01-27 15:13:48', '2022-01-27 15:13:48'),
(25, 58, 30, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/30-front-end-developer">"Front End Developer"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Помог ли наш сайт закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:13:48', NULL, '2022-01-27 15:13:48', '2022-01-27 15:13:48'),
(26, 59, 31, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/31-qa-manager">"QA Manager"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:13:48', NULL, '2022-01-27 15:13:48', '2022-01-27 15:13:48'),
(27, 59, 32, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/32-uiuxdesign-manager">"UI/UX/Design Manager"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:13:48', NULL, '2022-01-27 15:13:48', '2022-01-27 15:13:48'),
(28, 59, 33, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/33-ueunityetc-manager">"UE/Unity/etc Manager"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:13:48', NULL, '2022-01-27 15:13:48', '2022-01-27 15:13:48'),
(29, 59, 34, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/34-full-stack-developer">"Full Stack Developer"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:13:48', NULL, '2022-01-27 15:13:48', '2022-01-27 15:13:48'),
(30, 59, 35, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/35-full-stack-developer">"Full Stack Developer"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:13:48', NULL, '2022-01-27 15:13:48', '2022-01-27 15:13:48'),
(31, 61, 43, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/43-java-developer">"Java Developer"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:16:28', NULL, '2022-01-27 15:16:28', '2022-01-27 15:16:28'),
(32, 61, 44, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/44-cnet-developer">"C#/.Net Developer"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:16:28', NULL, '2022-01-27 15:16:28', '2022-01-27 15:16:28'),
(33, 61, 45, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/45-ueunityetc-manager">"UE/Unity/etc Manager"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:16:28', NULL, '2022-01-27 15:16:28', '2022-01-27 15:16:28'),
(34, 62, 46, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/46-nodejs-developer">"Node.js Developer"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:16:28', NULL, '2022-01-27 15:16:28', '2022-01-27 15:16:28'),
(35, 62, 47, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/47-support-manager">"Support Manager"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:16:28', NULL, '2022-01-27 15:16:28', '2022-01-27 15:16:28'),
(36, 62, 48, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/48-seo-manager">"SEO Manager"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:16:28', NULL, '2022-01-27 15:16:28', '2022-01-27 15:16:28'),
(37, 62, 49, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/49-business-analyst-manager">"Business Analyst Manager"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:16:28', NULL, '2022-01-27 15:16:28', '2022-01-27 15:16:28'),
(38, 64, 50, 62, '<div class="push-question">\n    <span>Вы открывали свои контакты</span>\n    <a href="" class="user" target="_blank">\n        <img src="/images/no-avatar.svg" alt="Авдеева Жанна" class="user-avatar">\n        <span>\n            <b class="user-name">Авдеева Жанна</b>\n            <span class="user-company">Manager  at ПАО Хмель</span>\n                    </span>\n    </a>\n    <span>на позицию <a href="http://jobzz.loc/vacancies/50-android-developer" target="_blank">"Android Developer"</a> были ли вы наняты в данную компанию?</span>\n</div>\n', NULL, 'vacancy-candidate', '2022-01-27 15:16:28', NULL, '2022-01-27 15:16:28', '2022-01-27 15:16:28'),
(39, 62, 50, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/50-android-developer">"Android Developer"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:16:28', NULL, '2022-01-27 15:16:28', '2022-01-27 15:16:28'),
(40, 62, 54, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/54-c-test-vacancy">"C++ Test Vacancy"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:16:28', NULL, '2022-01-27 15:16:28', '2022-01-27 15:16:28'),
(41, 62, 55, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/55-c-test-vacancy">"C++ Test Vacancy"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:16:28', NULL, '2022-01-27 15:16:28', '2022-01-27 15:16:28'),
(42, 62, 56, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/56-c-test-vacancy">"C++ Test Vacancy"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:16:28', NULL, '2022-01-27 15:16:28', '2022-01-27 15:16:28'),
(43, 62, 57, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/57-c-test-vacancy">"C++ Test Vacancy"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:16:28', NULL, '2022-01-27 15:16:28', '2022-01-27 15:16:28'),
(44, 69, 58, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/58-test-c">"Test C#"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Подскажите, пожалуйста, помог ли наш ресурс закрыть данную вакансию?</span>\n</div>\n', NULL, 'vacancy-recruiter', '2022-01-27 15:16:28', NULL, '2022-01-27 15:16:28', '2022-01-27 15:16:28'),
(45, 68, 59, 76, '<div class="push-question">\n    <span>Вы открывали свои контакты</span>\n    <a href="" class="user" target="_blank">\n        <img src="/storage/userfiles/76/avatar/Kq6za7Y88nUto3jZZL2ShgyjXHbB6SbgR91shsaF.jpg" alt="Notify Test" class="user-avatar">\n        <span>\n            <b class="user-name">Notify Test</b>\n            <span class="user-company">Director  at Vadox Studio</span>\n                            <img src="/storage/userfiles/logo/XUvz5gt3rOmT8viVfBP08wXDdwM16fb8dRaQSlLt.png" alt="Vadox Studio"\n                     class="company-avatar">\n                    </span>\n    </a>\n    <span>на позицию <a href="http://jobzz.loc/vacancies/59-test-payment-vacancy" target="_blank">"Test Payment Vacancy / Very very long vacancy title for testing"</a> были ли вы наняты в данную компанию?</span>\n</div>\n', NULL, 'vacancy-candidate', '2022-01-27 15:16:28', NULL, '2022-01-27 15:16:28', '2022-01-27 15:16:28'),
(46, 76, 59, NULL, '<div class="push-question">\n    <span>Ваша вакансия <a href="http://jobzz.loc/vacancies/59-test-payment-vacancy">"Test Payment Vacancy / Very very long vacancy title for testing"</a> была автоматически закрыта и перемещена в архив.&nbsp;</span>\n    <span>Помог ли наш сайт закрыть данную вакансию?</span>\n</div>\n', 'still', 'vacancy-recruiter', '2022-01-27 15:16:28', NULL, '2022-01-27 15:16:28', '2022-01-27 16:17:59');

-- 
-- Вывод данных для таблицы personal_access_tokens
--
-- Таблица jobzzz.personal_access_tokens не содержит данных

-- 
-- Вывод данных для таблицы payouts
--
INSERT INTO payouts VALUES
(7, 1, 30, 8, 25, 1, NULL, '2021-07-30 00:00:00', '2021-08-26 23:59:59', NULL, 35000, 'RUB', NULL, '2021-08-27 12:51:11', '2021-08-27 17:05:03', NULL, 1, 0),
(8, 12, 63, 55, 32, 2, NULL, '2021-09-30 00:00:00', '2021-10-30 00:00:00', NULL, 20000, 'RUB', NULL, '2021-09-16 08:08:30', '2021-10-08 12:08:32', NULL, 0, 0),
(9, 12, 32, 55, 32, 1, NULL, '2021-09-30 00:00:00', '2021-10-30 00:00:00', NULL, 80000, 'RUB', 'userfiles/55//QM0QqWCFvPu4JFeVdLK29VabTttR54NAbXmIHb9G.docx', '2021-09-16 09:04:52', '2021-10-08 12:31:02', NULL, 0, 0),
(10, 15, 64, 55, 47, 1, NULL, '2021-09-23 00:00:00', '2021-10-10 00:00:00', '2021-10-16 09:25:12', 1, 'RUB', NULL, '2021-09-20 14:55:44', '2021-10-16 09:25:12', NULL, 1, 0),
(11, 50, 64, 62, 33, 3, NULL, '2021-10-21 00:00:00', '2021-11-05 00:00:00', NULL, 35000, 'RUB', NULL, '2021-10-07 11:32:05', '2022-01-27 15:12:21', NULL, 1, 0),
(12, 59, 35, 76, NULL, 0, NULL, '2021-11-24 22:00:00', '2021-12-24 22:00:00', NULL, 50000, 'RUB', NULL, '2021-11-01 09:15:45', '2022-01-27 15:12:24', NULL, 1, 0),
(13, 60, 68, 76, 50, 3, NULL, '2021-11-25 22:00:00', '2021-12-25 22:00:00', NULL, 20000, 'RUB', NULL, '2021-11-01 09:19:04', '2022-01-27 15:12:24', NULL, 1, 0);

-- 
-- Вывод данных для таблицы password_resets
--
-- Таблица jobzzz.password_resets не содержит данных

-- 
-- Вывод данных для таблицы password_histories
--
-- Таблица jobzzz.password_histories не содержит данных

-- 
-- Вывод данных для таблицы partners
--
INSERT INTO partners VALUES
(1, 'ОАО Телеком', 'ОАО Телеком', 'Perspiciatis esse architecto omnis ut temporibus velit quis. Non deleniti aut et totam. Omnis est quisquam reprehenderit rerum.', 'Perspiciatis esse architecto omnis ut temporibus velit quis. Non deleniti aut et totam. Omnis est quisquam reprehenderit rerum.', '/images/banner-04.png', 'oao-telekom', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(2, 'МФО РыбРечАвтоМашина', 'МФО РыбРечАвтоМашина', 'Voluptatem nostrum sunt aliquid explicabo dicta enim. Aspernatur aspernatur occaecati qui similique similique quasi qui necessitatibus. Laboriosam qui aperiam omnis voluptatem ut tempora.', 'Voluptatem nostrum sunt aliquid explicabo dicta enim. Aspernatur aspernatur occaecati qui similique similique quasi qui necessitatibus. Laboriosam qui aperiam omnis voluptatem ut tempora.', '/images/banner-01.png', 'mfo-rybrecavtomasina', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(3, 'ПАО ТехУралПив-М', 'ПАО ТехУралПив-М', 'Perferendis cum aliquid animi quaerat dolorum quia. Quia nulla ratione dolore. Assumenda delectus incidunt aut hic quod in. Modi et distinctio sed expedita qui adipisci.', 'Perferendis cum aliquid animi quaerat dolorum quia. Quia nulla ratione dolore. Assumenda delectus incidunt aut hic quod in. Modi et distinctio sed expedita qui adipisci.', '/images/banner-05.png', 'pao-texuralpiv-m', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(4, 'ОАО РыбСантехЖелДорТраст', 'ОАО РыбСантехЖелДорТраст', 'Iste expedita et blanditiis dolorem veritatis nam aut. Velit similique aut nam autem. Est dolorum iste recusandae adipisci quod.', 'Iste expedita et blanditiis dolorem veritatis nam aut. Velit similique aut nam autem. Est dolorum iste recusandae adipisci quod.', '/images/banner-02.png', 'oao-rybsantexzeldortrast', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(5, 'МФО СеверСевер', 'МФО СеверСевер', 'Eum saepe sed eos eum. Vero illum quod dolores voluptate ex. Et necessitatibus sit error qui quibusdam facilis. Et eveniet inventore autem fugiat.', 'Eum saepe sed eos eum. Vero illum quod dolores voluptate ex. Et necessitatibus sit error qui quibusdam facilis. Et eveniet inventore autem fugiat.', '/images/banner-02.png', 'mfo-seversever', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(6, 'ООО Компания АвтоТехМотор', 'ООО Компания АвтоТехМотор', 'Ullam eos neque incidunt illo. Commodi omnis consequuntur quisquam cupiditate. Dolores officia cupiditate iste quod.', 'Ullam eos neque incidunt illo. Commodi omnis consequuntur quisquam cupiditate. Dolores officia cupiditate iste quod.', '/images/banner-02.png', 'ooo-kompaniya-avtotexmotor', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(7, 'ЗАО Мор', 'ЗАО Мор', 'Quibusdam quaerat quis perferendis et consectetur dolorem at. Quidem neque vel sequi molestiae recusandae qui. Impedit facere sapiente laboriosam odit quisquam. Et ea illo vitae culpa.', 'Quibusdam quaerat quis perferendis et consectetur dolorem at. Quidem neque vel sequi molestiae recusandae qui. Impedit facere sapiente laboriosam odit quisquam. Et ea illo vitae culpa.', '/images/banner-02.png', 'zao-mor', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(8, 'ООО ТелеКрепЖелДор', 'ООО ТелеКрепЖелДор', 'Est exercitationem fugiat aut alias qui consequatur laborum. Totam eveniet hic esse in vitae. Harum non non laudantium magni quia dolores ab.', 'Est exercitationem fugiat aut alias qui consequatur laborum. Totam eveniet hic esse in vitae. Harum non non laudantium magni quia dolores ab.', '/images/banner-01.png', 'ooo-telekrepzeldor', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(9, 'МФО Cиб', 'МФО Cиб', 'Est impedit distinctio sequi nihil vero ut nesciunt voluptate. Excepturi facilis voluptas itaque tenetur quam tempore dolorum. Enim dolor asperiores quia nulla.', 'Est impedit distinctio sequi nihil vero ut nesciunt voluptate. Excepturi facilis voluptas itaque tenetur quam tempore dolorum. Enim dolor asperiores quia nulla.', '/images/banner-02.png', 'mfo-cib', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(10, 'ЗАО МорТомск', 'ЗАО МорТомск', 'Harum provident delectus et assumenda maxime sunt corrupti. Nisi consequatur at et eum. Rerum recusandae distinctio maiores sit non.', 'Harum provident delectus et assumenda maxime sunt corrupti. Nisi consequatur at et eum. Rerum recusandae distinctio maiores sit non.', '/images/banner-06.png', 'zao-mortomsk', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(11, 'ООО ТелекомИнфоТверьНаладка', 'ООО ТелекомИнфоТверьНаладка', 'Qui vero et alias quos. Animi dignissimos aperiam sunt quis veritatis. Assumenda aliquam est quibusdam esse. Veritatis reprehenderit accusamus suscipit omnis.', 'Qui vero et alias quos. Animi dignissimos aperiam sunt quis veritatis. Assumenda aliquam est quibusdam esse. Veritatis reprehenderit accusamus suscipit omnis.', '/images/banner-01.png', 'ooo-telekominfotvernaladka', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(12, 'ООО Орион', 'ООО Орион', 'Ratione autem voluptatem eius doloribus porro vel. Sit eveniet dolor est voluptas ut voluptatem et. Molestias nesciunt nobis veritatis perferendis libero rerum.', 'Ratione autem voluptatem eius doloribus porro vel. Sit eveniet dolor est voluptas ut voluptatem et. Molestias nesciunt nobis veritatis perferendis libero rerum.', '/images/banner-03.png', 'ooo-orion', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(13, 'ОАО СофтРадио', 'ОАО СофтРадио', 'Quae autem cupiditate illo. Dolor rerum cum ad exercitationem autem. Mollitia fugit dolore tempore dolorem assumenda necessitatibus.', 'Quae autem cupiditate illo. Dolor rerum cum ad exercitationem autem. Mollitia fugit dolore tempore dolorem assumenda necessitatibus.', '/images/banner-01.png', 'oao-softradio', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(14, 'МФО ЮпитерМясМяс', 'МФО ЮпитерМясМяс', 'Adipisci reiciendis dicta harum dolores fugiat repellendus. Tempore nisi delectus amet consectetur. Sit voluptatem enim nulla dolorum.', 'Adipisci reiciendis dicta harum dolores fugiat repellendus. Tempore nisi delectus amet consectetur. Sit voluptatem enim nulla dolorum.', '/images/banner-03.png', 'mfo-yupitermyasmyas', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(15, 'ОАО ИнжНефть', 'ОАО ИнжНефть', 'Sequi doloremque deserunt pariatur quam eum labore. Rem tempora sed laborum quaerat modi enim iusto quis. Expedita animi illo at sed quae necessitatibus. Quia sit blanditiis pariatur voluptas qui.', 'Sequi doloremque deserunt pariatur quam eum labore. Rem tempora sed laborum quaerat modi enim iusto quis. Expedita animi illo at sed quae necessitatibus. Quia sit blanditiis pariatur voluptas qui.', '/images/banner-05.png', 'oao-inzneft', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(16, 'ПАО ТелеЛен', 'ПАО ТелеЛен', 'Similique veritatis ut aliquam qui ex. Vero quibusdam et rem accusamus totam expedita officiis. Ut rerum et maxime maxime modi dignissimos.', 'Similique veritatis ut aliquam qui ex. Vero quibusdam et rem accusamus totam expedita officiis. Ut rerum et maxime maxime modi dignissimos.', '/images/banner-02.png', 'pao-telelen', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(17, 'ЗАО БухРос', 'ЗАО БухРос', 'Velit corporis esse qui quaerat est perspiciatis labore. Earum dolorem sapiente magni incidunt. Odio sed deleniti et quia a doloremque. Inventore aliquid quaerat ex enim voluptas eligendi.', 'Velit corporis esse qui quaerat est perspiciatis labore. Earum dolorem sapiente magni incidunt. Odio sed deleniti et quia a doloremque. Inventore aliquid quaerat ex enim voluptas eligendi.', '/images/banner-03.png', 'zao-buxros', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(18, 'МКК СеверМикроВодСнос', 'МКК СеверМикроВодСнос', 'Reiciendis tempore animi id nisi. Perspiciatis qui laborum ullam libero omnis aut quo. Aut nisi maiores omnis quos aspernatur quo accusantium beatae. Iste dolor consequatur distinctio enim eos harum.', 'Reiciendis tempore animi id nisi. Perspiciatis qui laborum ullam libero omnis aut quo. Aut nisi maiores omnis quos aspernatur quo accusantium beatae. Iste dolor consequatur distinctio enim eos harum.', '/images/banner-03.png', 'mkk-severmikrovodsnos', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(19, 'ЗАО Хмель', 'ЗАО Хмель', 'In similique sed consequatur veritatis hic. Qui maiores nihil corrupti consequatur architecto quo qui ut. Reiciendis et nisi aut omnis.', 'In similique sed consequatur veritatis hic. Qui maiores nihil corrupti consequatur architecto quo qui ut. Reiciendis et nisi aut omnis.', '/images/banner-05.png', 'zao-xmel', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(20, 'ЗАО ФлотГараж', 'ЗАО ФлотГараж', 'Vel deleniti eum vel sequi perferendis. At in voluptatem ut quidem ex. Quasi quia aut incidunt sed magni sed sunt occaecati.', 'Vel deleniti eum vel sequi perferendis. At in voluptatem ut quidem ex. Quasi quia aut incidunt sed magni sed sunt occaecati.', '/images/banner-03.png', 'zao-flotgaraz', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(21, 'ООО Компания ОблОблITПроф', 'ООО Компания ОблОблITПроф', 'Tempore eum aut consequatur. Officia aut ipsam molestiae inventore sed. Rerum perspiciatis delectus dicta.', 'Tempore eum aut consequatur. Officia aut ipsam molestiae inventore sed. Rerum perspiciatis delectus dicta.', '/images/banner-05.png', 'ooo-kompaniya-obloblitprof', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(22, 'ООО ГазСтройВод', 'ООО ГазСтройВод', 'Ut soluta ipsam culpa totam quia sed. Et at ut doloribus adipisci itaque fugit nihil. Repellat autem at sunt nihil. Aut omnis enim consequatur sunt ratione.', 'Ut soluta ipsam culpa totam quia sed. Et at ut doloribus adipisci itaque fugit nihil. Repellat autem at sunt nihil. Aut omnis enim consequatur sunt ratione.', '/images/banner-05.png', 'ooo-gazstroivod', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(23, 'ООО Компания ЦементРемМобайлСбыт', 'ООО Компания ЦементРемМобайлСбыт', 'Ex illum incidunt quo repellendus vel hic quisquam. Nihil voluptatem porro quam ab est quas.', 'Ex illum incidunt quo repellendus vel hic quisquam. Nihil voluptatem porro quam ab est quas.', '/images/banner-03.png', 'ooo-kompaniya-cementremmobailsbyt', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(24, 'МКК ФлотСтрой', 'МКК ФлотСтрой', 'Possimus libero animi quod pariatur. Nihil ut animi autem fugiat ratione ab. Illum id necessitatibus et rerum magnam non asperiores iusto. Est tempore delectus libero inventore.', 'Possimus libero animi quod pariatur. Nihil ut animi autem fugiat ratione ab. Illum id necessitatibus et rerum magnam non asperiores iusto. Est tempore delectus libero inventore.', '/images/banner-02.png', 'mkk-flotstroi', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(25, 'ЗАО Микро', 'ЗАО Микро', 'Modi et ut quia veniam. Sint et aspernatur voluptatum necessitatibus beatae numquam aut. Officia ut debitis exercitationem vitae in.', 'Modi et ut quia veniam. Sint et aspernatur voluptatum necessitatibus beatae numquam aut. Officia ut debitis exercitationem vitae in.', '/images/banner-03.png', 'zao-mikro', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(26, 'ООО МикроРечМетал', 'ООО МикроРечМетал', 'Optio quod nemo quia. Ut rem voluptatem sequi nulla perspiciatis. In ab dignissimos voluptate qui ea quia illum. Deserunt sunt tenetur ab quo.', 'Optio quod nemo quia. Ut rem voluptatem sequi nulla perspiciatis. In ab dignissimos voluptate qui ea quia illum. Deserunt sunt tenetur ab quo.', '/images/banner-05.png', 'ooo-mikrorecmetal', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(27, 'ООО Мяс', 'ООО Мяс', 'Aut voluptas unde doloremque maiores odit tempore. Iste ipsa facilis ipsum facilis. Veritatis odit tempora ab et sit non cum. Rem ut veniam saepe at. Est quos corporis nihil vel iure modi corporis.', 'Aut voluptas unde doloremque maiores odit tempore. Iste ipsa facilis ipsum facilis. Veritatis odit tempora ab et sit non cum. Rem ut veniam saepe at. Est quos corporis nihil vel iure modi corporis.', '/images/banner-04.png', 'ooo-myas', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(28, 'МКК МобайлИнфоТелеЛизинг', 'МКК МобайлИнфоТелеЛизинг', 'Sed est veniam quas nihil adipisci et cum consequuntur. Consequuntur et qui sapiente quia reiciendis minima. Magni nobis porro magni.', 'Sed est veniam quas nihil adipisci et cum consequuntur. Consequuntur et qui sapiente quia reiciendis minima. Magni nobis porro magni.', '/images/banner-03.png', 'mkk-mobailinfotelelizing', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(29, 'ООО Компания ВодДизайнМетизОпт', 'ООО Компания ВодДизайнМетизОпт', 'Soluta eos porro illo accusantium aspernatur quia et dolore. Incidunt quas mollitia at natus nesciunt. Est nisi et neque aspernatur. Est omnis nemo maiores alias sed eligendi id quod.', 'Soluta eos porro illo accusantium aspernatur quia et dolore. Incidunt quas mollitia at natus nesciunt. Est nisi et neque aspernatur. Est omnis nemo maiores alias sed eligendi id quod.', '/images/banner-03.png', 'ooo-kompaniya-voddizainmetizopt', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(30, 'МФО КазСтрой', 'МФО КазСтрой', 'Voluptates et repellendus tempora voluptatum qui sit asperiores exercitationem. Alias est commodi voluptas omnis mollitia ut eaque. In reiciendis ut tempore doloremque dolores facilis.', 'Voluptates et repellendus tempora voluptatum qui sit asperiores exercitationem. Alias est commodi voluptas omnis mollitia ut eaque. In reiciendis ut tempore doloremque dolores facilis.', '/images/banner-05.png', 'mfo-kazstroi', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(31, 'ОАО ДизайнРечМикроСнос', 'ОАО ДизайнРечМикроСнос', 'Veritatis neque hic consequatur necessitatibus quod. Et dolores ratione quibusdam a dolorum nemo et quia. Voluptatem vel eligendi et in totam.', 'Veritatis neque hic consequatur necessitatibus quod. Et dolores ratione quibusdam a dolorum nemo et quia. Voluptatem vel eligendi et in totam.', '/images/banner-01.png', 'oao-dizainrecmikrosnos', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(32, 'ОАО БухКаз', 'ОАО БухКаз', 'Nisi consequuntur consectetur velit esse. Rerum nemo voluptatem corrupti velit. Corrupti tempora incidunt ab hic autem. Dolorem incidunt assumenda adipisci.', 'Nisi consequuntur consectetur velit esse. Rerum nemo voluptatem corrupti velit. Corrupti tempora incidunt ab hic autem. Dolorem incidunt assumenda adipisci.', '/images/banner-04.png', 'oao-buxkaz', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(33, 'ООО ОмскУралCибЦентр', 'ООО ОмскУралCибЦентр', 'Vel officiis reiciendis blanditiis quisquam totam harum. Aspernatur deserunt quo qui rerum dolor tempora non. Culpa quia ullam quaerat voluptas.', 'Vel officiis reiciendis blanditiis quisquam totam harum. Aspernatur deserunt quo qui rerum dolor tempora non. Culpa quia ullam quaerat voluptas.', '/images/banner-03.png', 'ooo-omskuralcibcentr', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(34, 'ОАО Урал', 'ОАО Урал', 'Maiores voluptatem voluptas illo. Blanditiis et voluptas itaque eos cumque. Aut blanditiis error repudiandae.', 'Maiores voluptatem voluptas illo. Blanditiis et voluptas itaque eos cumque. Aut blanditiis error repudiandae.', '/images/banner-06.png', 'oao-ural', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(35, 'МКК ЖелДорРыбТверьМашина', 'МКК ЖелДорРыбТверьМашина', 'Minima omnis ea deleniti id. Rerum cumque doloribus eaque voluptatibus alias. Ipsum nihil nihil itaque quidem et assumenda et officiis.', 'Minima omnis ea deleniti id. Rerum cumque doloribus eaque voluptatibus alias. Ipsum nihil nihil itaque quidem et assumenda et officiis.', '/images/banner-05.png', 'mkk-zeldorrybtvermasina', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53'),
(36, 'ПАО ТелекомРеч', 'ПАО ТелекомРеч', 'Est aut impedit repellendus pariatur quia. Ea est soluta est dolor non et. Perspiciatis non aut placeat laboriosam accusamus id inventore.', 'Est aut impedit repellendus pariatur quia. Ea est soluta est dolor non et. Perspiciatis non aut placeat laboriosam accusamus id inventore.', '/images/banner-04.png', 'pao-telekomrec', 1, '2021-08-31 14:14:53', '2021-08-31 14:14:53');

-- 
-- Вывод данных для таблицы pages
--
INSERT INTO pages VALUES
(1, '{"en":"Terms of use JOBZZ.RU","ru":"\\u041f\\u0440\\u0430\\u0432\\u0438\\u043b\\u0430 \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u044f Jobzz.ru"}', '{"en":"Terms of use JOBZZ.RU","ru":"\\u041f\\u0440\\u0430\\u0432\\u0438\\u043b\\u0430 \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u044f Jobzz.ru"}', '{"ru":"\\u041f\\u0440\\u0430\\u0432\\u0438\\u043b\\u0430 \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u044f Jobzz.ru","en":"Terms of use"}', '{"ru":"\\u041f\\u0440\\u0430\\u0432\\u0438\\u043b\\u0430 \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u044f Jobzz.ru","en":"Terms of use"}', '{"ru":"\\u041f\\u0440\\u0430\\u0432\\u0438\\u043b\\u0430 \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u044f Jobzz.ru","en":"Terms of use"}', '{"ru":"<h2><strong>\\u041e\\u0431\\u0449\\u0438\\u0435 \\u043f\\u043e\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u044f<\\/strong><\\/h2>\\r\\n<p><span style=\\"font-weight: 400;\\">\\u0418\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u0443\\u044f \\u0441\\u0430\\u0439\\u0442 Jobzz.ru (\\u0432 \\u0434\\u0430\\u043b\\u044c\\u043d\\u0435\\u0439\\u0448\\u0435\\u043c \\"\\u0421\\u0435\\u0440\\u0432\\u0438\\u0441\\"), \\u0432\\u044b \\u0441\\u043e\\u0433\\u043b\\u0430\\u0448\\u0430\\u0435\\u0442\\u0435\\u0441\\u044c \\u0441 \\u043f\\u043e\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u044f\\u043c\\u0438, \\u043f\\u0440\\u0435\\u0434\\u0441\\u0442\\u0430\\u0432\\u043b\\u0435\\u043d\\u043d\\u044b\\u043c\\u0438 \\u0432 \\u044d\\u0442\\u043e\\u043c \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u0435 (\\"\\u0423\\u0441\\u043b\\u043e\\u0432\\u0438\\u044f \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u044f\\"), \\u0432\\u043a\\u043b\\u044e\\u0447\\u0430\\u044f \\u043b\\u044e\\u0431\\u044b\\u0435 \\u043f\\u043e\\u0441\\u043b\\u0435\\u0434\\u0443\\u044e\\u0449\\u0438\\u0435 \\u0438\\u0437\\u043c\\u0435\\u043d\\u0435\\u043d\\u0438\\u044f \\u0438\\u043b\\u0438 \\u043c\\u043e\\u0434\\u0438\\u0444\\u0438\\u043a\\u0430\\u0446\\u0438\\u0438. \\u0415\\u0441\\u043b\\u0438 \\u0432\\u044b \\u043d\\u0435 \\u0441\\u043e\\u0433\\u043b\\u0430\\u0441\\u043d\\u044b \\u0441 \\u044d\\u0442\\u0438\\u043c\\u0438 \\u0423\\u0441\\u043b\\u043e\\u0432\\u0438\\u044f\\u043c\\u0438 \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u044f, \\u0442\\u043e, \\u043f\\u043e\\u0436\\u0430\\u043b\\u0443\\u0439\\u0441\\u0442\\u0430, \\u043d\\u0435 \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u0443\\u0439\\u0442\\u0435 \\u0434\\u0430\\u043d\\u043d\\u044b\\u0439 \\u0421\\u0435\\u0440\\u0432\\u0438\\u0441.<\\/span><\\/p>\\r\\n<h2><strong>\\u041a\\u043e\\u043d\\u0444\\u0438\\u0434\\u0435\\u043d\\u0446\\u0438\\u0430\\u043b\\u044c\\u043d\\u043e\\u0441\\u0442\\u044c \\u0438 \\u0441\\u0432\\u044f\\u0437\\u044c<\\/strong><\\/h2>\\r\\n<p><span style=\\"font-weight: 400;\\">\\u0412\\u044b \\u043e\\u0441\\u043e\\u0437\\u043d\\u0430\\u0435\\u0442\\u0435 \\u0438 \\u0441\\u043e\\u0433\\u043b\\u0430\\u0448\\u0430\\u0435\\u0442\\u0435\\u0441\\u044c \\u0441 \\u0442\\u0435\\u043c, \\u0447\\u0442\\u043e \\u0421\\u0435\\u0440\\u0432\\u0438\\u0441 \\u043c\\u043e\\u0436\\u0435\\u0442 \\u043f\\u0435\\u0440\\u0438\\u043e\\u0434\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438 \\u043e\\u0442\\u043f\\u0440\\u0430\\u0432\\u043b\\u044f\\u0442\\u044c \\u0432\\u0430\\u043c \\u0443\\u0432\\u0435\\u0434\\u043e\\u043c\\u043b\\u0435\\u043d\\u0438\\u044f \\u0441 \\u043f\\u043e\\u043c\\u043e\\u0449\\u044c\\u044e \\u0441\\u043f\\u043e\\u0441\\u043e\\u0431\\u0430 \\u0441\\u0432\\u044f\\u0437\\u0438, \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0439 \\u0432\\u044b \\u0443\\u043a\\u0430\\u0437\\u0430\\u043b\\u0438. \\u0423\\u0432\\u0435\\u0434\\u043e\\u043c\\u043b\\u0435\\u043d\\u0438\\u044f \\u043c\\u043e\\u0433\\u0443\\u0442 \\u043a\\u0430\\u0441\\u0430\\u0442\\u044c\\u0441\\u044f \\u0432\\u0430\\u0448\\u0435\\u0439 \\u0443\\u0447\\u0435\\u0442\\u043d\\u043e\\u0439 \\u0437\\u0430\\u043f\\u0438\\u0441\\u0438, \\u0430 \\u0442\\u0430\\u043a\\u0436\\u0435 \\u043c\\u043e\\u0433\\u0443\\u0442 \\u0431\\u044b\\u0442\\u044c \\u0447\\u0430\\u0441\\u0442\\u044c\\u044e \\u0444\\u0443\\u043d\\u043a\\u0446\\u0438\\u043e\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0439 \\u0441\\u043e\\u0441\\u0442\\u0430\\u0432\\u043b\\u044f\\u044e\\u0449\\u0435\\u0439 \\u0421\\u0435\\u0440\\u0432\\u0438\\u0441\\u0430 \\u0438 \\u043c\\u043e\\u0433\\u0443\\u0442 \\u0432\\u043a\\u043b\\u044e\\u0447\\u0430\\u0442\\u044c \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u044f \\u0440\\u0435\\u043a\\u043b\\u0430\\u043c\\u043d\\u043e\\u0433\\u043e \\u0445\\u0430\\u0440\\u0430\\u043a\\u0442\\u0435\\u0440\\u0430.<\\/span><\\/p>\\r\\n<p><span style=\\"font-weight: 400;\\">\\u0421\\u043c\\u043e\\u0442\\u0440\\u0438\\u0442\\u0435 \\u0440\\u0430\\u0437\\u0434\\u0435\\u043b <\\/span><a href=\\"https:\\/\\/jobzz.ru\\/policy\\"><span style=\\"font-weight: 400;\\">\\u041f\\u043e\\u043b\\u0438\\u0442\\u0438\\u043a\\u0430 \\u0432 \\u043e\\u0442\\u043d\\u043e\\u0448\\u0435\\u043d\\u0438\\u0438 \\u043e\\u0431\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0438 \\u043f\\u0435\\u0440\\u0441\\u043e\\u043d\\u0430\\u043b\\u044c\\u043d\\u044b\\u0445 \\u0434\\u0430\\u043d\\u043d\\u044b\\u0445<\\/span><\\/a><span style=\\"font-weight: 400;\\">, \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0439 \\u044f\\u0432\\u043b\\u044f\\u0435\\u0442\\u0441\\u044f \\u0447\\u0430\\u0441\\u0442\\u044c\\u044e \\u044d\\u0442\\u043e\\u0433\\u043e \\u0441\\u043e\\u0433\\u043b\\u0430\\u0448\\u0435\\u043d\\u0438\\u044f.<\\/span><\\/p>\\r\\n<p><strong>&nbsp;<\\/strong><\\/p>\\r\\n<h2><strong>\\u0423\\u0447\\u0435\\u0442\\u043d\\u044b\\u0435 \\u0437\\u0430\\u043f\\u0438\\u0441\\u0438, \\u043f\\u0430\\u0440\\u043e\\u043b\\u0438 \\u0438 \\u0431\\u0435\\u0437\\u043e\\u043f\\u0430\\u0441\\u043d\\u043e\\u0441\\u0442\\u044c<\\/strong><\\/h2>\\r\\n<p><span style=\\"font-weight: 400;\\">\\u0412\\u044b \\u0434\\u043e\\u043b\\u0436\\u043d\\u044b \\u0431\\u044b\\u0442\\u044c \\u0437\\u0430\\u0440\\u0435\\u0433\\u0438\\u0441\\u0442\\u0440\\u0438\\u0440\\u043e\\u0432\\u0430\\u043d\\u043d\\u044b\\u043c \\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u0442\\u0435\\u043b\\u0435\\u043c \\u0421\\u0435\\u0440\\u0432\\u0438\\u0441\\u0430, \\u0437\\u0430 \\u0438\\u0441\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\\u0438\\u0435\\u043c \\u0442\\u0435\\u0445 \\u0441\\u043b\\u0443\\u0447\\u0430\\u0435\\u0432, \\u043a\\u043e\\u0433\\u0434\\u0430 C\\u0435\\u0440\\u0432\\u0438\\u0441 \\u043f\\u043e\\u0437\\u0432\\u043e\\u043b\\u044f\\u0435\\u0442 \\u0432\\u043e\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u0442\\u044c\\u0441\\u044f \\u0441\\u0432\\u043e\\u0435\\u0439 \\u0444\\u0443\\u043d\\u043a\\u0446\\u0438\\u043e\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0441\\u0442\\u044c\\u044e \\u0431\\u0435\\u0437 \\u0440\\u0435\\u0433\\u0438\\u0441\\u0442\\u0440\\u0430\\u0446\\u0438\\u0438. \\u0412\\u044b \\u0441\\u0430\\u043c\\u043e\\u0441\\u0442\\u043e\\u044f\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e \\u043e\\u0442\\u0432\\u0435\\u0447\\u0430\\u0435\\u0442\\u0435 \\u0437\\u0430 \\u0441\\u043e\\u0445\\u0440\\u0430\\u043d\\u043d\\u043e\\u0441\\u0442\\u044c \\u0441\\u0432\\u043e\\u0435\\u0433\\u043e \\u043f\\u0430\\u0440\\u043e\\u043b\\u044f. \\u0412\\u044b \\u043f\\u043e\\u043b\\u043d\\u043e\\u0441\\u0442\\u044c\\u044e \\u043e\\u0442\\u0432\\u0435\\u0442\\u0441\\u0442\\u0432\\u0435\\u043d\\u043d\\u044b \\u0437\\u0430 \\u043b\\u044e\\u0431\\u0443\\u044e \\u0430\\u043a\\u0442\\u0438\\u0432\\u043d\\u043e\\u0441\\u0442\\u044c, \\u043a\\u043e\\u0442\\u043e\\u0440\\u0430\\u044f \\u043f\\u0440\\u043e\\u0438\\u0441\\u0445\\u043e\\u0434\\u0438\\u0442 \\u043f\\u043e\\u0434 \\u0432\\u0430\\u0448\\u0435\\u0439 \\u0443\\u0447\\u0435\\u0442\\u043d\\u043e\\u0439 \\u0437\\u0430\\u043f\\u0438\\u0441\\u044c\\u044e.<\\/span><\\/p>\\r\\n<p><strong>&nbsp;<\\/strong><\\/p>\\r\\n<h2><strong>\\u0414\\u043e\\u043f\\u0443\\u0441\\u0442\\u0438\\u043c\\u043e\\u0435 \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435<\\/strong><\\/h2>\\r\\n<p><span style=\\"font-weight: 400;\\">\\u0412\\u044b \\u043f\\u043e\\u043b\\u043d\\u043e\\u0441\\u0442\\u044c\\u044e \\u043e\\u0442\\u0432\\u0435\\u0442\\u0441\\u0442\\u0432\\u0435\\u043d\\u043d\\u044b \\u0437\\u0430 \\u0446\\u0435\\u043b\\u0435\\u0432\\u043e\\u0435 \\u0438\\u043b\\u0438 \\u043d\\u0435\\u0446\\u0435\\u043b\\u0435\\u0432\\u043e\\u0435 \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0421\\u0435\\u0440\\u0432\\u0438\\u0441\\u0430 \\u0438 \\u0437\\u0430 \\u0432\\u0441\\u0435 \\u0434\\u0430\\u043d\\u043d\\u044b\\u0435, \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0435 \\u0432\\u044b \\u043f\\u0440\\u0435\\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043b\\u044f\\u0435\\u0442\\u0435. \\u0412\\u044b \\u0441\\u043e\\u0433\\u043b\\u0430\\u0448\\u0430\\u0435\\u0442\\u0435\\u0441\\u044c \\u043e\\u0433\\u0440\\u0430\\u0434\\u0438\\u0442\\u044c \\u0438 \\u0437\\u0430\\u0449\\u0438\\u0442\\u0438\\u0442\\u044c \\u0421\\u0435\\u0440\\u0432\\u0438\\u0441 \\u043e\\u0442 \\u043b\\u044e\\u0431\\u043e\\u0433\\u043e \\u0432\\u0440\\u0435\\u0434\\u0430, \\u0441\\u0442\\u043e\\u0438\\u043c\\u043e\\u0441\\u0442\\u0438, \\u043e\\u0442\\u0432\\u0435\\u0442\\u0441\\u0442\\u0432\\u0435\\u043d\\u043d\\u043e\\u0441\\u0442\\u0438 \\u0438 \\u0440\\u0430\\u0441\\u0445\\u043e\\u0434\\u043e\\u0432, \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0435 \\u043c\\u043e\\u0433\\u0443\\u0442 \\u0432\\u043e\\u0437\\u043d\\u0438\\u043a\\u043d\\u0443\\u0442\\u044c \\u0432 \\u0441\\u0432\\u044f\\u0437\\u0438 \\u0441 \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435\\u043c \\u0432\\u0430\\u0448\\u0438\\u0445 \\u0434\\u0430\\u043d\\u043d\\u044b\\u0445, \\u0438\\u043b\\u0438 \\u0432 \\u0441\\u0432\\u044f\\u0437\\u0438 \\u0441 \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435\\u043c \\u0421\\u0435\\u0440\\u0432\\u0438\\u0441\\u0430, \\u0438\\u043b\\u0438 \\u0432 \\u0441\\u0432\\u044f\\u0437\\u0438 \\u0441 \\u043d\\u0430\\u0440\\u0443\\u0448\\u0435\\u043d\\u0438\\u0435\\u043c \\u044d\\u0442\\u0438\\u0445 \\u043f\\u043e\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u0439.<\\/span><\\/p>\\r\\n<p><span style=\\"font-weight: 400;\\">\\u041f\\u0440\\u043e\\u0433\\u0440\\u0430\\u043c\\u043c\\u043d\\u043e\\u0435 \\u043e\\u0431\\u0435\\u0441\\u043f\\u0435\\u0447\\u0435\\u043d\\u0438\\u0435 \\u0421\\u0435\\u0440\\u0432\\u0438\\u0441\\u0430 \\u0441\\u043e\\u0437\\u0434\\u0430\\u043d\\u043e \\u0434\\u043b\\u044f \\u0442\\u043e\\u0433\\u043e, \\u0447\\u0442\\u043e\\u0431\\u044b \\u0431\\u044b\\u0442\\u044c \\u0434\\u043e\\u0441\\u0442\\u0443\\u043f\\u043d\\u044b\\u043c \\u0434\\u043b\\u044f \\u0432\\u0430\\u0441, \\u0432\\u0430\\u0448\\u0435\\u0439 \\u043a\\u043e\\u043c\\u043f\\u0430\\u043d\\u0438\\u0438 \\u0438\\/\\u0438\\u043b\\u0438 \\u0432\\u0430\\u0448\\u0438\\u0445 \\u043a\\u043b\\u0438\\u0435\\u043d\\u0442\\u043e\\u0432 \\u0442\\u043e\\u043b\\u044c\\u043a\\u043e \\u0434\\u043b\\u044f \\u043f\\u0435\\u0440\\u0441\\u043e\\u043d\\u0430\\u043b\\u044c\\u043d\\u043e\\u0433\\u043e \\u0438\\u043b\\u0438 \\u043a\\u043e\\u043c\\u043c\\u0435\\u0440\\u0447\\u0435\\u0441\\u043a\\u043e\\u0433\\u043e \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u044f, \\u043a\\u043e\\u0442\\u043e\\u0440\\u043e\\u0435 \\u0434\\u043e\\u043b\\u0436\\u043d\\u043e \\u0441\\u043e\\u0432\\u0435\\u0440\\u0448\\u0430\\u0442\\u044c\\u0441\\u044f \\u0432 \\u0441\\u043e\\u043e\\u0442\\u0432\\u0435\\u0442\\u0441\\u0442\\u0432\\u0438\\u0438 \\u0441\\u043e \\u0432\\u0441\\u0435\\u043c\\u0438 \\u043f\\u0440\\u0438\\u043c\\u0435\\u043d\\u0438\\u043c\\u044b\\u043c\\u0438 \\u0437\\u0430\\u043a\\u043e\\u043d\\u0430\\u043c\\u0438, \\u043f\\u0440\\u0430\\u0432\\u0438\\u043b\\u0430\\u043c\\u0438 \\u0438 \\u043f\\u0440\\u0435\\u0434\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u044f\\u043c\\u0438, \\u043d\\u0435 \\u043d\\u0430\\u0440\\u0443\\u0448\\u0430\\u044f \\u0438 \\u043d\\u0435 \\u043f\\u043e\\u0441\\u044f\\u0433\\u0430\\u044f \\u043d\\u0430 \\u043f\\u0440\\u0430\\u0432\\u0430 \\u0442\\u0440\\u0435\\u0442\\u044c\\u0438\\u0445 \\u043b\\u0438\\u0446.<\\/span><\\/p>\\r\\n<p><span style=\\"font-weight: 400;\\">\\u041b\\u044e\\u0431\\u043e\\u0435 \\u043d\\u0435\\u0430\\u0432\\u0442\\u043e\\u0440\\u0438\\u0437\\u043e\\u0432\\u0430\\u043d\\u043d\\u043e\\u0435 \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0421\\u0435\\u0440\\u0432\\u0438\\u0441\\u0430 \\u044f\\u0432\\u043b\\u044f\\u0435\\u0442\\u0441\\u044f \\u043d\\u0430\\u0440\\u0443\\u0448\\u0435\\u043d\\u0438\\u0435\\u043c \\u044d\\u0442\\u0438\\u0445 \\u043f\\u0440\\u0430\\u0432\\u0438\\u043b \\u0438 \\u0444\\u0435\\u0434\\u0435\\u0440\\u0430\\u043b\\u044c\\u043d\\u044b\\u0445 \\u0437\\u0430\\u043a\\u043e\\u043d\\u043e\\u0432. \\u042d\\u0442\\u0438 \\u043d\\u0430\\u0440\\u0443\\u0448\\u0435\\u043d\\u0438\\u044f \\u043c\\u043e\\u0433\\u0443\\u0442 \\u043f\\u0440\\u0438\\u0432\\u0435\\u0441\\u0442\\u0438 \\u043d\\u0435\\u0430\\u0432\\u0442\\u043e\\u0440\\u0438\\u0437\\u043e\\u0432\\u0430\\u043d\\u043d\\u043e\\u0433\\u043e \\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u0442\\u0435\\u043b\\u044f \\u0438 \\u0435\\u0433\\u043e \\u0438\\u043b\\u0438 \\u0435\\u0435 \\u0430\\u0433\\u0435\\u043d\\u0442\\u043e\\u0432 \\u043a \\u0433\\u0440\\u0430\\u0436\\u0434\\u0430\\u043d\\u0441\\u043a\\u043e\\u043c\\u0443 \\u0438\\u043b\\u0438 \\u0443\\u0433\\u043e\\u043b\\u043e\\u0432\\u043d\\u043e\\u043c\\u0443 \\u043d\\u0430\\u043a\\u0430\\u0437\\u0430\\u043d\\u0438\\u044e.<\\/span><\\/p>\\r\\n<p><strong>&nbsp;<\\/strong><\\/p>\\r\\n<h2><strong>\\u0423\\u0441\\u043b\\u043e\\u0432\\u0438\\u044f \\u043e\\u043f\\u043b\\u0430\\u0442\\u044b<\\/strong><\\/h2>\\r\\n<p><strong>&nbsp;<\\/strong><\\/p>\\r\\n<p><span style=\\"font-weight: 400;\\">\\u041e\\u043f\\u043b\\u0430\\u0442\\u0430 \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u0438\\u0442\\u0441\\u044f \\u0438\\u0441\\u043a\\u043b\\u044e\\u0447\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e \\u043f\\u043e \\u0444\\u0430\\u043a\\u0442\\u0443 \\u043d\\u0430\\u0439\\u043c\\u0430.<\\/span><span style=\\"font-weight: 400;\\"><br \\/><\\/span><span style=\\"font-weight: 400;\\">\\u0421\\u0443\\u043c\\u043c\\u0430 \\u0431\\u043e\\u043d\\u0443\\u0441\\u0430 \\u0437\\u0430 \\u043d\\u0430\\u0439\\u043c \\u0440\\u0430\\u0432\\u043d\\u0430 <\\/span><strong>10%<\\/strong><span style=\\"font-weight: 400;\\"> \\u043e\\u0442 \\u0441\\u0443\\u043c\\u043c\\u044b \\u0437\\u0430\\u0440\\u043f\\u043b\\u0430\\u0442\\u043d\\u044b\\u0445 \\u043f\\u043e\\u0436\\u0435\\u043b\\u0430\\u043d\\u0438\\u0439 \\u043a\\u0430\\u043d\\u0434\\u0438\\u0434\\u0430\\u0442\\u0430 \\u0432 \\u0435\\u0433\\u043e \\u043f\\u0440\\u043e\\u0444\\u0438\\u043b\\u0435 \\u043d\\u0430 jobzz.ru.<\\/span><span style=\\"font-weight: 400;\\"><br \\/><\\/span><span style=\\"font-weight: 400;\\">\\u041e\\u043f\\u043b\\u0430\\u0442\\u0443 \\u0442\\u0440\\u0435\\u0431\\u0443\\u0435\\u0442\\u0441\\u044f \\u0441\\u043e\\u0432\\u0435\\u0440\\u0448\\u0438\\u0442\\u044c \\u0432 \\u0442\\u0435\\u0447\\u0435\\u043d\\u0438\\u0435 30 \\u043a\\u0430\\u043b\\u0435\\u043d\\u0434\\u0430\\u0440\\u043d\\u044b\\u0445 \\u0434\\u043d\\u0435\\u0439 \\u043f\\u043e\\u0441\\u043b\\u0435 \\u0432\\u044b\\u0445\\u043e\\u0434\\u0430 \\u043d\\u0430\\u043d\\u044f\\u0442\\u043e\\u0433\\u043e \\u0441\\u043f\\u0435\\u0446\\u0438\\u0430\\u043b\\u0438\\u0441\\u0442\\u0430. \\u0415\\u0441\\u043b\\u0438 \\u0441\\u043f\\u0435\\u0446\\u0438\\u0430\\u043b\\u0438\\u0441\\u0442, \\u043a\\u043e\\u0442\\u043e\\u0440\\u043e\\u0433\\u043e \\u0432\\u044b \\u043d\\u0430\\u043d\\u044f\\u043b\\u0438 \\u0447\\u0435\\u0440\\u0435\\u0437 \\u043d\\u0430\\u0448 \\u0441\\u0430\\u0439\\u0442, \\u043d\\u0435 \\u0432\\u044b\\u0448\\u0435\\u043b \\u043d\\u0430 \\u0440\\u0430\\u0431\\u043e\\u0442\\u0443 \\u0438\\u043b\\u0438 \\u043e\\u0442\\u043a\\u0430\\u0437\\u0430\\u043b\\u0441\\u044f \\u043e\\u0442 \\u0432\\u0430\\u0448\\u0435\\u0433\\u043e \\u043f\\u0440\\u0435\\u0434\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u044f \\u043e \\u0440\\u0430\\u0431\\u043e\\u0442\\u0435 - \\u043e\\u043f\\u043b\\u0430\\u0442\\u0430 \\u0431\\u0443\\u0434\\u0435\\u0442 \\u0430\\u043d\\u043d\\u0443\\u043b\\u0438\\u0440\\u043e\\u0432\\u0430\\u043d\\u0430.<\\/span><\\/p>\\r\\n<h2>&nbsp;<\\/h2>\\r\\n<h2><strong>\\u041e\\u0442\\u043a\\u0430\\u0437 \\u043e\\u0442 \\u043e\\u0442\\u0432\\u0435\\u0442\\u0441\\u0442\\u0432\\u0435\\u043d\\u043d\\u043e\\u0441\\u0442\\u0438<\\/strong><\\/h2>\\r\\n<p><span style=\\"font-weight: 400;\\">\\u0421\\u0435\\u0440\\u0432\\u0438\\u0441 \\u043f\\u0440\\u0435\\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043b\\u044f\\u0435\\u0442\\u0441\\u044f \\"\\u043a\\u0430\\u043a \\u0435\\u0441\\u0442\\u044c\\". \\u0412\\u043b\\u0430\\u0434\\u0435\\u043b\\u0435\\u0446 \\u0421\\u0435\\u0440\\u0432\\u0438\\u0441\\u0430 \\u0438 \\u0435\\u0433\\u043e \\u043f\\u0430\\u0440\\u0442\\u043d\\u0435\\u0440\\u044b \\u043e\\u0442\\u043a\\u0430\\u0437\\u044b\\u0432\\u0430\\u044e\\u0442\\u0441\\u044f \\u043e\\u0442 \\u0433\\u0430\\u0440\\u0430\\u043d\\u0442\\u0438\\u0439 \\u043b\\u044e\\u0431\\u043e\\u0433\\u043e \\u0440\\u043e\\u0434\\u0430. \\u0412\\u044b \\u043e\\u0431\\u044f\\u0437\\u0443\\u0435\\u0442\\u0435\\u0441\\u044c \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u0442\\u044c \\u0441\\u0435\\u0440\\u0432\\u0438\\u0441 \\u043d\\u0430 \\u0441\\u0432\\u043e\\u0439 \\u0441\\u0442\\u0440\\u0430\\u0445 \\u0438 \\u0440\\u0438\\u0441\\u043a. \\u0412\\u044b \\u043f\\u0440\\u0438\\u043d\\u0438\\u043c\\u0430\\u0435\\u0442\\u0435 \\u043d\\u0430 \\u0441\\u0435\\u0431\\u044f \\u043f\\u043e\\u043b\\u043d\\u0443\\u044e \\u043e\\u0442\\u0432\\u0435\\u0442\\u0441\\u0442\\u0432\\u0435\\u043d\\u043d\\u043e\\u0441\\u0442\\u044c \\u0437\\u0430 \\u043b\\u044e\\u0431\\u043e\\u0439 \\u0432\\u0440\\u0435\\u0434, \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0439 \\u0432\\u044b \\u043f\\u043e\\u043d\\u0435\\u0441\\u043b\\u0438 \\u0432 \\u0440\\u0435\\u0437\\u0443\\u043b\\u044c\\u0442\\u0430\\u0442\\u0435 \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u044f \\u0421\\u0435\\u0440\\u0432\\u0438\\u0441\\u0430. \\u0412\\u044b \\u043f\\u0440\\u0438\\u043d\\u0438\\u043c\\u0430\\u0435\\u0442\\u0435 \\u043d\\u0430 \\u0441\\u0435\\u0431\\u044f \\u043b\\u044e\\u0431\\u043e\\u0439 \\u0440\\u0438\\u0441\\u043a, \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0439 \\u043a\\u0430\\u0441\\u0430\\u0435\\u0442\\u0441\\u044f \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u044f, \\u0431\\u0435\\u0437\\u043e\\u043f\\u0430\\u0441\\u043d\\u043e\\u0441\\u0442\\u0438 \\u0438\\u043b\\u0438 \\u0431\\u044b\\u0441\\u0442\\u0440\\u043e\\u0434\\u0435\\u0439\\u0441\\u0442\\u0432\\u0438\\u044f \\u0421\\u0435\\u0440\\u0432\\u0438\\u0441\\u0430.<\\/span><\\/p>\\r\\n<p><span style=\\"font-weight: 400;\\">\\u041f\\u0440\\u0438 \\u043b\\u044e\\u0431\\u044b\\u0445 \\u043e\\u0431\\u0441\\u0442\\u043e\\u044f\\u0442\\u0435\\u043b\\u044c\\u0441\\u0442\\u0432\\u0430\\u0445 \\u0432\\u043b\\u0430\\u0434\\u0435\\u043b\\u0435\\u0446 \\u0421\\u0435\\u0440\\u0432\\u0438\\u0441\\u0430 \\u0438 \\u0435\\u0433\\u043e \\u043f\\u0430\\u0440\\u0442\\u043d\\u0435\\u0440\\u044b \\u043d\\u0435 \\u043d\\u0435\\u0441\\u0443\\u0442 \\u043e\\u0442\\u0432\\u0435\\u0442\\u0441\\u0442\\u0432\\u0435\\u043d\\u043d\\u043e\\u0441\\u0442\\u0438 \\u0437\\u0430 \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0441\\u0435\\u0440\\u0432\\u0438\\u0441\\u0430, \\u0430 \\u0442\\u0430\\u043a\\u0436\\u0435 \\u0437\\u0430 \\u043f\\u0440\\u0438\\u0447\\u0438\\u043d\\u0435\\u043d\\u043d\\u044b\\u0439 \\u0443\\u0449\\u0435\\u0440\\u0431 \\u043b\\u044e\\u0431\\u043e\\u0433\\u043e \\u0440\\u043e\\u0434\\u0430, \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0439 \\u0432\\u043e\\u0437\\u043d\\u0438\\u043a \\u0432 \\u0441\\u043b\\u0435\\u0434\\u0441\\u0442\\u0432\\u0438\\u0438 \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u044f \\u0421\\u0435\\u0440\\u0432\\u0438\\u0441\\u0430. \\u041f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u0442\\u0435\\u043b\\u044c \\u0421\\u0435\\u0440\\u0432\\u0438\\u0441\\u0430 \\u0442\\u0430\\u043a\\u0436\\u0435 \\u043e\\u0431\\u044f\\u0437\\u0443\\u0435\\u0442\\u0441\\u044f \\u043e\\u0433\\u0440\\u0430\\u043d\\u0438\\u0447\\u0438\\u0442\\u044c \\u0432\\u043b\\u0430\\u0434\\u0435\\u043b\\u044c\\u0446\\u0430 \\u0421\\u0435\\u0440\\u0432\\u0438\\u0441\\u0430 \\u0438 \\u0435\\u0433\\u043e \\u043f\\u0430\\u0440\\u0442\\u043d\\u0435\\u0440\\u043e\\u0432 \\u043e\\u0442 \\u0441\\u0443\\u0434\\u0435\\u0431\\u043d\\u044b\\u0445 \\u0440\\u0430\\u0437\\u0431\\u0438\\u0440\\u0430\\u0442\\u0435\\u043b\\u044c\\u0441\\u0442\\u0432.<\\/span><\\/p>\\r\\n<p><strong>&nbsp;<\\/strong><\\/p>\\r\\n<h2><strong>\\u0423\\u0441\\u043b\\u043e\\u0432\\u0438\\u044f \\u0431\\u043b\\u043e\\u043a\\u0438\\u0440\\u043e\\u0432\\u043a\\u0438 \\u0443\\u0447\\u0451\\u0442\\u043d\\u043e\\u0439 \\u0437\\u0430\\u043f\\u0438\\u0441\\u0438 (\\u0430\\u043a\\u043a\\u0430\\u0443\\u043d\\u0442\\u0430)<\\/strong><\\/h2>\\r\\n<p><strong>&nbsp;<\\/strong><span style=\\"font-weight: 400;\\">\\u041c\\u044b \\u043e\\u0441\\u0442\\u0430\\u0432\\u043b\\u044f\\u0435\\u043c \\u0437\\u0430 \\u0441\\u043e\\u0431\\u043e\\u0439 \\u043f\\u0440\\u0430\\u0432\\u043e \\u0431\\u043b\\u043e\\u043a\\u0438\\u0440\\u043e\\u0432\\u043a\\u0438 \\u0438\\/\\u0438\\u043b\\u0438 \\u0443\\u0434\\u0430\\u043b\\u0435\\u043d\\u0438\\u044f \\u0430\\u043a\\u043a\\u0430\\u0443\\u043d\\u0442\\u0430 \\u0432 \\u0441\\u043b\\u0435\\u0434\\u0443\\u044e\\u0449\\u0438\\u0445 \\u0441\\u043b\\u0443\\u0447\\u0430\\u044f\\u0445:<\\/span><span style=\\"font-weight: 400;\\"><br \\/><\\/span><span style=\\"font-weight: 400;\\">- \\u041f\\u043e\\u043f\\u044b\\u0442\\u043a\\u0438 \\u043f\\u043e\\u043b\\u0443\\u0447\\u0435\\u043d\\u0438\\u044f \\u043a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u043d\\u043e\\u0439 \\u0438\\u043d\\u0444\\u043e\\u0440\\u043c\\u0430\\u0446\\u0438\\u0438 \\u043a\\u0430\\u043d\\u0434\\u0438\\u0434\\u0430\\u0442\\u0430 \\u0432 \\u043e\\u0431\\u0445\\u043e\\u0434 \\u043d\\u0430\\u0448\\u0435\\u0433\\u043e \\u0441\\u0430\\u0439\\u0442\\u0430;<\\/span><\\/p>\\r\\n<p><span style=\\"font-weight: 400;\\">- \\u041d\\u0435\\u043f\\u0440\\u0430\\u0432\\u0434\\u0438\\u0432\\u0430\\u044f \\u0438\\u043d\\u0444\\u043e\\u0440\\u043c\\u0430\\u0446\\u0438\\u044f \\u043e \\u0441\\u0435\\u0431\\u0435 \\u0438\\u043b\\u0438 \\u043a\\u043e\\u043c\\u043f\\u0430\\u043d\\u0438\\u0438 \\u0432 \\u043f\\u0440\\u043e\\u0444\\u0438\\u043b\\u0435;<\\/span><span style=\\"font-weight: 400;\\"><br \\/><\\/span><span style=\\"font-weight: 400;\\">- \\u041f\\u043e\\u0438\\u0441\\u043a \\u0441\\u043e\\u0442\\u0440\\u0443\\u0434\\u043d\\u0438\\u043a\\u043e\\u0432 \\u0434\\u043b\\u044f \\u0442\\u0440\\u0443\\u0434\\u043e\\u0443\\u0441\\u0442\\u0440\\u043e\\u0439\\u0441\\u0442\\u0432\\u0430 \\u0432 \\u043a\\u043e\\u043c\\u043f\\u0430\\u043d\\u0438\\u0438 \\u0447\\u044c\\u0438\\u043c \\u043f\\u0440\\u0435\\u0434\\u0441\\u0442\\u0430\\u0432\\u0438\\u0442\\u0435\\u043b\\u0435\\u043c \\u0432\\u044b \\u043d\\u0435 \\u044f\\u0432\\u043b\\u044f\\u0435\\u0442\\u0435\\u0441\\u044c;<\\/span><span style=\\"font-weight: 400;\\"><br \\/><\\/span><span style=\\"font-weight: 400;\\">- \\u041c\\u043d\\u043e\\u0436\\u0435\\u0441\\u0442\\u0432\\u0435\\u043d\\u043d\\u044b\\u0435 \\u0436\\u0430\\u043b\\u043e\\u0431\\u044b \\u043e\\u0442 \\u0434\\u0440\\u0443\\u0433\\u0438\\u0445 \\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u0442\\u0435\\u043b\\u0435\\u0439 \\u0421\\u0435\\u0440\\u0432\\u0438\\u0441\\u0430;<\\/span><span style=\\"font-weight: 400;\\"><br \\/><\\/span><span style=\\"font-weight: 400;\\">- \\u0420\\u0430\\u0437\\u043c\\u0435\\u0449\\u0435\\u043d\\u0438\\u0435 \\u043d\\u0435\\u0440\\u0435\\u043b\\u0435\\u0432\\u0430\\u043d\\u0442\\u043d\\u044b\\u0445 \\u0432\\u0430\\u043a\\u0430\\u043d\\u0441\\u0438\\u0439;<\\/span><\\/p>\\r\\n<p><span style=\\"font-weight: 400;\\">- \\u041d\\u0435\\u0443\\u043f\\u043b\\u0430\\u0442\\u0430 \\u0431\\u043e\\u043d\\u0443\\u0441\\u0430 \\u0437\\u0430 \\u043d\\u0430\\u0439\\u043c;<\\/span><\\/p>\\r\\n<p><span style=\\"font-weight: 400;\\">- \\u0420\\u0430\\u0441\\u0441\\u044b\\u043b\\u043a\\u0430 \\u0441\\u043f\\u0430\\u043c\\u0430 \\u043d\\u0430 \\u0421\\u0435\\u0440\\u0432\\u0438\\u0441\\u0435.<\\/span><span style=\\"font-weight: 400;\\"><br \\/><\\/span><span style=\\"font-weight: 400;\\"><br \\/><\\/span><span style=\\"font-weight: 400;\\">\\u0422\\u0430\\u043a \\u0436\\u0435 \\u043c\\u044b \\u043c\\u043e\\u0436\\u0435\\u043c, \\u043d\\u043e \\u043d\\u0435 \\u043e\\u0431\\u044f\\u0437\\u0443\\u0435\\u043c\\u0441\\u044f \\u0443\\u0434\\u0430\\u043b\\u044f\\u0442\\u044c \\u0443\\u0447\\u0435\\u0442\\u043d\\u044b\\u0435 \\u0437\\u0430\\u043f\\u0438\\u0441\\u0438 \\u0438 \\u0441\\u043e\\u0434\\u0435\\u0440\\u0436\\u0438\\u043c\\u043e\\u0435, \\u043a\\u043e\\u0442\\u043e\\u0440\\u043e\\u0435 \\u043c\\u044b \\u0441\\u0447\\u0438\\u0442\\u0430\\u0435\\u043c \\u043d\\u0435\\u0437\\u0430\\u043a\\u043e\\u043d\\u043d\\u044b\\u043c, \\u043e\\u0441\\u043a\\u043e\\u0440\\u0431\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u044b\\u043c, \\u0441\\u043e\\u0434\\u0435\\u0440\\u0436\\u0430\\u0449\\u0438\\u043c \\u0443\\u0433\\u0440\\u043e\\u0437\\u0443, \\u0434\\u0438\\u0441\\u043a\\u0440\\u0435\\u0434\\u0438\\u0442\\u0438\\u0440\\u0443\\u044e\\u0449\\u0435\\u0435, \\u043e\\u0441\\u043a\\u043e\\u0440\\u0431\\u043b\\u044f\\u044e\\u0449\\u0435\\u0435 \\u0434\\u0440\\u0443\\u0433\\u0438\\u0445 \\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u0442\\u0435\\u043b\\u0435\\u0439 \\u0421\\u0435\\u0440\\u0432\\u0438\\u0441\\u0430. \\u041c\\u044b \\u043c\\u043e\\u0436\\u0435\\u043c \\u0443\\u0434\\u0430\\u043b\\u0438\\u0442\\u044c \\u0441\\u043e\\u0434\\u0435\\u0440\\u0436\\u0438\\u043c\\u043e\\u0435, \\u043a\\u043e\\u0442\\u043e\\u0440\\u043e\\u0435 \\u043d\\u0430\\u0440\\u0443\\u0448\\u0430\\u0435\\u0442 \\u0447\\u044c\\u0438-\\u043b\\u0438\\u0431\\u043e \\u043f\\u0440\\u0430\\u0432\\u0430 \\u043d\\u0430 \\u0438\\u043d\\u0442\\u0435\\u043b\\u043b\\u0435\\u043a\\u0442\\u0443\\u0430\\u043b\\u044c\\u043d\\u0443\\u044e \\u0441\\u043e\\u0431\\u0441\\u0442\\u0432\\u0435\\u043d\\u043d\\u043e\\u0441\\u0442\\u044c \\u0438\\u043b\\u0438 \\u043d\\u0430\\u0440\\u0443\\u0448\\u0430\\u0435\\u0442 \\u044d\\u0442\\u0438 \\u0423\\u0441\\u043b\\u043e\\u0432\\u0438\\u044f \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u044f. \\u0423\\u0447\\u0435\\u0442\\u043d\\u0430\\u044f \\u0437\\u0430\\u043f\\u0438\\u0441\\u044c \\u043c\\u043e\\u0436\\u0435\\u0442 \\u0431\\u044b\\u0442\\u044c \\u043e\\u0442\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\\u0430 \\u0441 \\u043f\\u043e\\u043b\\u043d\\u044b\\u043c \\u0443\\u0434\\u0430\\u043b\\u0435\\u043d\\u0438\\u0435\\u043c \\u0432\\u0441\\u0435\\u0439 \\u0438\\u043d\\u0444\\u043e\\u0440\\u043c\\u0430\\u0446\\u0438\\u0438 \\u0441 \\u0434\\u0430\\u043d\\u043d\\u043e\\u0433\\u043e \\u0421\\u0435\\u0440\\u0432\\u0438\\u0441\\u0430.<\\/span><\\/p>\\r\\n<p><strong><br \\/><br \\/><\\/strong><\\/p>\\r\\n<h2><strong>\\u0414\\u0440\\u0443\\u0433\\u0438\\u0435 \\u0443\\u0441\\u043b\\u043e\\u0432\\u0438\\u044f<\\/strong><\\/h2>\\r\\n<p><span style=\\"font-weight: 400;\\">\\u041c\\u044b \\u043e\\u0441\\u0442\\u0430\\u0432\\u043b\\u044f\\u0435\\u043c \\u0437\\u0430 \\u0441\\u043e\\u0431\\u043e\\u0439 \\u043f\\u0440\\u0430\\u0432\\u043e \\u0438\\u0437\\u043c\\u0435\\u043d\\u044f\\u0442\\u044c \\u0438\\u043b\\u0438 \\u043e\\u0441\\u0442\\u0430\\u043d\\u0430\\u0432\\u043b\\u0438\\u0432\\u0430\\u0442\\u044c \\u0440\\u0430\\u0431\\u043e\\u0442\\u0443 \\u0421\\u0435\\u0440\\u0432\\u0438\\u0441\\u0430 \\u0432 \\u043b\\u044e\\u0431\\u043e\\u0435 \\u0432\\u0440\\u0435\\u043c\\u044f, \\u043f\\u043e \\u043b\\u044e\\u0431\\u043e\\u0439 \\u043f\\u0440\\u0438\\u0447\\u0438\\u043d\\u0435 \\u0438 \\u0431\\u0435\\u0437 \\u043f\\u0440\\u0435\\u0434\\u0443\\u043f\\u0440\\u0435\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f. \\u041c\\u044b \\u0441\\u043e\\u0445\\u0440\\u0430\\u043d\\u044f\\u0435\\u043c \\u0437\\u0430 \\u0441\\u043e\\u0431\\u043e\\u0439 \\u043f\\u0440\\u0430\\u0432\\u043e \\u0438\\u0437\\u043c\\u0435\\u043d\\u044f\\u0442\\u044c \\u043f\\u043e\\u043b\\u043e\\u0436\\u0435\\u043d\\u0438\\u0435 \\u043d\\u0430\\u0441\\u0442\\u043e\\u044f\\u0449\\u0435\\u0433\\u043e \\u0434\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u0430 (\\"\\u0423\\u0441\\u043b\\u043e\\u0432\\u0438\\u044f \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u044f\\") \\u0432 \\u043b\\u044e\\u0431\\u043e\\u0435 \\u0432\\u0440\\u0435\\u043c\\u044f \\u0431\\u0435\\u0437 \\u043f\\u0440\\u0435\\u0434\\u0443\\u043f\\u0440\\u0435\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f. \\u041f\\u043e\\u0436\\u0430\\u043b\\u0443\\u0439\\u0441\\u0442\\u0430, \\u043f\\u0440\\u043e\\u0441\\u043c\\u0430\\u0442\\u0440\\u0438\\u0432\\u0430\\u0439\\u0442\\u0435 \\u0423\\u0441\\u043b\\u043e\\u0432\\u0438\\u044f \\u0438\\u0441\\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u044f \\u043f\\u0435\\u0440\\u0438\\u043e\\u0434\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438, \\u0442.\\u043a. \\u043e\\u043d\\u0438 \\u043c\\u043e\\u0433\\u0443\\u0442 \\u0438\\u0437\\u043c\\u0435\\u043d\\u0438\\u0442\\u044c\\u0441\\u044f \\u0432 \\u0431\\u0443\\u0434\\u0443\\u0449\\u0435\\u043c.<\\/span><\\/p>\\r\\n<h2><strong>\\u0418\\u043d\\u0442\\u0435\\u043b\\u043b\\u0435\\u043a\\u0442\\u0443\\u0430\\u043b\\u044c\\u043d\\u0430\\u044f \\u0441\\u043e\\u0431\\u0441\\u0442\\u0432\\u0435\\u043d\\u043d\\u043e\\u0441\\u0442\\u044c<\\/strong><\\/h2>\\r\\n<p><span style=\\"font-weight: 400;\\">\\u0421\\u0435\\u0440\\u0432\\u0438\\u0441 \\u043d\\u0435 \\u043f\\u0440\\u0435\\u0442\\u0435\\u043d\\u0434\\u0443\\u0435\\u0442 \\u043d\\u0430 \\u0438\\u043d\\u0442\\u0435\\u043b\\u043b\\u0435\\u043a\\u0442\\u0443\\u0430\\u043b\\u044c\\u043d\\u044b\\u0435 \\u043f\\u0440\\u0430\\u0432\\u0430 \\u043d\\u0430 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b, \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0439 \\u0432\\u044b \\u0440\\u0430\\u0437\\u043c\\u0435\\u0449\\u0430\\u0435\\u0442\\u0435. \\u0412\\u044b \\u043f\\u0440\\u0438\\u0437\\u043d\\u0430\\u0435\\u0442\\u0435, \\u0447\\u0442\\u043e \\u0432\\u043b\\u0430\\u0434\\u0435\\u043b\\u0435\\u0446 \\u0421\\u0435\\u0440\\u0432\\u0438\\u0441\\u0430 \\u043e\\u0431\\u043b\\u0430\\u0434\\u0430\\u0435\\u0442 \\u0432\\u0441\\u0435\\u043c\\u0438 \\u0438\\u043d\\u0442\\u0435\\u043b\\u043b\\u0435\\u043a\\u0442\\u0443\\u0430\\u043b\\u044c\\u043d\\u044b\\u043c\\u0438 \\u043f\\u0440\\u0430\\u0432\\u0430\\u043c\\u0438 \\u043d\\u0430 \\u0421\\u0435\\u0440\\u0432\\u0438\\u0441 \\u0431\\u0435\\u0437 \\u0438\\u0441\\u043a\\u043b\\u044e\\u0447\\u0435\\u043d\\u0438\\u044f \\u0438 \\u0447\\u0442\\u043e \\u044d\\u0442\\u043e \\u043f\\u0440\\u0430\\u0432\\u043e \\u0437\\u0430\\u0449\\u0438\\u0449\\u0430\\u0435\\u0442\\u0441\\u044f \\u0437\\u0430\\u043a\\u043e\\u043d\\u0430\\u043c\\u0438 \\u0420\\u043e\\u0441\\u0441\\u0438\\u0439\\u0441\\u043a\\u043e\\u0439 \\u0424\\u0435\\u0434\\u0435\\u0440\\u0430\\u0446\\u0438\\u0438, \\u0430 \\u0442\\u0430\\u043a\\u0436\\u0435 \\u043c\\u0435\\u0436\\u0434\\u0443\\u043d\\u0430\\u0440\\u043e\\u0434\\u043d\\u044b\\u043c\\u0438 \\u0437\\u0430\\u043a\\u043e\\u043d\\u0430\\u043c\\u0438 \\u043d\\u0430 \\u0438\\u043d\\u0442\\u0435\\u043b\\u043b\\u0435\\u043a\\u0442\\u0443\\u0430\\u043b\\u044c\\u043d\\u0443\\u044e \\u0441\\u043e\\u0431\\u0441\\u0442\\u0432\\u0435\\u043d\\u043d\\u043e\\u0441\\u0442\\u044c. \\u0412\\u044b \\u0441\\u043e\\u0433\\u043b\\u0430\\u0448\\u0430\\u0435\\u0442\\u0435\\u0441\\u044c \\u0441 \\u0442\\u0435\\u043c, \\u0447\\u0442\\u043e \\u0432\\u044b \\u043d\\u0435 \\u0431\\u0443\\u0434\\u0435\\u0442\\u0435 \\u043a\\u043e\\u043f\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u044c, \\u0441\\u043e\\u0437\\u0434\\u0430\\u0432\\u0430\\u0442\\u044c \\u0440\\u0435\\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u0438, \\u0438\\u0437\\u043c\\u0435\\u043d\\u044f\\u0442\\u044c, \\u043c\\u043e\\u0434\\u0438\\u0444\\u0438\\u0446\\u0438\\u0440\\u043e\\u0432\\u0430\\u0442\\u044c \\u0438 \\u0441\\u043e\\u0437\\u0434\\u0430\\u0432\\u0430\\u0442\\u044c \\u043f\\u0440\\u043e\\u0438\\u0437\\u0432\\u043e\\u0434\\u043d\\u044b\\u0435 \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u044b \\u043d\\u0430 \\u043e\\u0441\\u043d\\u043e\\u0432\\u0435 \\u0421\\u0435\\u0440\\u0432\\u0438\\u0441\\u0430 \\u0438\\/\\u0438\\u043b\\u0438 \\u0435\\u0433\\u043e \\u043a\\u043e\\u043c\\u043f\\u043e\\u043d\\u0435\\u043d\\u0442\\u043e\\u0432.<\\/span><\\/p>","en":"<p><strong>Terms of use<\\/strong><\\/p>\\r\\n<p><strong><br \\/><\\/strong><strong>Payment:<\\/strong><strong><br \\/><\\/strong><span style=\\"font-weight: 400;\\">Payment is made solely upon hiring.<\\/span><span style=\\"font-weight: 400;\\"><br \\/><\\/span><span style=\\"font-weight: 400;\\">Posting vacancies is free, and there is no limit to the number of publications.<\\/span><span style=\\"font-weight: 400;\\"><br \\/><\\/span><span style=\\"font-weight: 400;\\">Hiring bonus is equal to <\\/span><strong>10%<\\/strong><span style=\\"font-weight: 400;\\"> of the candidate''s desired salary in their profile on jobzz.ru. If you hire a specialist using our service with the desired salary of 150,000 RUB per month, the fee will be 15,000 RUB.<\\/span><\\/p>\\r\\n<p><span style=\\"font-weight: 400;\\">If you post a job but don''t hire anyone, then you don''t need to pay.<\\/span><\\/p>\\r\\n<p><span style=\\"font-weight: 400;\\">There is no need to pay for specialists whose desired salaries are below <\\/span><strong>50,000 RUB<\\/strong><span style=\\"font-weight: 400;\\">.<\\/span><\\/p>\\r\\n<p><span style=\\"font-weight: 400;\\">Payment can be made in rubles, <\\/span><strong>$<\\/strong><span style=\\"font-weight: 400;\\"> or <\\/span><strong>&euro;<\\/strong><\\/p>\\r\\n<p><span style=\\"font-weight: 400;\\">If you have any questions about payment, you can always contact the support service on our website :)<\\/span><span style=\\"font-weight: 400;\\"><br \\/><br \\/><\\/span><\\/p>\\r\\n<p><strong>Payment period:<\\/strong><strong><br \\/><\\/strong><span style=\\"font-weight: 400;\\">Payment must be made within <\\/span><strong>30 calendar days<\\/strong><span style=\\"font-weight: 400;\\"> after the hired specialist takes up their position.<\\/span><\\/p>\\r\\n<p><span style=\\"font-weight: 400;\\">If the specialist you hired through our website did not come to work, or accepted the offer and then refused it, you will need to inform support, and we will cancel the payment.<\\/span><span style=\\"font-weight: 400;\\"><br \\/><br \\/><\\/span><\\/p>\\r\\n<p><strong>Account blocking:<\\/strong><strong><br \\/><\\/strong><span style=\\"font-weight: 400;\\">We reserve the right to block the employer''s account in the following cases:<\\/span><span style=\\"font-weight: 400;\\"><br \\/><\\/span><span style=\\"font-weight: 400;\\">- Attempts to obtain the contact information of the candidate bypassing our site;<\\/span><span style=\\"font-weight: 400;\\"><br \\/><\\/span><span style=\\"font-weight: 400;\\">- Fake information about yourself or the company in the profile;<\\/span><span style=\\"font-weight: 400;\\"><br \\/><\\/span><span style=\\"font-weight: 400;\\">- Search for employees for employment in other companies;<\\/span><span style=\\"font-weight: 400;\\"><br \\/><\\/span><span style=\\"font-weight: 400;\\">- Multiple complaints from candidates;<\\/span><span style=\\"font-weight: 400;\\"><br \\/><\\/span><span style=\\"font-weight: 400;\\">- Placement of irrelevant vacancies;<\\/span><span style=\\"font-weight: 400;\\"><br \\/><\\/span><span style=\\"font-weight: 400;\\">- Failure to pay the bonus for hiring;<\\/span><span style=\\"font-weight: 400;\\"><br \\/><\\/span><span style=\\"font-weight: 400;\\">- Spam distribution on the site.<\\/span><\\/p>"}', 'terms', 1, '2021-08-31 14:14:34', '2021-09-20 11:42:17'),
(2, '{"en":"Privacy Policy","ru":"\\u041f\\u043e\\u043b\\u0438\\u0442\\u0438\\u043a\\u0430 \\u043a\\u043e\\u043d\\u0444\\u0438\\u0434\\u0435\\u043d\\u0446\\u0438\\u0430\\u043b\\u044c\\u043d\\u043e\\u0441\\u0442\\u0438"}', '{"en":"Privacy Policy","ru":"\\u041f\\u043e\\u043b\\u0438\\u0442\\u0438\\u043a\\u0430 \\u043a\\u043e\\u043d\\u0444\\u0438\\u0434\\u0435\\u043d\\u0446\\u0438\\u0430\\u043b\\u044c\\u043d\\u043e\\u0441\\u0442\\u0438"}', NULL, NULL, NULL, '{"ru":"\\u041d\\u043e\\u0437\\u0434\\u0440\\u0435\\u0432\\u0430, \\u0432\\u043e\\u0434\\u0438\\u043b\\u0430\\u0441\\u044c \\u0440\\u044b\\u0431\\u0430 \\u0442\\u0430\\u043a\\u043e\\u0439 \\u0432\\u0435\\u043b\\u0438\\u0447\\u0438\\u043d\\u044b, \\u0447\\u0442\\u043e \\u0434\\u0432\\u0430 \\u0447\\u0435\\u043b\\u043e\\u0432\\u0435\\u043a\\u0430 \\u0441 \\u0442\\u0440\\u0443\\u0434\\u043e\\u043c \\u043c\\u043e\\u0436\\u043d\\u043e \\u0431\\u044b\\u043b\\u043e \\u043f\\u043e\\u0433\\u043e\\u0432\\u043e\\u0440\\u0438\\u0442\\u044c \\u0441 \\u0432\\u0430\\u043c\\u0438 \\u0440\\u0430\\u0441\\u0441\\u0442\\u0430\\u044e\\u0441\\u044c \\u043d\\u0435 \\u0434\\u043e\\u043b\\u0435\\u0435 \\u2014 \\u043a\\u0430\\u043a \\u043d\\u0430 \\u043a\\u043e\\u0433\\u043e \\u0441\\u043c\\u043e\\u0442\\u0440\\u0435\\u0442\\u044c, \\u0432\\u0441\\u044f\\u043a\\u0443\\u044e \\u043c\\u0438\\u043d\\u0443\\u0442\\u0443 \\u0431\\u0443\\u0434\\u0435\\u0442 \\u0431\\u043e\\u044f\\u0442\\u044c\\u0441\\u044f, \\u0447\\u0442\\u043e\\u0431\\u044b \\u043d\\u0435 \\u0432\\u0445\\u043e\\u0434\\u0438\\u0442\\u044c \\u0432 \\u0434\\u0430\\u043b\\u044c\\u043d\\u0435\\u0439\\u0448\\u0438\\u0435 \\u0440\\u0430\\u0437\\u0433\\u043e\\u0432\\u043e\\u0440\\u044b \\u043f\\u043e \\u044d\\u0442\\u043e\\u0439 \\u0447\\u0430\\u0441\\u0442\\u0438, \\u043f\\u043e \\u043f\\u043e\\u043b\\u0442\\u043e\\u0440\\u0430 \\u2014 \\u0440\\u0443\\u0431\\u043b\\u0438, \\u0438\\u0437\\u0432\\u043e\\u043b\\u044c\\u0442\\u0435, \\u0434\\u0430\\u043c, \\u0430 \\u0431\\u043e\\u043b\\u044c\\u0448\\u0435 \\u043d\\u0435 \\u043c\\u043e\\u0433\\u0443. \\u2014 \\u0410! \\u0442\\u0430\\u043a \\u0442\\u044b \\u043d\\u0435 \\u0445\\u043e\\u0447\\u0435\\u0448\\u044c \\u0438\\u0433\\u0440\\u0430\\u0442\\u044c? \\u2014 \\u0433\\u043e\\u0432\\u043e\\u0440\\u0438\\u043b \\u041d\\u043e\\u0437\\u0434\\u0440\\u0435\\u0432, \\u2014 \\u0438\\u043c\\u0435\\u043d\\u043d\\u043e \\u043d\\u0435 \\u0431\\u043e\\u043b\\u044c\\u0448\\u0435 \\u043a\\u0430\\u043a \\u0434\\u0432\\u0430\\u0434\\u0446\\u0430\\u0442\\u044c, \\u044f \\u2014 \\u0442\\u0435\\u0431\\u0435 \\u0434\\u0430\\u043b \\u043f\\u044f\\u0442\\u044c\\u0434\\u0435\\u0441\\u044f\\u0442 \\u0440\\u0443\\u0431\\u043b\\u0435\\u0439, \\u0442\\u0443\\u0442 \\u0436\\u0435 \\u0447\\u0443\\u0431\\u0443\\u043a \\u0441 \\u0442\\u0440\\u0443\\u0431\\u043a\\u043e\\u044e \\u043d\\u0430 \\u043f\\u043e\\u043b \\u0438 \\u043d\\u0438 \\u0443\\u0432\\u0435\\u0440\\u044f\\u043b, \\u0447\\u0442\\u043e \\u043e\\u043d \\u2014 \\u043f\\u0440\\u0438\\u043b\\u0433\\u043d\\u0443\\u043b, \\u0445\\u043e\\u0442\\u044c \\u0438 \\u0432\\u0441\\u043a\\u043e\\u043b\\u044c\\u0437\\u044c \\u0438 \\u0431\\u0435\\u0437 \\u0442\\u043e\\u043b\\u043a\\u0443 \\u0433\\u043e\\u0442\\u043e\\u0432\\u0438\\u0442\\u0441\\u044f \\u043d\\u0430 \\u043a\\u0443\\u0445\\u043d\\u0435? \\u0437\\u0430\\u0447\\u0435\\u043c \\u0434\\u043e\\u0432\\u043e\\u043b\\u044c\\u043d\\u043e \\u043f\\u0443\\u0441\\u0442\\u043e \\u0432 \\u043a\\u043b\\u0430\\u0434\\u043e\\u0432\\u043e\\u0439? \\u0437\\u0430\\u0447\\u0435\\u043c \\u0432\\u043e\\u0440\\u043e\\u0432\\u043a\\u0430 \\u043a\\u043b\\u044e\\u0447\\u043d\\u0438\\u0446\\u0430? \\u0437\\u0430\\u0447\\u0435\\u043c \\u043d\\u0435\\u0447\\u0438\\u0441\\u0442\\u043e\\u043f\\u043b\\u043e\\u0442\\u043d\\u044b \\u0438 \\u043f\\u044c\\u044f\\u043d\\u0438\\u0446\\u044b \\u0441\\u043b\\u0443\\u0433\\u0438? \\u0437\\u0430\\u0447\\u0435\\u043c \\u0432\\u0441\\u044f \\u0434\\u0432\\u043e\\u0440\\u043d\\u044f \\u0441\\u043f\\u0438\\u0442 \\u043d\\u0435\\u043c\\u0438\\u043b\\u043e\\u0441\\u0435\\u0440\\u0434\\u044b\\u043c \\u043e\\u0431\\u0440\\u0430\\u0437\\u043e\\u043c \\u0438 \\u0434\\u043b\\u044f \\u0447\\u0435\\u0433\\u043e, \\u043f\\u043e\\u043c\\u0435\\u0441\\u0442\\u0438\\u043b\\u0441\\u044f \\u0411\\u0430\\u0433\\u0440\\u0430\\u0442\\u0438\\u043e\\u043d, \\u0442\\u043e\\u0449\\u0438\\u0439, \\u0445\\u0443\\u0434\\u0435\\u043d\\u044c\\u043a\\u0438\\u0439, \\u0441 \\u043c\\u0430\\u043b\\u0435\\u043d\\u044c\\u043a\\u0438\\u043c\\u0438 \\u0437\\u043d\\u0430\\u043c\\u0435\\u043d\\u0430\\u043c\\u0438 \\u0438 \\u043f\\u0443\\u0448\\u043a\\u0430\\u043c\\u0438 \\u0432\\u043d\\u0438\\u0437\\u0443 \\u0438 \\u0432 \\u0442\\u043e \\u0436\\u0435 \\u0432\\u0440\\u0435\\u043c\\u044f \\u0443\\u0432\\u0438\\u0434\\u0435\\u043b \\u043f\\u0435\\u0440\\u0435\\u0434 \\u0441\\u0430\\u043c\\u044b\\u043c \\u2014 \\u043d\\u043e\\u0441\\u043e\\u043c \\u0441\\u0432\\u043e\\u0438\\u043c \\u0434\\u0440\\u0443\\u0433\\u0443\\u044e, \\u043a\\u043e\\u0442\\u043e\\u0440\\u0430\\u044f, \\u043a\\u0430\\u043a \\u043a\\u0430\\u0437\\u0430\\u043b\\u043e\\u0441\\u044c, \\u043f\\u0440\\u0438\\u0433\\u043b\\u044f\\u0434\\u044b\\u0432\\u0430\\u043b\\u0441\\u044f, \\u0436\\u0435\\u043b\\u0430\\u044f \\u0437\\u043d\\u0430\\u0442\\u044c, \\u043a\\u0443\\u0434\\u0430 \\u0433\\u043e\\u0441\\u0442\\u044c \\u043f\\u043e\\u0435\\u0434\\u0435\\u0442. \\u2014 \\u041f\\u043e\\u0434\\u043b\\u0435\\u0446, \\u0434\\u043e \\u0441\\u0438\\u0445 \\u043f\\u043e\\u0440 \\u0442\\u0430\\u043a \\u0437\\u0434\\u043e\\u0440\\u043e\\u0432, \\u043a\\u0430\\u043a \\u2014 \\u043f\\u043e\\u0434\\u0430\\u0432\\u0430\\u043b\\u0438 \\u0440\\u0435\\u0432\\u0438\\u0437\\u0438\\u044e? \\u2014 \\u0414\\u0430 \\u043e\\u0442\\u0447\\u0435\\u0433\\u043e \\u0436? \\u2014 \\u0441\\u043a\\u0430\\u0437\\u0430\\u043b \\u041d\\u043e\\u0437\\u0434\\u0440\\u0435\\u0432. \\u2014 \\u0412\\u0441\\u0435, \\u0447\\u0442\\u043e \\u043d\\u0438 \\u0435\\u0441\\u0442\\u044c, \\u043f\\u043e\\u0440\\u044b\\u0432\\u0430\\u0435\\u0442\\u0441\\u044f \\u043a\\u0432\\u0435\\u0440\\u0445\\u0443, \\u0437\\u0430\\u043a\\u0438\\u0434\\u044b\\u0432\\u0430\\u044f \\u0433\\u043e\\u043b\\u043e\\u0432\\u0443, \\u0430 \\u043e\\u043d \\u043e\\u0434\\u0438\\u043d, \\u0437\\u0430\\u0441\\u0443\\u043d\\u0443\\u0432\\u0448\\u0438 \\u043d\\u0435\\u0431\\u0440\\u0438\\u0442\\u044b\\u0439 \\u043f\\u043e\\u0434\\u0431\\u043e\\u0440\\u043e\\u0434\\u043e\\u043a \\u0432 \\u0433\\u0430\\u043b\\u0441\\u0442\\u0443\\u043a, \\u043f\\u0440\\u0438\\u0441\\u0435\\u0432 \\u0438 \\u043e\\u043f\\u0443\\u0441\\u0442\\u0438\\u0432\\u0448\\u0438\\u0441\\u044c \\u043f\\u043e\\u0447\\u0442\\u0438 \\u0434\\u043e \\u0437\\u0435\\u043c\\u043b\\u0438, \\u043f\\u0440\\u043e\\u043f\\u0443\\u0441\\u043a\\u0430\\u0435\\u0442 \\u043e\\u0442\\u0442\\u0443\\u0434\\u0430 \\u0441\\u0432\\u043e\\u044e \\u043d\\u043e\\u0442\\u0443, \\u043e\\u0442 \\u043a\\u043e\\u0442\\u043e\\u0440\\u043e\\u0439 \\u0443 \\u043d\\u0435\\u0433\\u043e \\u0432\\u044b\\u0441\\u043e\\u0447\\u0430\\u0439\\u0448\\u0443\\u044e \\u0442\\u043e\\u0447\\u043a\\u0443 \\u0441\\u043e\\u0432\\u0435\\u0440\\u0448\\u0435\\u043d\\u0441\\u0442\\u0432\\u0430. \\u0417\\u0430\\u043a\\u0443\\u0441\\u0438\\u0432\\u0448\\u0438 \\u0431\\u0430\\u043b\\u044b\\u043a\\u043e\\u043c, \\u043e\\u043d\\u0438 \\u0441\\u0435\\u043b\\u0438 \\u0437\\u0430 \\u0437\\u0435\\u043b\\u0435\\u043d\\u044b\\u0439 \\u0441\\u0442\\u043e\\u043b \\u0438 \\u0441\\u0436\\u0430\\u043b\\u0430 \\u0431\\u0430\\u0442\\u0438\\u0441\\u0442\\u043e\\u0432\\u044b\\u0439 \\u043f\\u043b\\u0430\\u0442\\u043e\\u043a \\u0441 \\u0432\\u044b\\u0448\\u0438\\u0442\\u044b\\u043c\\u0438 \\u0443\\u0433\\u043e\\u043b\\u043a\\u0430\\u043c\\u0438. \\u041e\\u043d\\u0430 \\u043f\\u043e\\u0434\\u043d\\u044f\\u043b\\u0430\\u0441\\u044c \\u0441 \\u0434\\u0438\\u0432\\u0430\\u043d\\u0430, \\u043d\\u0430 \\u043a\\u043e\\u0442\\u043e\\u0440\\u043e\\u043c \\u0441\\u0438\\u0434\\u0435\\u043b\\u0430; \\u0427\\u0438\\u0447\\u0438\\u043a\\u043e\\u0432 \\u043d\\u0435 \\u0431\\u0435\\u0437 \\u043d\\u0435\\u043a\\u043e\\u0442\\u043e\\u0440\\u043e\\u0433\\u043e \\u0432\\u043e\\u043b\\u043d\\u0435\\u043d\\u0438\\u044f \\u043e\\u0442\\u0432\\u0435\\u0442\\u0430. \\u2014 \\u0412\\u0430\\u043c \\u043d\\u0443\\u0436\\u043d\\u043e \\u043c\\u0435\\u0440\\u0442\\u0432\\u044b\\u0445 \\u0434\\u0443\\u0448? \\u2014 \\u0414\\u0443\\u0448-\\u0442\\u043e \\u0432 \\u043d\\u0435\\u0439, \\u043a\\u0430\\u043a \\u0433\\u043e\\u0432\\u043e\\u0440\\u0438\\u0442\\u0441\\u044f, \\u043d\\u0435\\u0442 \\u0435\\u0449\\u0435 \\u043d\\u0438\\u0447\\u0435\\u0433\\u043e \\u0431\\u0430\\u0431\\u044c\\u0435\\u0433\\u043e, \\u0442\\u043e \\u0435\\u0441\\u0442\\u044c \\u043d\\u0430 \\u0432\\u0441\\u0435, \\u0441\\u0442\\u0430\\u043b\\u043e \\u0431\\u044b\\u0442\\u044c \\u043d\\u0443\\u0436\\u0435\\u043d. \\u0417\\u0434\\u0435\\u0441\\u044c \\u0427\\u0438\\u0447\\u0438\\u043a\\u043e\\u0432 \\u0437\\u0430\\u043a\\u0443\\u0441\\u0438\\u043b \\u0433\\u0443\\u0431\\u0443 \\u0438 \\u043d\\u0435."}', 'policy', 1, '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(3, '{"en":"About the platform","ru":"\\u041e \\u043f\\u043b\\u0430\\u0442\\u0444\\u043e\\u0440\\u043c\\u0435"}', '{"en":"About the platform","ru":"\\u041e \\u043f\\u043b\\u0430\\u0442\\u0444\\u043e\\u0440\\u043c\\u0435"}', NULL, NULL, NULL, '{"ru":"\\u0427\\u0438\\u0447\\u0438\\u043a\\u043e\\u0432, \\u043d\\u0435\\u0441\\u043c\\u043e\\u0442\\u0440\\u044f \\u043d\\u0430 \\u0442\\u043e \\u0447\\u0442\\u043e \\u043f\\u0440\\u043e\\u043a\\u0443\\u0440\\u043e\\u0440 \\u0438 \\u0432\\u0441\\u0435 \\u0433\\u0443\\u0431\\u0435\\u0440\\u043d\\u0441\\u043a\\u0438\\u0435 \\u0441\\u043a\\u0440\\u044f\\u0433\\u0438 \\u0432 \\u043d\\u0430\\u0448\\u0435\\u043c \\u0433\\u043e\\u0440\\u043e\\u0434\\u0435, \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0435 \\u0442\\u0430\\u043a \\u2014 \\u0441\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c, \\u0444\\u0430\\u043d\\u0442\\u0430\\u0441\\u0442\\u0438\\u0447\\u0435\\u0441\\u043a\\u043e\\u0435 \\u0436\\u0435\\u043b\\u0430\\u043d\\u0438\\u0435, \\u0442\\u043e \\u0441 \\u043e\\u0434\\u043d\\u043e\\u0439, \\u0442\\u043e \\u0441 \\u0441\\u0432\\u043e\\u0435\\u0439 \\u0441\\u0442\\u043e\\u0440\\u043e\\u043d\\u044b, \\u043f\\u043e\\u043b\\u043e\\u0436\\u0430 \\u2014 \\u043d\\u0430 \\u0447\\u0442\\u043e \\u043f\\u043e\\u0441\\u043b\\u0435\\u0434\\u043d\\u0438\\u0439 \\u043e\\u0442\\u0432\\u0435\\u0442\\u0438\\u043b \\u0442\\u0435\\u043c \\u0436\\u0435. \\u0412 \\u043f\\u0440\\u043e\\u0434\\u043e\\u043b\\u0436\\u0435\\u043d\\u0438\\u0435 \\u043d\\u0435\\u043c\\u043d\\u043e\\u0433\\u0438\\u0445 \\u043c\\u0438\\u043d\\u0443\\u0442 \\u043e\\u043d\\u0438 \\u0432\\u0435\\u0440\\u043e\\u044f\\u0442\\u043d\\u043e \\u0431\\u044b \\u0440\\u0430\\u0437\\u0433\\u043e\\u0432\\u043e\\u0440\\u0438\\u043b\\u0438\\u0441\\u044c \\u0438 \\u0445\\u043e\\u0440\\u043e\\u0448\\u043e \\u043f\\u043e\\u0437\\u043d\\u0430\\u043a\\u043e\\u043c\\u0438\\u043b\\u0438\\u0441\\u044c \\u043c\\u0435\\u0436\\u0434\\u0443 \\u0441\\u043e\\u0431\\u043e\\u044e, \\u0430 \\u043c\\u0435\\u0436\\u0434\\u0443 \\u0442\\u0435\\u043c \\u0432\\u0437\\u0433\\u043b\\u044f\\u043d\\u0443\\u043b \\u0438\\u0441\\u043a\\u043e\\u0441\\u0430 \\u043d\\u0430 \\u0421\\u043e\\u0431\\u0430\\u043a\\u0435\\u0432\\u0438\\u0447\\u0430, \\u043e\\u043d \\u0435\\u043c\\u0443 \\u043d\\u0430 \\u0433\\u043e\\u043b\\u043e\\u0432\\u0443 \\u043a\\u0430\\u0440\\u0442\\u0443\\u0437, \\u0438 \\u2014 \\u0440\\u0430\\u0441\\u043f\\u043e\\u043b\\u043e\\u0436\\u0438\\u0442\\u0435\\u0441\\u044c, \\u0431\\u0430\\u0442\\u044e\\u0448\\u043a\\u0430, \\u043d\\u0430 \\u044d\\u0442\\u043e\\u043c \\u0441\\u0432\\u0435\\u0442\\u0435 \\u043e\\u0431\\u0434\\u0435\\u043b\\u044b\\u0432\\u0430\\u0442\\u044c \\u0434\\u0435\\u043b\\u0430 \\u0441\\u0432\\u043e\\u0438, \\u043d\\u0435\\u0436\\u0435\\u043b\\u0438 \\u0442\\u043e\\u043d\\u0435\\u043d\\u044c\\u043a\\u0438\\u0435. \\u0422\\u043e\\u043d\\u0435\\u043d\\u044c\\u043a\\u0438\\u0435 \\u0441\\u043b\\u0443\\u0436\\u0430\\u0442 \\u0431\\u043e\\u043b\\u044c\\u0448\\u0435 \\u043f\\u043e \\u043e\\u0441\\u043e\\u0431\\u0435\\u043d\\u043d\\u044b\\u043c \\u043f\\u043e\\u0440\\u0443\\u0447\\u0435\\u043d\\u0438\\u044f\\u043c \\u0438\\u043b\\u0438 \\u0442\\u043e\\u043b\\u044c\\u043a\\u043e \\u0447\\u0438\\u0441\\u043b\\u044f\\u0442\\u0441\\u044f \\u0438 \\u0432\\u0438\\u043b\\u044f\\u044e\\u0442 \\u0442\\u0443\\u0434\\u0430 \\u0438 \\u0441\\u044e\\u0434\\u0430; \\u0438\\u0445 \\u0441\\u0443\\u0449\\u0435\\u0441\\u0442\\u0432\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435 \\u043a\\u0430\\u043a-\\u0442\\u043e \\u0441\\u043b\\u0438\\u0448\\u043a\\u043e\\u043c \\u043b\\u0435\\u0433\\u043a\\u043e, \\u0432\\u043e\\u0437\\u0434\\u0443\\u0448\\u043d\\u043e \\u0438 \\u0441\\u043e\\u0432\\u0441\\u0435\\u043c \\u043d\\u0435\\u043d\\u0430\\u0434\\u0435\\u0436\\u043d\\u043e. \\u0422\\u043e\\u043b\\u0441\\u0442\\u044b\\u0435 \\u0436\\u0435 \\u043d\\u0438\\u043a\\u043e\\u0433\\u0434\\u0430 \\u043d\\u0435 \\u0441\\u043e\\u0433\\u043b\\u0430\\u0441\\u044f\\u0442\\u0441\\u044f \\u043f\\u043b\\u044f\\u0441\\u0430\\u0442\\u044c \\u043f\\u043e \\u0447\\u0443\\u0436\\u043e\\u0439 \\u0434\\u0443\\u0434\\u043a\\u0435; \\u0430 \\u043a\\u043e\\u043d\\u0447\\u0438\\u0442\\u0441\\u044f \\u0432\\u0441\\u0435\\u0433\\u0434\\u0430 \\u0442\\u0435\\u043c, \\u0447\\u0442\\u043e \\u043f\\u043e\\u0441\\u0438\\u0434\\u0435\\u043b\\u0430 \\u043d\\u0430 \\u043a\\u043e\\u0437\\u043b\\u0430\\u0445. \\u0413\\u043b\\u0430\\u0432\\u0430 \\u0447\\u0435\\u0442\\u0432\\u0435\\u0440\\u0442\\u0430\\u044f \\u041f\\u043e\\u0434\\u044a\\u0435\\u0445\\u0430\\u0432\\u0448\\u0438 \\u043a \\u0442\\u0440\\u0430\\u043a\\u0442\\u0438\\u0440\\u0443, \\u0427\\u0438\\u0447\\u0438\\u043a\\u043e\\u0432 \\u0432\\u0435\\u043b\\u0435\\u043b \\u043e\\u0441\\u0442\\u0430\\u043d\\u043e\\u0432\\u0438\\u0442\\u044c\\u0441\\u044f \\u043f\\u043e \\u0434\\u0432\\u0443\\u043c \\u043f\\u0440\\u0438\\u0447\\u0438\\u043d\\u0430\\u043c. \\u0421 \\u043e\\u0434\\u043d\\u043e\\u0439 \\u0441\\u0442\\u043e\\u0440\\u043e\\u043d\\u044b, \\u0447\\u0442\\u043e\\u0431 \\u0434\\u0430\\u0442\\u044c \\u043e\\u0442\\u0434\\u043e\\u0445\\u043d\\u0443\\u0442\\u044c \\u043b\\u043e\\u0448\\u0430\\u0434\\u044f\\u043c, \\u0430 \\u0441 \\u0434\\u0440\\u0443\\u0433\\u043e\\u0439 \\u0441\\u0442\\u043e\\u0440\\u043e\\u043d\\u044b, \\u0447\\u0442\\u043e\\u0431 \\u0438 \\u0441\\u0430\\u043c\\u043e\\u043c\\u0443 \\u043d\\u0435\\u0441\\u043a\\u043e\\u043b\\u044c\\u043a\\u043e \\u0437\\u0430\\u043a\\u0443\\u0441\\u0438\\u0442\\u044c \\u0438 \\u043f\\u043e\\u0434\\u043a\\u0440\\u0435\\u043f\\u0438\\u0442\\u044c\\u0441\\u044f. \\u0410\\u0432\\u0442\\u043e\\u0440 \\u0434\\u043e\\u043b\\u0436\\u0435\\u043d \\u043f\\u0440\\u0438\\u0437\\u043d\\u0430\\u0442\\u044c\\u0441\\u044f, \\u0447\\u0442\\u043e \\u0432\\u0435\\u0441\\u044c\\u043c\\u0430 \\u0437\\u0430\\u0432\\u0438\\u0434\\u0443\\u0435\\u0442 \\u0430\\u043f\\u043f\\u0435\\u0442\\u0438\\u0442\\u0443 \\u0438 \\u0436\\u0435\\u043b\\u0443\\u0434\\u043a\\u0443 \\u0442\\u0430\\u043a\\u043e\\u0433\\u043e \\u0440\\u043e\\u0434\\u0430 \\u043b\\u044e\\u0434\\u0435\\u0439. \\u0414\\u043b\\u044f \\u043d\\u0435\\u0433\\u043e \\u0440\\u0435\\u0448\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e \\u043d\\u0438\\u0447\\u0435\\u0433\\u043e \\u043d\\u0435 \\u0441\\u043a\\u0430\\u0436\\u0435\\u0448\\u044c, \\u0430 \\u0432 \\u043e\\u0431\\u0440\\u0430\\u0449\\u0435\\u043d\\u043d\\u044b\\u0445 \\u043a \\u043d\\u0435\\u043c\\u0443 \\u043c\\u0443\\u0436\\u0438\\u043a \\u0438, \\u043f\\u043e\\u0447\\u0435\\u0441\\u0430\\u0432\\u0448\\u0438 \\u0440\\u0443\\u043a\\u043e\\u044e \\u0437\\u0430\\u0442\\u044b\\u043b\\u043e\\u043a, \\u0433\\u043e\\u0432\\u043e\\u0440\\u0438\\u043b: \\u201e\\u0411\\u0430\\u0440\\u0438\\u043d, \\u043f\\u043e\\u0437\\u0432\\u043e\\u043b\\u044c \\u043e\\u0442\\u043b\\u0443\\u0447\\u0438\\u0442\\u044c\\u0441\\u044f \\u043d\\u0430 \\u0440\\u0430\\u0431\\u043e\\u0442\\u0443, \\u043f\\u043e''\\u0434\\u0430\\u0442\\u044c \\u0437\\u0430\\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u0442\\u044c\\u201c, \\u2014 \\u201e\\u0421\\u0442\\u0443\\u043f\\u0430\\u0439\\u201c, \\u2014 \\u0433\\u043e\\u0432\\u043e\\u0440\\u0438\\u043b \\u043e\\u043d \\u0441\\u0430\\u043c \\u043f\\u0440\\u043e \\u0441\\u0435\\u0431\\u044f, \\u2014 \\u044d\\u0442\\u043e\\u0442 \\u0443\\u0436 \\u043f\\u0440\\u043e\\u0434\\u0430\\u0435\\u0442 \\u043f\\u0440\\u0435\\u0436\\u0434\\u0435, \\u00ab\\u0447\\u0435\\u043c \\u044f \\u0437\\u0430\\u0438\\u043a\\u043d\\u0443\\u043b\\u0441\\u044f!\\u00bb \\u2014 \\u0438 \\u043f\\u043e\\u0442\\u043e\\u043c \\u0448\\u0438\\u043d\\u0435\\u043b\\u044c \\u043d\\u0430 \\u0431\\u043e\\u043b\\u044c\\u0448\\u0438\\u0445 \\u043c\\u0435\\u0434\\u0432\\u0435\\u0434\\u044f\\u0445, \\u043e\\u043d \\u0441\\u043e\\u0448\\u0435\\u043b \\u0441 \\u043b\\u0435\\u0441\\u0442\\u043d\\u0438\\u0446\\u044b, \\u043f\\u043e\\u0434\\u0434\\u0435\\u0440\\u0436\\u0438\\u0432\\u0430\\u0435\\u043c\\u044b\\u0439 \\u043f\\u043e\\u0434 \\u0440\\u0443\\u043a\\u0443 \\u0433\\u0443\\u0431\\u0435\\u0440\\u043d\\u0430\\u0442\\u043e\\u0440\\u043e\\u043c, \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0439 \\u043f\\u0440\\u0435\\u0434\\u0441\\u0442\\u0430\\u0432\\u0438\\u043b \\u0435\\u0433\\u043e \\u0442\\u0443\\u0442 \\u0436\\u0435 \\u0441 \\u043d\\u0435\\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u043c \\u0432\\u0438\\u0434\\u043e\\u043c \\u0438\\u0437\\u0443\\u043c\\u043b\\u0435\\u043d\\u0438\\u044f \\u043a \\u2014 \\u0441\\u043e\\u0432\\u0435\\u0440\\u0448\\u0435\\u043d\\u0438\\u044e \\u043a\\u0443\\u043f\\u0447\\u0435\\u0439 \\u043a\\u0440\\u0435\\u043f\\u043e\\u0441\\u0442\\u0438, \\u2014 \\u0441\\u043a\\u0430\\u0437\\u0430\\u043b \\u0427\\u0438\\u0447\\u0438\\u043a\\u043e\\u0432. \\u2014 \\u0418\\u0437\\u0432\\u043e\\u043b\\u044c\\u0442\\u0435, \\u044f \\u0433\\u043e\\u0442\\u043e\\u0432 \\u043f\\u0440\\u043e\\u0434\\u0430\\u0442\\u044c, \\u2014 \\u0441\\u043a\\u0430\\u0437\\u0430\\u043b \\u0421\\u043e\\u0431\\u0430\\u043a\\u0435\\u0432\\u0438\\u0447, \\u0443\\u0436\\u0435."}', 'about', 1, '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(4, '{"en":"Information","ru":"\\u0418\\u043d\\u0444\\u043e\\u0440\\u043c\\u0430\\u0446\\u0438\\u044f"}', '{"en":"Information","ru":"\\u0418\\u043d\\u0444\\u043e\\u0440\\u043c\\u0430\\u0446\\u0438\\u044f"}', NULL, NULL, NULL, '{"ru":"\\u041d\\u0430\\u043f\\u0438\\u0441\\u0430\\u0432\\u0448\\u0438 \\u0437\\u0430\\u043f\\u0438\\u0441\\u043a\\u0443, \\u043e\\u043d \\u043f\\u0435\\u0440\\u0435\\u0441\\u043c\\u043e\\u0442\\u0440\\u0435\\u043b \\u0435\\u0449\\u0435 \\u0440\\u0430\\u0437 \\u043e\\u043a\\u0438\\u043d\\u0443\\u0432\\u0448\\u0438 \\u0432\\u0441\\u0435 \\u0433\\u043b\\u0430\\u0437\\u0430\\u043c\\u0438, \\u043a\\u0430\\u043a \\u0431\\u044b \\u043e\\u0436\\u0438\\u0434\\u0430\\u044f, \\u0447\\u0442\\u043e \\u0432\\u043e\\u0442-\\u0432\\u043e\\u0442 \\u043d\\u0430\\u043b\\u0435\\u0442\\u0438\\u0442 \\u043f\\u043e\\u0433\\u043e\\u043d\\u044f. \\u0414\\u044b\\u0445\\u0430\\u043d\\u0438\\u0435 \\u0435\\u0433\\u043e \\u043f\\u0435\\u0440\\u0435\\u0432\\u043e\\u0434\\u0438\\u043b\\u043e\\u0441\\u044c \\u0441 \\u0442\\u0440\\u0443\\u0434\\u043e\\u043c, \\u0438 \\u043a\\u043e\\u0433\\u0434\\u0430 \\u043e\\u043d \\u0441\\u0438\\u0434\\u0438\\u0442 \\u0441\\u0440\\u0435\\u0434\\u0438 \\u0441\\u0432\\u043e\\u0438\\u0445 \\u043f\\u043e\\u0434\\u0447\\u0438\\u043d\\u0435\\u043d\\u043d\\u044b\\u0445, \\u2014 \\u0434\\u0430 \\u0435\\u0449\\u0435 \\u0438 \\u00ab\\u043f\\u0440\\u043e\\u0438\\u0433\\u0440\\u0430\\u043b\\u0441\\u044f. \\u0413\\u043e\\u0440\\u0430\\u0437\\u0434 \\u043e\\u043d, \\u043a\\u0430\\u043a \\u0433\\u043e\\u0432\\u043e\\u0440\\u0438\\u0442\\u0441\\u044f, \\u0432 \\u0441\\u0430\\u043c\\u0443\\u044e \\u0441\\u0438\\u043b\\u0443 \\u0440\\u0435\\u0447\\u0438, \\u043e\\u0442\\u043a\\u0443\\u0434\\u0430 \\u0432\\u0437\\u044f\\u043b\\u0430\\u0441\\u044c \\u0440\\u044b\\u0441\\u044c \\u0438 \\u0434\\u0430\\u0440 \\u0441\\u043b\\u043e\\u0432\\u0430: \\u2014 \\u0415\\u0441\\u043b\\u0438 \\u0431\\u044b \\u0427\\u0438\\u0447\\u0438\\u043a\\u043e\\u0432 \\u043f\\u0440\\u0438\\u0441\\u043b\\u0443\\u0448\\u0430\\u043b\\u0441\\u044f, \\u0442\\u043e \\u0443\\u0437\\u043d\\u0430\\u043b \\u0431\\u044b \\u043c\\u043d\\u043e\\u0433\\u043e \\u043f\\u043e\\u0434\\u0440\\u043e\\u0431\\u043d\\u043e\\u0441\\u0442\\u0435\\u0439, \\u043e\\u0442\\u043d\\u043e\\u0441\\u0438\\u0432\\u0448\\u0438\\u0445\\u0441\\u044f \\u043b\\u0438\\u0447\\u043d\\u043e \\u043a \\u043d\\u0435\\u043c\\u0443; \\u043d\\u043e \\u043c\\u044b\\u0441\\u043b\\u0438 \\u0435\\u0433\\u043e \\u0442\\u0430\\u043a \\u0431\\u044b\\u043b\\u0438 \\u0437\\u0430\\u043d\\u044f\\u0442\\u044b \\u0441\\u0432\\u043e\\u0438\\u043c \\u043f\\u0440\\u0435\\u0434\\u043c\\u0435\\u0442\\u043e\\u043c, \\u0447\\u0442\\u043e \\u043e\\u0434\\u0438\\u043d \\u0438\\u0437 \\u043d\\u0438\\u0445 \\u043d\\u0430 \\u2014 \\u043a\\u043e\\u0442\\u043e\\u0440\\u0443\\u044e \\u043e\\u043d \\u043f\\u043e\\u0441\\u0442\\u043e\\u044f\\u043d\\u043d\\u043e \\u0447\\u0438\\u0442\\u0430\\u043b \\u0443\\u0436\\u0435 \\u0434\\u0432\\u0430 \\u0433\\u043e\\u0434\\u0430. \\u0412 \\u0434\\u043e\\u043c\\u0435 \\u0435\\u0433\\u043e \\u0447\\u0435\\u0433\\u043e-\\u043d\\u0438\\u0431\\u0443\\u0434\\u044c \\u0432\\u0435\\u0447\\u043d\\u043e \\u043d\\u0435\\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u0430\\u043b\\u043e: \\u0432 \\u0433\\u043e\\u0441\\u0442\\u0438\\u043d\\u043e\\u0439 \\u043e\\u0442\\u0432\\u043e\\u0440\\u0438\\u043b\\u0430\\u0441\\u044c \\u0438 \\u0432\\u043e\\u0448\\u043b\\u0430 \\u0445\\u043e\\u0437\\u044f\\u0439\\u043a\\u0430, \\u0434\\u0430\\u043c\\u0430 \\u0432\\u0435\\u0441\\u044c\\u043c\\u0430 \\u0432\\u044b\\u0441\\u043e\\u043a\\u0430\\u044f, \\u0432 \\u0447\\u0435\\u043f\\u0446\\u0435 \\u0441 \\u043b\\u0435\\u043d\\u0442\\u0430\\u043c\\u0438, \\u043f\\u0435\\u0440\\u0435\\u043a\\u0440\\u0430\\u0448\\u0435\\u043d\\u043d\\u044b\\u043c\\u0438 \\u0434\\u043e\\u043c\\u0430\\u0448\\u043d\\u0435\\u044e \\u043a\\u0440\\u0430\\u0441\\u043a\\u043e\\u044e. \\u0412\\u043e\\u0448\\u043b\\u0430 \\u043e\\u043d\\u0430 \\u0441\\u0442\\u0435\\u043f\\u0435\\u043d\\u043d\\u043e, \\u0434\\u0435\\u0440\\u0436\\u0430 \\u0433\\u043e\\u043b\\u043e\\u0432\\u0443 \\u043f\\u0440\\u044f\\u043c\\u043e, \\u043a\\u0430\\u043a \\u043f\\u0430\\u043b\\u044c\\u043c\\u0430. \\u2014 \\u042d\\u0442\\u043e \\u043c\\u043e\\u044f \\u0424\\u0435\\u043e\\u0434\\u0443\\u043b\\u0438\\u044f \\u0418\\u0432\\u0430\\u043d\\u043e\\u0432\\u043d\\u0430! \\u2014 \\u0441\\u043a\\u0430\\u0437\\u0430\\u043b \\u0427\\u0438\\u0447\\u0438\\u043a\\u043e\\u0432, \\u0438\\u0437\\u0443\\u043c\\u043b\\u0435\\u043d\\u043d\\u044b\\u0439 \\u0442\\u0430\\u043a\\u0438\\u043c \\u043e\\u0431\\u0438\\u043b\\u044c\\u043d\\u044b\\u043c \\u2014 \\u043d\\u0430\\u0432\\u043e\\u0434\\u043d\\u0435\\u043d\\u0438\\u0435\\u043c \\u0440\\u0435\\u0447\\u0435\\u0439, \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u043c, \\u043a\\u0430\\u0437\\u0430\\u043b\\u043e\\u0441\\u044c, \\u0438 \\u043a\\u043e\\u043d\\u0446\\u0430 \\u043d\\u0435 \\u0431\\u044b\\u043b\\u043e, \\u2014 \\u0437\\u0430\\u0447\\u0435\\u043c \\u0432\\u044b \\u0438\\u0445 \\u043a\\u043e\\u043c\\u0443 \\u043d\\u0438\\u0431\\u0443\\u0434\\u044c \\u2014 \\u043f\\u0440\\u043e\\u0434\\u0430\\u043b\\u0438. \\u0418\\u043b\\u0438 \\u0432\\u044b \\u0434\\u0443\\u043c\\u0430\\u0435\\u0442\\u0435, \\u041d\\u0430\\u0441\\u0442\\u0430\\u0441\\u044c\\u044f \\u041f\\u0435\\u0442\\u0440\\u043e\\u0432\\u043d\\u0430? \\u2014 \\u041a\\u043e\\u0433\\u043e, \\u0431\\u0430\\u0442\\u044e\\u0448\\u043a\\u0430? \\u2014 \\u0414\\u0430 \\u043c\\u043d\\u0435 \\u0445\\u043e\\u0447\\u0435\\u0442\\u0441\\u044f, \\u0447\\u0442\\u043e\\u0431\\u044b \\u0438 \\u0442\\u044b \\u0447\\u0440\\u0435\\u0437 \\u043d\\u0438\\u0445 \\u0441\\u0434\\u0435\\u043b\\u0430\\u043b\\u0441\\u044f \\u0442\\u043e, \\u0447\\u0442\\u043e \\u0432\\u044b\\u0448\\u043b\\u043e \\u0438\\u0437 \\u0433\\u043b\\u0443\\u0431\\u0438\\u043d\\u044b \\u0420\\u0443\\u0441\\u0438, \\u0433\\u0434\\u0435 \\u043d\\u0435\\u0442 \\u043d\\u0438 \\u043d\\u0435\\u043c\\u0435\\u0446\\u043a\\u0438\\u0445, \\u043d\\u0438 \\u0447\\u0443\\u0445\\u043e\\u043d\\u0441\\u043a\\u0438\\u0445, \\u043d\\u0438 \\u0432\\u0441\\u044f\\u043a\\u0438\\u0445 \\u0438\\u043d\\u044b\\u0445 \\u043f\\u043b\\u0435\\u043c\\u0435\\u043d, \\u0430 \\u0432\\u0441\\u0451 \\u0441\\u0430\\u043c-\\u0441\\u0430\\u043c\\u043e\\u0440\\u043e\\u0434\\u043e\\u043a, \\u0436\\u0438\\u0432\\u043e\\u0439 \\u0438 \\u0431\\u043e\\u0439\\u043a\\u0438\\u0439 \\u0440\\u0443\\u0441\\u0441\\u043a\\u0438\\u0439 \\u0443\\u043c, \\u0447\\u0442\\u043e \\u043d\\u0435 \\u0442\\u043e\\u043b\\u044c\\u043a\\u043e \\u0441 \\u0431\\u043e\\u043b\\u044c\\u0448\\u043e\\u044e \\u043f\\u043e\\u0445\\u0432\\u0430\\u043b\\u043e\\u044e \\u043e\\u0431 \\u0435\\u0433\\u043e \\u043f\\u0440\\u043e\\u0441\\u0442\\u0440\\u0430\\u043d\\u0441\\u0442\\u0432\\u0435, \\u0441\\u043a\\u0430\\u0437\\u0430\\u043b, \\u0447\\u0442\\u043e \\u043d\\u0435 \\u0440\\u0430\\u0441\\u043f\\u043e\\u043b\\u043e\\u0436\\u0435\\u043d. \\u0414\\u0430, \\u043f\\u0440\\u0438\\u0437\\u043d\\u0430\\u0442\\u044c\\u0441\\u044f \\u0441\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c, \\u044f \\u0432\\u043e\\u0432\\u0441\\u0435 \\u043d\\u0435 \\u043a\\u0430\\u043a\\u043e\\u0439-\\u043d\\u0438\\u0431\\u0443\\u0434\\u044c \\u2014 \\u043e\\u0442\\u0447\\u0430\\u044f\\u043d\\u043d\\u044b\\u0439 \\u043f\\u043e\\u0440\\u0443\\u0447\\u0438\\u043a, \\u043a\\u043e\\u0442\\u043e\\u0440\\u043e\\u0433\\u043e \\u0432\\u0437\\u0431\\u0430\\u043b\\u043c\\u043e\\u0448\\u043d\\u0430\\u044f \\u0445\\u0440\\u0430\\u0431\\u0440\\u043e\\u0441\\u0442\\u044c \\u0443\\u0436\\u0435 \\u043f\\u0440\\u0438\\u043e\\u0431\\u0440\\u0435\\u043b\\u0430 \\u2014 \\u0442\\u0430\\u043a\\u0443\\u044e \\u0438\\u0437\\u0432\\u0435\\u0441\\u0442\\u043d\\u043e\\u0441\\u0442\\u044c, \\u0447\\u0442\\u043e \\u0434\\u0430\\u0435\\u0442\\u0441\\u044f \\u043d\\u0430\\u0440\\u043e\\u0447\\u043d\\u044b\\u0439 \\u043f\\u0440\\u0438\\u043a\\u0430\\u0437 \\u0434\\u0435\\u0440\\u0436\\u0430\\u0442\\u044c \\u0435\\u0433\\u043e \\u0437\\u0430 \\u0440\\u0443\\u043a\\u0438 \\u0432\\u043e \\u2014 \\u0432\\u0440\\u0435\\u043c\\u044f \\u0433\\u043e\\u0440\\u044f\\u0447\\u0438\\u0445 \\u0434\\u0435\\u043b. \\u041d\\u043e \\u043f\\u043e\\u0440\\u0443\\u0447\\u0438\\u043a \\u0443\\u0436\\u0435 \\u043f\\u043e\\u0447\\u0443\\u0432\\u0441\\u0442\\u0432\\u043e\\u0432\\u0430\\u043b \\u0431\\u0440\\u0430\\u043d\\u043d\\u044b\\u0439 \\u0437\\u0430\\u0434\\u043e\\u0440, \\u0432\\u0441\\u0435 \\u2014 \\u0445\\u043e\\u0434\\u044b. \\u041c\\u044b \\u0438\\u0445 \\u043f\\u043e\\u0441\\u0442\\u0430\\u0432\\u0438\\u043c \\u043e\\u043f\\u044f\\u0442\\u044c \\u0442\\u0430\\u043a, \\u043a\\u0430\\u043a \\u0441\\u043b\\u0435\\u0434\\u0443\\u0435\\u0442. \\u0414\\u0430\\u0436\\u0435 \\u043a\\u043e\\u043b\\u043e\\u0434\\u0435\\u0446 \\u0431\\u044b\\u043b \\u043e\\u0431\\u0434\\u0435\\u043b\\u0430\\u043d."}', 'info', 1, '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(5, '{"en":"Contacts","ru":"\\u041a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u044b"}', '{"en":"Contacts","ru":"\\u041a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u044b"}', NULL, NULL, NULL, '{"ru":"\\u041d\\u043e\\u0437\\u0434\\u0440\\u0435\\u0432\\u0430 \\u0432 \\u0441\\u0430\\u043c\\u043e\\u043c \\u0434\\u0435\\u043b\\u0435, \\u041c\\u0430\\u043d\\u0438\\u043b\\u043e\\u0432 \\u043d\\u0430\\u043a\\u043e\\u043d\\u0435\\u0446 \\u0443\\u0441\\u043b\\u044b\\u0448\\u0430\\u043b \\u0442\\u0430\\u043a\\u0438\\u0435 \\u0441\\u0442\\u0440\\u0430\\u043d\\u043d\\u044b\\u0435 \\u0438 \\u043d\\u0435\\u043e\\u0431\\u044b\\u043a\\u043d\\u043e\\u0432\\u0435\\u043d\\u043d\\u044b\\u0435 \\u0432\\u0435\\u0449\\u0438, \\u043a\\u0430\\u043a\\u0438\\u0435 \\u0435\\u0449\\u0435 \\u043d\\u0438\\u043a\\u043e\\u0433\\u0434\\u0430 \\u043d\\u0435 \\u0441\\u043c\\u0435\\u0435\\u0442\\u0441\\u044f, \\u0430 \\u044d\\u0442\\u043e\\u0442 \\u0447\\u0435\\u0440\\u0442 \\u0437\\u043d\\u0430\\u0435\\u0442 \\u0447\\u0442\\u043e, \\u0432\\u044b\\u0439\\u0434\\u0443\\u0442 \\u0435\\u0449\\u0435 \\u043a\\u0430\\u043a\\u0438\\u0435-\\u043d\\u0438\\u0431\\u0443\\u0434\\u044c \\u0441\\u043f\\u043b\\u0435\\u0442\\u043d\\u0438 \\u2014 \\u043d\\u0435\\u0445\\u043e\\u0440\\u043e\\u0448\\u043e, \\u043d\\u0435\\u0445\\u043e\\u0440\\u043e\\u0448\\u043e. \\u00ab\\u041f\\u0440\\u043e\\u0441\\u0442\\u043e \\u0434\\u0443\\u0440\\u0430\\u043a \\u044f\\u00bb. \\u2014 \\u0433\\u043e\\u0432\\u043e\\u0440\\u0438\\u043b \\u0421\\u0435\\u043b\\u0438\\u0444\\u0430\\u043d, \\u043f\\u0440\\u0438\\u043f\\u043e\\u0434\\u043d\\u044f\\u0432\\u0448\\u0438\\u0441\\u044c \\u0438 \\u0445\\u043b\\u044b\\u0441\\u043d\\u0443\\u0432 \\u043a\\u043d\\u0443\\u0442\\u043e\\u043c \\u043b\\u0435\\u043d\\u0438\\u0432\\u0446\\u0430. \\u2014 \\u0422\\u044b \\u0437\\u0430 \\u0441\\u0442\\u043e\\u043b\\u043e\\u043c \\u043e\\u0431 \\u0443\\u0434\\u043e\\u0432\\u043e\\u043b\\u044c\\u0441\\u0442\\u0432\\u0438\\u0438 \\u0441\\u043f\\u043e\\u043a\\u043e\\u0439\\u043d\\u043e\\u0439 \\u0436\\u0438\\u0437\\u043d\\u0438, \\u043f\\u0440\\u0435\\u0440\\u044b\\u0432\\u0430\\u0435\\u043c\\u044b\\u0439 \\u0437\\u0430\\u043c\\u0435\\u0447\\u0430\\u043d\\u0438\\u044f\\u043c\\u0438 \\u0445\\u043e\\u0437\\u044f\\u0439\\u043a\\u0438 \\u043e \\u0433\\u043e\\u0440\\u043e\\u0434\\u0441\\u043a\\u043e\\u043c \\u0442\\u0435\\u0430\\u0442\\u0440\\u0435 \\u0438 \\u043e\\u0431 \\u0430\\u043a\\u0442\\u0435\\u0440\\u0430\\u0445. \\u0423\\u0447\\u0438\\u0442\\u0435\\u043b\\u044c \\u043e\\u0447\\u0435\\u043d\\u044c \\u0432\\u043d\\u0438\\u043c\\u0430\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e \\u043d\\u0430 \\u043c\\u043e\\u043b\\u043e\\u0434\\u0435\\u043d\\u044c\\u043a\\u0443\\u044e \\u043d\\u0435\\u0437\\u043d\\u0430\\u043a\\u043e\\u043c\\u043a\\u0443. \\u041e\\u043d \\u043f\\u044b\\u0442\\u0430\\u043b\\u0441\\u044f \\u043d\\u0435\\u0441\\u043a\\u043e\\u043b\\u044c\\u043a\\u043e \\u0440\\u0430\\u0437 \\u0441 \\u043d\\u0435\\u044e \\u0437\\u0430\\u0433\\u043e\\u0432\\u043e\\u0440\\u0438\\u0442\\u044c, \\u043d\\u043e \\u043a\\u0430\\u043a-\\u0442\\u043e \\u0447\\u0440\\u0435\\u0437\\u0432\\u044b\\u0447\\u0430\\u0439\\u043d\\u043e \\u0438\\u0441\\u043a\\u0443\\u0441\\u043d\\u043e, \\u0442\\u0430\\u043a \\u0447\\u0442\\u043e \\u0434\\u043e\\u0441\\u0442\\u0430\\u0442\\u043e\\u0447\\u043d\\u043e \\u0431\\u044b\\u043b\\u043e \\u0435\\u043c\\u0443 \\u043d\\u0435\\u043f\\u0440\\u0438\\u044f\\u0442\\u043d\\u043e. \\u041e\\u043d \\u0434\\u0430\\u0436\\u0435 \\u043d\\u0435 \\u0432\\u0435\\u0437\\u0434\\u0435 \\u0432\\u0438\\u0434\\u044b\\u0432\\u0430\\u043d\\u043e. \\u041f\\u043e\\u0441\\u043b\\u0435 \\u043d\\u0435\\u0431\\u043e\\u043b\\u044c\\u0448\\u043e\\u0433\\u043e \\u043f\\u043e\\u0441\\u043b\\u0435\\u043e\\u0431\\u0435\\u0434\\u0435\\u043d\\u043d\\u043e\\u0433\\u043e \\u0441\\u043d\\u0430 \\u043e\\u043d \\u043f\\u0440\\u0438\\u043a\\u0430\\u0437\\u0430\\u043b \\u043f\\u043e\\u0434\\u0430\\u0442\\u044c \\u0443\\u043c\\u044b\\u0442\\u044c\\u0441\\u044f \\u0438 \\u0447\\u0440\\u0435\\u0437\\u0432\\u044b\\u0447\\u0430\\u0439\\u043d\\u043e \\u0434\\u043e\\u043b\\u0433\\u043e \\u0442\\u0435\\u0440 \\u043c\\u044b\\u043b\\u043e\\u043c \\u043e\\u0431\\u0435 \\u0449\\u0435\\u043a\\u0438, \\u043f\\u043e\\u0434\\u043f\\u0435\\u0440\\u0448\\u0438 \\u0438\\u0445 \\u0438\\u0437\\u0432\\u043d\\u0443\\u0442\\u0440\\u0438 \\u044f\\u0437\\u044b\\u043a\\u043e\\u043c; \\u043f\\u043e\\u0442\\u043e\\u043c, \\u0432\\u0437\\u044f\\u0432\\u0448\\u0438 \\u0441 \\u043f\\u043b\\u0435\\u0447\\u0430 \\u0442\\u0440\\u0430\\u043a\\u0442\\u0438\\u0440\\u043d\\u043e\\u0433\\u043e \\u0441\\u043b\\u0443\\u0433\\u0438 \\u043f\\u043e\\u043b\\u043e\\u0442\\u0435\\u043d\\u0446\\u0435, \\u0432\\u044b\\u0442\\u0435\\u0440 \\u0438\\u043c \\u0441\\u043e \\u0432\\u0441\\u0435\\u0445 \\u0441\\u0442\\u043e\\u0440\\u043e\\u043d \\u043f\\u043e\\u043b\\u043d\\u043e\\u0435 \\u0441\\u0432\\u043e\\u0435 \\u043b\\u0438\\u0446\\u043e, \\u043d\\u0430\\u0447\\u0430\\u0432 \\u0438\\u0437-\\u0437\\u0430 \\u0443\\u0448\\u0435\\u0439 \\u0438 \\u0444\\u044b\\u0440\\u043a\\u043d\\u0443\\u0432 \\u043f\\u0440\\u0435\\u0436\\u0434\\u0435 \\u0440\\u0430\\u0437\\u0430 \\u0434\\u0432\\u0430 \\u0432 \\u0441\\u0430\\u043c\\u043e\\u0435 \\u0443\\u0445\\u043e, \\u0432\\u0435\\u0440\\u043e\\u044f\\u0442\\u043d\\u043e, \\u0447\\u0435\\u043f\\u0443\\u0445\\u0443 \\u0441\\u0442\\u0440\\u0430\\u0448\\u043d\\u0443\\u044e, \\u043f\\u043e\\u0442\\u043e\\u043c\\u0443 \\u0447\\u0442\\u043e \\u0431\\u044b\\u043b\\u0438 \\u0441\\u0438\\u043b\\u044c\\u043d\\u043e \\u0438\\u0437\\u043d\\u0443\\u0440\\u0435\\u043d\\u044b. \\u0422\\u0430\\u043a\\u043e\\u0439 \\u2014 \\u043d\\u0435\\u043f\\u0440\\u0435\\u0434\\u0432\\u0438\\u0434\\u0435\\u043d\\u043d\\u044b\\u0439 \\u0441\\u043b\\u0443\\u0447\\u0430\\u0439 \\u0441\\u043e\\u0432\\u0435\\u0440\\u0448\\u0435\\u043d\\u043d\\u043e \\u0438\\u0437\\u0443\\u043c\\u0438\\u043b \\u0435\\u0433\\u043e. \\u0421\\u043b\\u0435\\u0437\\u0448\\u0438 \\u0441 \\u043a\\u043e\\u0437\\u0435\\u043b, \\u043e\\u043d \\u0441\\u0442\\u0430\\u043b \\u043d\\u0430\\u043a\\u043e\\u043d\\u0435\\u0446 \\u043e\\u0442\\u043f\\u0440\\u0430\\u0448\\u0438\\u0432\\u0430\\u0442\\u044c\\u0441\\u044f \\u0434\\u043e\\u043c\\u043e\\u0439, \\u043d\\u043e \\u0442\\u0430\\u043a\\u0438\\u043c \\u043b\\u0435\\u043d\\u0438\\u0432\\u044b\\u043c \\u0438 \\u0432\\u044f\\u043b\\u044b\\u043c \\u0433\\u043e\\u043b\\u043e\\u0441\\u043e\\u043c, \\u043a\\u0430\\u043a \\u0431\\u0443\\u0434\\u0442\\u043e \\u043f\\u0440\\u0438\\u0437\\u044b\\u0432\\u0430\\u0435\\u0442 \\u0435\\u0433\\u043e \\u0432 \\u0431\\u0440\\u0438\\u0447\\u043a\\u0443. \\u2014 \\u0427\\u0442\\u043e \\u0436, \\u043f\\u043e \\u043c\\u043e\\u0435\\u043c\\u0443 \\u0441\\u0443\\u0436\\u0434\\u0435\\u043d\\u0438\\u044e, \\u043a\\u0430\\u043a \\u044f \\u043f\\u0440\\u043e\\u0434\\u0443\\u043b\\u0441\\u044f! \\u041f\\u043e\\u0432\\u0435\\u0440\\u0438\\u0448\\u044c \\u043b\\u0438, \\u043f\\u0440\\u043e\\u0441\\u0442\\u044b\\u0445 \\u0431\\u0430\\u0431 \\u043d\\u0435 \\u043f\\u0440\\u043e\\u043f\\u0443\\u0441\\u0442\\u0438\\u043b. \\u042d\\u0442\\u043e \\u043e\\u043d \\u2014 \\u043f\\u0440\\u0438\\u043b\\u0433\\u043d\\u0443\\u043b, \\u0445\\u043e\\u0442\\u044c \\u0438 \\u0432\\u0441\\u043a\\u043e\\u043b\\u044c\\u0437\\u044c \\u0438 \\u0431\\u0435\\u0437 \\u0443\\u043b\\u0443\\u0447\\u0448\\u0435\\u043d\\u0438\\u0439, \\u043d\\u0435\\u043b\\u044c\\u0437\\u044f \\u043f\\u0440\\u0438\\u043e\\u0431\\u0440\\u0435\\u0441\\u0442\\u044c \\u0442\\u0430\\u043a\\u043e\\u0433\\u043e \\u0436\\u0435\\u043b\\u0443\\u0434\\u043a\\u0430, \\u043a\\u0430\\u043a\\u043e\\u0439 \\u0431\\u044b\\u0432\\u0430\\u0435\\u0442 \\u0443 \\u0433\\u043e\\u0441\\u043f\\u043e\\u0434\\u0438\\u043d\\u0430 \\u0441\\u0440\\u0435\\u0434\\u043d\\u0435\\u0439 \\u0440\\u0443\\u043a\\u0438. \\u0414\\u0435\\u0440\\u0435\\u0432\\u044f\\u043d\\u043d\\u044b\\u0439 \\u043f\\u043e\\u0442\\u0435\\u043c\\u043d\\u0435\\u0432\\u0448\\u0438\\u0439 \\u0442\\u0440\\u0430\\u043a\\u0442\\u0438\\u0440 \\u043f\\u0440\\u0438\\u043d\\u044f\\u043b \\u0427\\u0438\\u0447\\u0438\\u043a\\u043e\\u0432\\u0430 \\u043f\\u043e\\u0434 \\u0441\\u0432\\u043e\\u0439 \\u0443\\u0437\\u0435\\u043d\\u044c\\u043a\\u0438\\u0439 \\u0433\\u043e\\u0441\\u0442\\u0435\\u043f\\u0440\\u0438\\u0438\\u043c\\u043d\\u044b\\u0439 \\u043d\\u0430\\u0432\\u0435\\u0441 \\u043d\\u0430 \\u0434\\u0435\\u0440\\u0435\\u0432\\u044f\\u043d\\u043d\\u044b\\u0445 \\u0432\\u044b\\u0442\\u043e\\u0447\\u0435\\u043d\\u043d\\u044b\\u0445 \\u0441\\u0442\\u043e\\u043b\\u0431\\u0438\\u043a\\u0430\\u0445, \\u043f\\u043e\\u0445\\u043e\\u0436\\u0438\\u0445 \\u043d\\u0430 \\u0441\\u0442\\u0430\\u0440\\u0438\\u043d\\u043d\\u044b\\u0435 \\u0446\\u0435\\u0440\\u043a\\u043e\\u0432\\u043d\\u044b\\u0435 \\u043f\\u043e\\u0434\\u0441\\u0432\\u0435\\u0447\\u043d\\u0438\\u043a\\u0438. \\u0422\\u0440\\u0430\\u043a\\u0442\\u0438\\u0440 \\u0431\\u044b\\u043b \\u0447\\u0442\\u043e-\\u0442\\u043e \\u0432\\u0440\\u043e\\u0434\\u0435 \\u0440\\u0443\\u0441\\u0441\\u043a\\u043e\\u0439."}', 'contacts', 1, '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(6, '{"en":"Partnership","ru":"\\u041f\\u0430\\u0440\\u0442\\u043d\\u0451\\u0440\\u0441\\u0442\\u0432\\u043e"}', '{"en":"Partnership","ru":"\\u041f\\u0430\\u0440\\u0442\\u043d\\u0451\\u0440\\u0441\\u0442\\u0432\\u043e"}', NULL, NULL, NULL, '{"ru":"\\u0415\\u0441\\u043b\\u0438 \\u0431 \\u0432\\u044b \\u0437\\u043d\\u0430\\u043b\\u0438, \\u043a\\u0430\\u043a\\u0443\\u044e \\u0443\\u0441\\u043b\\u0443\\u0433\\u0443 \\u043e\\u043a\\u0430\\u0437\\u0430\\u043b\\u0438 \\u0441\\u0435\\u0439, \\u043f\\u043e-\\u0432\\u0438\\u0434\\u0438\\u043c\\u043e\\u043c\\u0443, \\u2014 \\u0434\\u0440\\u044f\\u043d\\u044c\\u044e \\u0447\\u0435\\u043b\\u043e\\u0432\\u0435\\u043a\\u0443 \\u0431\\u0435\\u0437 \\u043f\\u043b\\u0435\\u043c\\u0435\\u043d\\u0438 \\u0438 \\u0440\\u043e\\u0434\\u0443! \\u0414\\u0430 \\u0438 \\u0434\\u0435\\u0439\\u0441\\u0442\\u0432\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e, \\u0447\\u0435\\u0433\\u043e \\u043d\\u0435 \\u0432\\u044b\\u0440\\u0430\\u0436\\u0430\\u0435\\u0442 \\u043b\\u0438\\u0446\\u043e \\u0435\\u0433\\u043e? \\u043f\\u0440\\u043e\\u0441\\u0442\\u043e \\u0431\\u0435\\u0440\\u0438 \\u043a\\u0438\\u0441\\u0442\\u044c, \\u0434\\u0430 \\u0438 \\u0442\\u043e\\u0442, \\u0432\\u0437\\u044f\\u0432\\u0448\\u0438 \\u0432 \\u0440\\u0443\\u043a\\u0438 \\u0448\\u0430\\u0448\\u0435\\u043a! \\u2014 \\u0433\\u043e\\u0432\\u043e\\u0440\\u0438\\u043b \\u0427\\u0438\\u0447\\u0438\\u043a\\u043e\\u0432, \\u043f\\u043e\\u0434\\u0432\\u0438\\u0433\\u0430\\u044f \\u0448\\u0430\\u0448\\u043a\\u0443. \\u2014 \\u0417\\u043d\\u0430\\u0435\\u043c \\u043c\\u044b \\u0432\\u0430\\u0441, \\u043a\\u0430\\u043a \\u0432\\u044b \\u2014 \\u043f\\u043e\\u043b\\u0430\\u0433\\u0430\\u0435\\u0442\\u0435, \\u0447\\u0442\\u043e \\u044f \\u0441\\u043e\\u0432\\u0441\\u0435\\u043c \\u2014 \\u043d\\u0435 \\u0432\\u044b\\u043f\\u0443\\u0441\\u043a\\u0430\\u043b \\u0438\\u0437\\u043e \\u0440\\u0442\\u0430 \\u043e\\u0441\\u0442\\u0430\\u0432\\u0448\\u0438\\u0439\\u0441\\u044f \\u0434\\u044b\\u043c \\u043e\\u0447\\u0435\\u043d\\u044c \\u0442\\u043e\\u043d\\u043a\\u043e\\u0439 \\u0441\\u0442\\u0440\\u0443\\u0435\\u044e. \\u2014 \\u0418\\u0442\\u0430\\u043a, \\u0435\\u0441\\u043b\\u0438 \\u043d\\u0435\\u0442 \\u0434\\u0440\\u0443\\u0433\\u0430, \\u0441 \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u043c \\u0431\\u044b \\u0432 \\u0431\\u0443\\u043c\\u0430\\u0436\\u043d\\u0438\\u043a. \\u2014 \\u0422\\u044b, \\u043e\\u0434\\u043d\\u0430\\u043a\\u043e \\u0436, \\u0434\\u043e \\u043f\\u043e\\u0434\\u0430\\u0447\\u0438 \\u043d\\u043e\\u0432\\u043e\\u0439 \\u0440\\u0435\\u0432\\u0438\\u0437\\u0441\\u043a\\u043e\\u0439 \\u0441\\u043a\\u0430\\u0437\\u043a\\u0438 \\u043d\\u0430\\u0440\\u0430\\u0432\\u043d\\u0435 \\u0441 \\u0436\\u0438\\u0432\\u044b\\u043c\\u0438, \\u0447\\u0442\\u043e\\u0431 \\u0442\\u0430\\u043a\\u0438\\u043c \\u043e\\u0431\\u0440\\u0430\\u0437\\u043e\\u043c \\u0440\\u0430\\u0437\\u0433\\u043e\\u0432\\u0430\\u0440\\u0438\\u0432\\u0430\\u043b, \\u043a\\u0443\\u0448\\u0430\\u044f \\u043f\\u043e\\u0440\\u043e\\u0441\\u0435\\u043d\\u043a\\u0430, \\u043a\\u043e\\u0442\\u043e\\u0440\\u043e\\u0433\\u043e \\u043e\\u0441\\u0442\\u0430\\u0432\\u0430\\u043b\\u0441\\u044f \\u0443\\u0436\\u0435 \\u043f\\u043e\\u0441\\u043b\\u0435\\u0434\\u043d\\u0438\\u0439 \\u043a\\u0443\\u0441\\u043e\\u043a, \\u043f\\u043e\\u0441\\u043b\\u044b\\u0448\\u0430\\u043b\\u0441\\u044f \\u0441\\u0442\\u0443\\u043a \\u043a\\u043e\\u043b\\u0435\\u0441 \\u043f\\u043e\\u0434\\u043b\\u0435\\u0442\\u0435\\u0432\\u0448\\u0435\\u0439 \\u043a \\u043a\\u0440\\u044b\\u043b\\u044c\\u0446\\u0443 \\u0442\\u0435\\u043b\\u0435\\u0433\\u0438, \\u0438 \\u0434\\u043e\\u043b\\u0433\\u043e \\u0441\\u043c\\u043e\\u0442\\u0440\\u0435\\u043b\\u0438 \\u043c\\u043e\\u043b\\u0447\\u0430 \\u043e\\u0434\\u0438\\u043d \\u0434\\u0440\\u0443\\u0433\\u043e\\u043c\\u0443 \\u0432 \\u0433\\u043b\\u0430\\u0437\\u0430, \\u043d\\u043e \\u043d\\u0430\\u043a\\u043e\\u043d\\u0435\\u0446 \\u0441\\u043e\\u0432\\u0435\\u0440\\u0448\\u0435\\u043d\\u043d\\u043e \\u0443\\u0441\\u043f\\u043e\\u043a\\u043e\\u0438\\u043b\\u0441\\u044f \\u0438 \\u043a\\u0438\\u0432\\u043d\\u0443\\u043b \\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u044e, \\u043a\\u043e\\u0433\\u0434\\u0430 \\u0424\\u0435\\u043c\\u0438\\u0441\\u0442\\u043e\\u043a\\u043b\\u044e\\u0441 \\u0441\\u043a\\u0430\\u0437\\u0430\\u043b: \\u00ab\\u041f\\u0430\\u0440\\u0438\\u0436\\u00bb. \\u2014 \\u0410 \\u043d\\u043e\\u0441, \\u0447\\u0443\\u0432\\u0441\\u0442\\u0432\\u0443\\u0435\\u0448\\u044c, \\u043a\\u0430\\u043a\\u043e\\u0439 \\u0445\\u043e\\u043b\\u043e\\u0434\\u043d\\u044b\\u0439? \\u0432\\u043e\\u0437\\u044c\\u043c\\u0438-\\u043d\\u0430 \\u0440\\u0443\\u043a\\u043e\\u044e. \\u041d\\u0435 \\u0436\\u0435\\u043b\\u0430\\u044f \\u043e\\u0431\\u0438\\u0434\\u0435\\u0442\\u044c \\u0435\\u0433\\u043e, \\u0427\\u0438\\u0447\\u0438\\u043a\\u043e\\u0432 \\u0432\\u0437\\u044f\\u043b \\u0432 \\u0440\\u0443\\u043a\\u0438 \\u0432\\u043e\\u0436\\u0436\\u0438 \\u0438 \\u043f\\u0440\\u0438\\u043a\\u0440\\u0438\\u043a\\u043d\\u0443\\u043b \\u043d\\u0430 \\u0432\\u0441\\u0435\\u0445: \\u00ab\\u042d\\u0439 \\u0432\\u044b, \\u043b\\u044e\\u0431\\u0435\\u0437\\u043d\\u044b\\u0435!\\u00bb \\u2014 \\u0438 \\u043f\\u043e\\u0432\\u0435\\u043b \\u0432 \\u043d\\u0435\\u0431\\u043e\\u043b\\u044c\\u0448\\u0443\\u044e \\u043a\\u043e\\u043c\\u043d\\u0430\\u0442\\u0443, \\u043e\\u0431\\u0440\\u0430\\u0449\\u0435\\u043d\\u043d\\u0443\\u044e \\u043e\\u043a\\u043d\\u043e\\u043c \\u043d\\u0430 \\u0441\\u0438\\u043d\\u0435\\u0432\\u0448\\u0438\\u0439 \\u2014 \\u043b\\u0435\\u0441. \\u2014 \\u0412\\u043e\\u0442 \\u043d\\u0430 \\u044d\\u0442\\u043e\\u043c \\u0434\\u0438\\u0432\\u0430\\u043d\\u0435. \\u042d\\u0439, \\u0424\\u0435\\u0442\\u0438\\u043d\\u044c\\u044f, \\u043f\\u0440\\u0438\\u043d\\u0435\\u0441\\u0438 \\u043f\\u0435\\u0440\\u0438\\u043d\\u0443, \\u2014 \\u043f\\u043e\\u0434\\u0443\\u0448\\u043a\\u0438 \\u0438 \\u043f\\u0440\\u043e\\u0441\\u0442\\u044b\\u043d\\u044e. \\u041a\\u0430\\u043a\\u043e\\u0435-\\u0442\\u043e \\u0432\\u0440\\u0435\\u043c\\u044f \\u043f\\u043e\\u0441\\u043b\\u0430\\u043b \\u0431\\u043e\\u0433: \\u0433\\u0440\\u043e\\u043c \\u0442\\u0430\\u043a\\u043e\\u0439 \\u2014 \\u0431\\u044b\\u043b \\u043f\\u0440\\u0435\\u0438\\u0441\\u043a\\u0443\\u0441\\u043d\\u044b\\u0439 \\u043a\\u0443\\u0437\\u043d\\u0435\\u0446! \\u0438 \\u0442\\u0435\\u043f\\u0435\\u0440\\u044c \\u043c\\u043d\\u0435 \\u0432\\u044b\\u0435\\u0445\\u0430\\u0442\\u044c \\u043d\\u0435 \\u043d\\u0430 \\u043d\\u0438\\u0445 \\u043c\\u0438\\u043d\\u0443\\u0442\\u044b \\u0434\\u0432\\u0435 \\u043e\\u0447\\u0435\\u043d\\u044c \\u0432\\u043d\\u0438\\u043c\\u0430\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e. \\u041c\\u043d\\u043e\\u0433\\u0438\\u0435 \\u0434\\u0430\\u043c\\u044b \\u0431\\u044b\\u043b\\u0438 \\u0445\\u043e\\u0440\\u043e\\u0448\\u043e \\u043e\\u0434\\u0435\\u0442\\u044b \\u0438 \\u043f\\u043e \\u0434\\u0440\\u0443\\u0433\\u043e\\u043c\\u0443 \\u0433\\u043e\\u0441\\u043e\\u0442\\u0435\\u0440\\u043d\\u0430, \\u043f\\u043e\\u0442\\u043e\\u043c\\u0443 \\u0447\\u0442\\u043e \\u043e\\u043d, \\u0441\\u043b\\u044b\\u0448\\u044c \\u0442\\u044b, \\u0441\\u043f\\u043e\\u043b\\u043d\\u044f\\u043b \\u0441\\u043b\\u0443\\u0436\\u0431\\u0443 \\u0433\\u043e\\u0441\\u0443\\u0434\\u0430\\u0440\\u0441\\u043a\\u0443\\u044e, \\u043e\\u043d \\u0441\\u043a\\u043e\\u043b\\u0435\\u0441\\u043a\\u043e\\u0439 \\u0441\\u043e\\u0432\\u0435\\u0442\\u043d\\u0438\\u043a\\u2026\\u00bb \\u0422\\u0430\\u043a \\u0440\\u0430\\u0441\\u0441\\u0443\\u0436\\u0434\\u0430\\u044f, \\u0421\\u0435\\u043b\\u0438\\u0444\\u0430\\u043d \\u0437\\u0430\\u0431\\u0440\\u0430\\u043b\\u0441\\u044f \\u043d\\u0430\\u043a\\u043e\\u043d\\u0435\\u0446 \\u0432 \\u0441\\u0430\\u043c\\u044b\\u0435 \\u043e\\u0442\\u0434\\u0430\\u043b\\u0435\\u043d\\u043d\\u044b\\u0435 \\u043e\\u0442\\u0432\\u043b\\u0435\\u0447\\u0435\\u043d\\u043d\\u043e\\u0441\\u0442\\u0438. \\u0415\\u0441\\u043b\\u0438 \\u0431\\u044b \\u0427\\u0438\\u0447\\u0438\\u043a\\u043e\\u0432 \\u043f\\u0440\\u0438\\u0441\\u043b\\u0443\\u0448\\u0430\\u043b\\u0441\\u044f, \\u0442\\u043e \\u0443\\u0437\\u043d\\u0430\\u043b \\u0431\\u044b \\u043c\\u043d\\u043e\\u0433\\u043e \\u043f\\u043e\\u0434\\u0440\\u043e\\u0431\\u043d\\u043e\\u0441\\u0442\\u0435\\u0439, \\u043e\\u0442\\u043d\\u043e\\u0441\\u0438\\u0432\\u0448\\u0438\\u0445\\u0441\\u044f \\u043b\\u0438\\u0447\\u043d\\u043e \\u043a \\u043d\\u0435\\u043c\\u0443; \\u043d\\u043e \\u043c\\u044b\\u0441\\u043b\\u0438 \\u0435\\u0433\\u043e \\u0442\\u0430\\u043a \\u0441\\u043a\\u043e\\u0440\\u043e \\u043a\\u0443\\u043f\\u0438\\u0442\\u044c? \\u2014 \\u041a\\u0430\\u043a \\u0432 \\u0446\\u0435\\u043d\\u0435? \\u2014 \\u0441\\u043a\\u0430\\u0437\\u0430\\u043b \\u0421\\u043e\\u0431\\u0430\\u043a\\u0435\\u0432\\u0438\\u0447."}', 'partnership', 1, '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(7, '{"en":"For employers","ru":"\\u0420\\u0430\\u0431\\u043e\\u0442\\u043e\\u0434\\u0430\\u0442\\u0435\\u043b\\u044f\\u043c"}', '{"en":"For employers","ru":"\\u0420\\u0430\\u0431\\u043e\\u0442\\u043e\\u0434\\u0430\\u0442\\u0435\\u043b\\u044f\\u043c"}', NULL, NULL, NULL, '{"ru":"\\u041a\\u0430\\u043d\\u0430\\u0440\\u0438 \\u0441 \\u0442\\u043e\\u043b\\u0441\\u0442\\u044b\\u043c\\u0438 \\u043b\\u0438\\u0446\\u0430\\u043c\\u0438 \\u0438 \\u043f\\u0435\\u0440\\u0435\\u0432\\u044f\\u0437\\u0430\\u043d\\u043d\\u044b\\u043c\\u0438 \\u0433\\u0440\\u0443\\u0434\\u044f\\u043c\\u0438 \\u0441\\u043c\\u043e\\u0442\\u0440\\u0435\\u043b\\u0438 \\u0438\\u0437 \\u0432\\u0435\\u0440\\u0445\\u043d\\u0438\\u0445 \\u043e\\u043a\\u043e\\u043d; \\u0438\\u0437 \\u043d\\u0438\\u0436\\u043d\\u0438\\u0445 \\u0433\\u043b\\u044f\\u0434\\u0435\\u043b \\u0442\\u0435\\u043b\\u0435\\u043d\\u043e\\u043a \\u0438\\u043b\\u0438 \\u0432\\u044b\\u0441\\u043e\\u0432\\u044b\\u0432\\u0430\\u043b\\u0430 \\u0441\\u043b\\u0435\\u043f\\u0443\\u044e \\u043c\\u043e\\u0440\\u0434\\u0443 \\u0441\\u0432\\u043e\\u044e \\u0441\\u0432\\u0438\\u043d\\u044c\\u044f. \\u0421\\u043b\\u043e\\u0432\\u043e\\u043c, \\u0432\\u0438\\u0434\\u044b \\u0438\\u0437\\u0432\\u0435\\u0441\\u0442\\u043d\\u044b\\u0435. \\u041f\\u0440\\u043e\\u0435\\u0445\\u0430\\u0432\\u0448\\u0438 \\u043f\\u044f\\u0442\\u043d\\u0430\\u0434\\u0446\\u0430\\u0442\\u0443\\u044e \\u0432\\u0435\\u0440\\u0441\\u0442\\u0443, \\u043e\\u043d \\u0432\\u0441\\u043f\\u043e\\u043c\\u043d\\u0438\\u043b, \\u0447\\u0442\\u043e \\u0435\\u0441\\u043b\\u0438 \\u043f\\u0440\\u0438\\u044f\\u0442\\u0435\\u043b\\u044c \\u043f\\u0440\\u0438\\u0433\\u043b\\u0430\\u0448\\u0430\\u0435\\u0442 \\u043a \\u0441\\u0435\\u0431\\u0435 \\u0432\\u043e\\u0437\\u0434\\u0443\\u0445 \\u043d\\u0430 \\u0441\\u0432\\u0435\\u0436\\u0438\\u0439 \\u043d\\u043e\\u0441 \\u043f\\u043e\\u0443\\u0442\\u0440\\u0443, \\u0442\\u043e\\u043b\\u044c\\u043a\\u043e \\u043f\\u043e\\u043c\\u0430\\u0440\\u0449\\u0438\\u0432\\u0430\\u043b\\u0441\\u044f \\u0434\\u0430 \\u0432\\u0441\\u0442\\u0440\\u044f\\u0445\\u0438\\u0432\\u0430\\u043b \\u0433\\u043e\\u043b\\u043e\\u0432\\u043e\\u044e, \\u043f\\u0440\\u0438\\u0433\\u043e\\u0432\\u0430\\u0440\\u0438\\u0432\\u0430\\u044f: \\u00ab\\u0422\\u044b, \\u0431\\u0440\\u0430\\u0442, \\u0447\\u0435\\u0440\\u0442 \\u0442\\u0435\\u0431\\u044f \\u0437\\u043d\\u0430\\u0435\\u0442, \\u043f\\u043e\\u0442\\u0435\\u0435\\u0448\\u044c, \\u0447\\u0442\\u043e \\u043b\\u0438. \\u0421\\u0445\\u043e\\u0434\\u0438\\u043b \\u0431\\u044b \\u0442\\u044b \\u0441\\u0438\\u043b\\u044c\\u043d\\u043e \\u043f\\u043e\\u0449\\u0435\\u043b\\u043a\\u0438\\u0432\\u0430\\u043b, \\u0441\\u043c\\u0435\\u043a\\u043d\\u0443\\u0432\\u0448\\u0438, \\u0447\\u0442\\u043e \\u043f\\u043e\\u043a\\u0443\\u043f\\u0449\\u0438\\u043a, \\u0432\\u0435\\u0440\\u043d\\u043e, \\u0434\\u043e\\u043b\\u0436\\u0435\\u043d \\u0438\\u043c\\u0435\\u0442\\u044c \\u2014 \\u0437\\u0434\\u0435\\u0441\\u044c \\u043a\\u0430\\u043a\\u0443\\u044e-\\u043d\\u0438\\u0431\\u0443\\u0434\\u044c \\u0432\\u044b\\u0433\\u043e\\u0434\\u0443. \\u00ab\\u0427\\u0435\\u0440\\u0442 \\u0432\\u043e\\u0437\\u044c\\u043c\\u0438, \\u2014 \\u043f\\u043e\\u0434\\u0443\\u043c\\u0430\\u043b \\u043f\\u0440\\u043e \\u0441\\u0435\\u0431\\u044f \\u0421\\u0435\\u043b\\u0438\\u0444\\u0430\\u043d. \\u2014 \\u041f\\u043e\\u0433\\u043b\\u044f\\u0434\\u0438-\\u043a\\u0430, \\u043d\\u0435 \\u0432\\u0438\\u0434\\u043d\\u043e \\u043b\\u0438 \\u0434\\u0435\\u0440\\u0435\\u0432\\u043d\\u0438? \\u2014 \\u041d\\u0435\\u0442, \\u2014 \\u0441\\u043a\\u0430\\u0437\\u0430\\u043b \\u043c\\u0443\\u0436\\u0438\\u043a. \\u2014 \\u042d\\u0442\\u043e \\u043c\\u043e\\u044f \\u0424\\u0435\\u043e\\u0434\\u0443\\u043b\\u0438\\u044f \\u0418\\u0432\\u0430\\u043d\\u043e\\u0432\\u043d\\u0430! \\u2014 \\u0441\\u043a\\u0430\\u0437\\u0430\\u043b \\u041c\\u0430\\u043d\\u0438\\u043b\\u043e\\u0432 \\u0442\\u043e\\u0436\\u0435 \\u043b\\u0430\\u0441\\u043a\\u043e\\u0432\\u043e \\u0438 \\u043a\\u0430\\u043a \\u0431\\u044b \\u0440\\u0435\\u0447\\u044c \\u0448\\u043b\\u0430 \\u043e \\u0445\\u043b\\u0435\\u0431\\u0435. \\u2014 \\u0414\\u0430, \\u0431\\u044b\\u043b \\u0431\\u044b \\u0442\\u043e\\u0442 \\u0436\\u0435, \\u0445\\u043e\\u0442\\u044f \\u0431\\u044b \\u0434\\u0430\\u0436\\u0435 \\u0432\\u043e\\u0441\\u043f\\u0438\\u0442\\u0430\\u043b\\u0438 \\u0442\\u0435\\u0431\\u044f \\u043f\\u043e \\u043c\\u043e\\u0434\\u0435, \\u043f\\u0443\\u0441\\u0442\\u0438\\u043b\\u0438 \\u0431\\u044b \\u0432 \\u0431\\u0443\\u043c\\u0430\\u0436\\u043d\\u0438\\u043a. \\u2014 \\u0422\\u044b, \\u043f\\u043e\\u0436\\u0430\\u043b\\u0443\\u0439\\u0441\\u0442\\u0430, \\u0438\\u0445 \\u043f\\u0435\\u0440\\u0435\\u0447\\u0442\\u0438, \\u2014 \\u0441\\u043a\\u0430\\u0437\\u0430\\u043b \\u0427\\u0438\\u0447\\u0438\\u043a\\u043e\\u0432. \\u2014 \\u041d\\u0435\\u0442, \\u0432\\u043e\\u0437\\u044c\\u043c\\u0438-\\u043a\\u0430 \\u043d\\u0430\\u0440\\u043e\\u0447\\u043d\\u043e, \\u043f\\u043e\\u0449\\u0443\\u043f\\u0430\\u0439 \\u0443\\u0448\\u0438! \\u0427\\u0438\\u0447\\u0438\\u043a\\u043e\\u0432 \\u0432 \\u043f\\u043e\\u0441\\u043b\\u0435 \\u043c\\u0438\\u043d\\u0443\\u0442\\u043d\\u043e\\u0433\\u043e \\u00ab\\u0440\\u0430\\u0437\\u043c\\u044b\\u0448\\u043b\\u0435\\u043d\\u0438\\u044f \\u043e\\u0431\\u044a\\u044f\\u0432\\u0438\\u043b, \\u0447\\u0442\\u043e \\u043c\\u0435\\u0440\\u0442\\u0432\\u044b\\u0435 \\u0434\\u0443\\u0448\\u0438 \\u0434\\u0435\\u043b\\u043e \\u043d\\u0435 \\u0448\\u043b\\u043e \\u0438 \\u043d\\u0435 \\u2014 \\u0431\\u044b\\u043b\\u043e\\u2026 \\u044f \\u0434\\u0443\\u043c\\u0430\\u044e \\u0441\\u0435\\u0431\\u0435 \\u0442\\u043e\\u043b\\u044c\\u043a\\u043e: \\u00ab\\u0447\\u0435\\u0440\\u0442 \\u0432\\u043e\\u0437\\u044c\\u043c\\u0438!\\u00bb \\u0410 \\u041a\\u0443\\u0432\\u0448\\u0438\\u043d\\u043d\\u0438\\u043a\\u043e\\u0432, \\u0442\\u043e \\u0435\\u0441\\u0442\\u044c \\u0447\\u0435\\u043b\\u043e\\u0432\\u0435\\u043a \\u043d\\u0430 \\u0432\\u0441\\u0435 \\u0440\\u0443\\u043a\\u0438. \\u0412 \\u0442\\u0443 \\u0436\\u0435 \\u0446\\u0435\\u043d\\u0443. \\u041a\\u043e\\u0433\\u0434\\u0430 \\u043e\\u043d \\u0442\\u0430\\u043a\\u0438\\u043c \\u0436\\u0435 \\u0432\\u0435\\u0436\\u043b\\u0438\\u0432\\u044b\\u043c \\u043f\\u043e\\u043a\\u043b\\u043e\\u043d\\u043e\\u043c. \\u041e\\u043d\\u0438 \\u0441\\u0435\\u043b\\u0438 \\u0437\\u0430 \\u0437\\u0435\\u043b\\u0435\\u043d\\u044b\\u0439 \\u0441\\u0442\\u043e\\u043b \\u0438 \\u0441\\u0436\\u0430\\u043b\\u0430 \\u0431\\u0430\\u0442\\u0438\\u0441\\u0442\\u043e\\u0432\\u044b\\u0439 \\u043f\\u043b\\u0430\\u0442\\u043e\\u043a \\u0441 \\u0432\\u044b\\u0448\\u0438\\u0442\\u044b\\u043c\\u0438 \\u0443\\u0433\\u043e\\u043b\\u043a\\u0430\\u043c\\u0438. \\u041e\\u043d\\u0430 \\u043f\\u043e\\u0434\\u043d\\u044f\\u043b\\u0430\\u0441\\u044c \\u0441 \\u0434\\u0438\\u0432\\u0430\\u043d\\u0430, \\u043d\\u0430 \\u043a\\u043e\\u0442\\u043e\\u0440\\u043e\\u043c \\u043b\\u0435\\u0436\\u0430\\u043b\\u0430 \\u043a\\u043d\\u0438\\u0436\\u043a\\u0430 \\u0441 \\u0437\\u0430\\u043b\\u043e\\u0436\\u0435\\u043d\\u043d\\u043e\\u044e \\u0437\\u0430\\u043a\\u043b\\u0430\\u0434\\u043a\\u043e\\u044e, \\u043e \\u043a\\u043e\\u0442\\u043e\\u0440\\u043e\\u0439 \\u043c\\u044b \\u0443\\u0436\\u0435 \\u0438\\u043c\\u0435\\u043b\\u0438 \\u0441\\u043b\\u0443\\u0447\\u0430\\u0439 \\u0443\\u043f\\u043e\\u043c\\u044f\\u043d\\u0443\\u0442\\u044c, \\u043d\\u0435\\u0441\\u043a\\u043e\\u043b\\u044c\\u043a\\u043e \\u0438\\u0441\\u043f\\u0438\\u0441\\u0430\\u043d\\u043d\\u044b\\u0445 \\u0431\\u0443\\u043c\\u0430\\u0433, \\u043d\\u043e \\u0431\\u043e\\u043b\\u044c\\u0448\\u0435 \\u0441\\u0430\\u043c\\u043e\\u0435 \\u0447\\u0442\\u0435\\u043d\\u0438\\u0435, \\u0438\\u043b\\u0438, \\u043b\\u0443\\u0447\\u0448\\u0435 \\u0441\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c, \\u043f\\u0440\\u043e\\u0446\\u0435\\u0441\\u0441 \\u0441\\u0430\\u043c\\u043e\\u0433\\u043e \\u0447\\u0442\\u0435\\u043d\\u0438\\u044f, \\u0447\\u0442\\u043e \\u0432\\u043e\\u0442-\\u0434\\u0435 \\u0438\\u0437 \\u0431\\u0443\\u043a\\u0432 \\u0432\\u0435\\u0447\\u043d\\u043e \\u0432\\u044b\\u0445\\u043e\\u0434\\u0438\\u0442 \\u043a\\u0430\\u043a\\u043e\\u0435-\\u043d\\u0438\\u0431\\u0443\\u0434\\u044c \\u0441\\u043b\\u043e\\u0432\\u043e, \\u043a\\u043e\\u0442\\u043e\\u0440\\u043e\\u0435 \\u0438\\u043d\\u043e\\u0439 \\u0440\\u0430\\u0437 \\u0432\\u043b\\u0438\\u0432\\u0430\\u043b\\u0438 \\u0442\\u0443\\u0434\\u0430 \\u0438 \\u0441\\u044e\\u0434\\u0430; \\u0438\\u0445 \\u0441\\u0443\\u0449\\u0435\\u0441\\u0442\\u0432\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435 \\u043a\\u0430\\u043a-\\u0442\\u043e \\u0441\\u043b\\u0438\\u0448\\u043a\\u043e\\u043c \\u043b\\u0435\\u0433\\u043a\\u043e, \\u0432\\u043e\\u0437\\u0434\\u0443\\u0448\\u043d\\u043e \\u0438 \\u0441\\u043e\\u0432\\u0441\\u0435\\u043c \\u043d\\u0435\\u043e\\u0436\\u0438\\u0434\\u0430\\u043d\\u043d\\u044b\\u043c."}', 'for-employers', 1, '2021-08-31 14:14:35', '2021-08-31 14:14:35'),
(8, '{"en":"Rules of use","ru":"\\u041f\\u0440\\u0430\\u0432\\u0438\\u043b\\u0430 \\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u044f"}', '{"en":"Rules of use JOBZZ.RU","ru":"\\u041f\\u0440\\u0430\\u0432\\u0438\\u043b\\u0430 \\u043f\\u043e\\u043b\\u044c\\u0437\\u043e\\u0432\\u0430\\u043d\\u0438\\u044f JOBZZ.RU"}', NULL, NULL, NULL, NULL, 'rules', 1, '2021-09-20 12:03:48', '2021-09-20 12:03:48'),
(9, '{"en":"Home Page","ru":"\\u0414\\u043e\\u043c\\u0430\\u0448\\u043d\\u044f\\u044f \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430"}', '{"en":"ANONYMOUS JOB SEARCH\\nON THE JOBZZ.RU","ru":"\\u0410\\u041d\\u041e\\u041d\\u0418\\u041c\\u041d\\u042b\\u0419 \\u041f\\u041e\\u0418\\u0421\\u041a\\n\\u0420\\u0410\\u0411\\u041e\\u0422\\u042b \\u0412 \\u0410\\u0419\\u0422\\u0418 \\u0421\\u0424\\u0415\\u0420\\u0415"}', '{"en":"Jobzz work in IT for developers in Moscow or remotely","ru":"Jobzz \\u0440\\u0430\\u0431\\u043e\\u0442\\u0430 \\u0432 \\u0430\\u0439\\u0442\\u0438 \\u0434\\u043b\\u044f \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u0447\\u0438\\u043a\\u043e\\u0432 \\u0432 \\u041c\\u043e\\u0441\\u043a\\u0432\\u0435 \\u0438\\u043b\\u0438 \\u0443\\u0434\\u0430\\u043b\\u0451\\u043d\\u043d\\u043e"}', '{"en":"Jobzz work in IT for developers in Moscow or remotely","ru":"Jobzz \\u0440\\u0430\\u0431\\u043e\\u0442\\u0430 \\u0432 \\u0430\\u0439\\u0442\\u0438 \\u0434\\u043b\\u044f \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u0447\\u0438\\u043a\\u043e\\u0432 \\u0432 \\u041c\\u043e\\u0441\\u043a\\u0432\\u0435 \\u0438\\u043b\\u0438 \\u0443\\u0434\\u0430\\u043b\\u0451\\u043d\\u043d\\u043e"}', '{"en":"Jobzz work in IT for developers in Moscow or remotely","ru":"Jobzz \\u0440\\u0430\\u0431\\u043e\\u0442\\u0430 \\u0432 \\u0430\\u0439\\u0442\\u0438 \\u0434\\u043b\\u044f \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u0447\\u0438\\u043a\\u043e\\u0432 \\u0432 \\u041c\\u043e\\u0441\\u043a\\u0432\\u0435 \\u0438\\u043b\\u0438 \\u0443\\u0434\\u0430\\u043b\\u0451\\u043d\\u043d\\u043e"}', NULL, 'home', 1, '2021-10-15 09:16:53', '2021-10-15 09:16:53');

-- 
-- Вывод данных для таблицы offers
--
INSERT INTO offers VALUES
(23, 1, 30, 8, 0, 1, NULL, 2, NULL, 0, 1, 'Добрый день!\nНам интересен Ваш профиль и мы хотим предложить Вам на рассмотрение нашу вакансию. Будем рады ознакомиться с Вашим резюме)', NULL, NULL, '2021-08-30 21:00:00', '2021-08-24 08:56:40', '2021-08-30 11:44:31', NULL),
(24, 1, 4, 8, 0, 1, NULL, 1, NULL, 0, 1, 'Добрый день!\nНам интересен Ваш профиль и мы хотим предложить Вам на рассмотрение нашу вакансию. Будем рады ознакомиться с Вашим резюме)', NULL, NULL, '2021-09-30 00:00:00', '2021-08-24 08:59:00', '2021-08-24 09:02:26', NULL),
(25, 2, 4, 8, 0, 1, NULL, 0, '2021-09-06 10:57:05', 0, 0, 'Добрый день! Test Recruiter\nМне интересна ваша вакансия Android Developer\nhttp://jobzz.loc/vacancies/android-developer\n\nОткрываю свои контакты и резюме\n\nС нетерпением буду ждать вашего ответа)\n\n--------------------------------------------\nС уважением Vadim Krachulov\nvadox.dev@gmail.com', 'TestResume.docx', 'public/resume/20210830/0O0Szta5NkRVPrBjG0zoR59usLpiXjR1cmB0VFQg.docx', NULL, '2021-08-30 10:57:05', '2021-08-30 10:57:05', NULL),
(26, 12, 63, 55, 0, 1, NULL, 2, NULL, 0, 1, 'Добрый день!\nНам интересен Ваш профиль и мы хотим предложить Вам на рассмотрение нашу вакансию. Будем рады ознакомиться с Вашим резюме)', NULL, NULL, '2021-09-30 00:00:00', '2021-09-15 14:40:36', '2021-09-16 08:08:30', NULL),
(39, 41, 64, 61, 0, 1, NULL, 0, '2021-09-24 10:42:30', 0, 0, 'Добрый день! Оксана Доронина\nМне интересна ваша вакансия C/C++/Embedded Developer\nhttp://jobzz.loc/vacancies/41-ccembedded-developer\n\nОткрываю свои контакты и резюме\n\nС нетерпением буду ждать вашего ответа)\n\n--------------------------------------------\nС уважением Test Payment\ncandidate1@gmail.com', 'TestResume.docx', 'public/resume/20210917/fH0AycHKqh0sbKLJHxF49ExqVrMJXxDP4KEgp3nI.docx', NULL, '2021-09-17 10:42:30', '2021-09-17 10:42:30', NULL),
(40, 15, 64, 55, 0, 1, NULL, 2, NULL, 0, 0, 'Добрый день! Дина Шубина\nМне интересна ваша вакансия Sales Manager\nhttp://jobzz.loc/vacancies/15-sales-manager\n\nОткрываю свои контакты и резюме\n\nС нетерпением буду ждать вашего ответа)\n\n--------------------------------------------\nС уважением Test Payment\ncandidate1@gmail.com', 'TestResume.docx', 'public/resume/20210917/DnNakrbs4aqsrxU2tund9LpZ1YLBC6BnI7fPzT5p.docx', '2021-09-23 00:00:00', '2021-09-17 10:54:31', '2021-09-20 14:55:44', NULL),
(41, 36, 64, 60, 0, 1, NULL, 0, '2021-09-24 16:58:23', 0, 0, 'Добрый день! Кирилл Пономарёв\nМне интересна ваша вакансия Support Manager\nhttp://jobzz.loc/vacancies/36-support-manager\n\nОткрываю свои контакты и резюме\n\nС нетерпением буду ждать вашего ответа)\n\n--------------------------------------------\nС уважением Test Payment\ncandidate1@gmail.com', 'TestResume.docx', 'public/resume/20210917/4LR2nyzRWjdEEEwlmbqgYPBanYdWNlFuFxSI90uy.docx', NULL, '2021-09-17 16:58:26', '2021-10-07 09:36:41', '2021-10-07 09:36:41'),
(42, 11, 64, 55, 0, 1, NULL, 0, '2021-09-24 16:59:25', 0, 0, 'Добрый день! Дина Шубина\nМне интересна ваша вакансия UI/UX/Design Manager\nhttp://jobzz.loc/vacancies/11-uiuxdesign-manager\n\nОткрываю свои контакты и резюме\n\nС нетерпением буду ждать вашего ответа)\n\n--------------------------------------------\nС уважением Test Payment\ncandidate1@gmail.com', 'TestResume.docx', 'public/resume/20210917/4LR2nyzRWjdEEEwlmbqgYPBanYdWNlFuFxSI90uy.docx', NULL, '2021-09-17 16:59:25', '2021-09-17 16:59:25', NULL),
(44, 12, 64, 55, 0, 1, NULL, 0, '2021-09-24 17:12:49', 0, 0, 'Добрый день! Дина Шубина\nМне интересна ваша вакансия Other Manager\nhttp://jobzz.loc/vacancies/12-other-manager\n\nОткрываю свои контакты и резюме\n\nС нетерпением буду ждать вашего ответа)\n\n--------------------------------------------\nС уважением Test Payment\ncandidate1@gmail.com', 'TestResume.docx', 'public/resume/20210917/4LR2nyzRWjdEEEwlmbqgYPBanYdWNlFuFxSI90uy.docx', NULL, '2021-09-17 17:12:49', '2021-09-17 17:12:49', NULL),
(45, 50, 64, 62, 0, 1, NULL, 2, NULL, 0, 0, 'Добрый день! Жанна Авдеева\nМне интересна ваша вакансия Android Developer\nhttp://jobzz.loc/vacancies/50-android-developer\n\nОткрываю свои контакты и резюме\nТелефон: +380978623299\nSkype: @testskype\nTelegram: @test\nLinked In: https://www.linkedin.com/in/test-candidate/\nС нетерпением буду ждать вашего ответа)--------------------------------------------\nС уважением Test Payment\ncandidate1@gmail.com', 'Zaklyuchenie_dogovora_po_Platezhnomu_porucheniyu.pdf', 'public/resume/20211007/o8UyNUj7zg3HABGezIU0GyolgYbxZnRNcfDXM9G2.pdf', '2021-10-21 00:00:00', '2021-10-07 10:28:35', '2021-10-07 11:31:44', NULL),
(46, 57, 63, 62, 0, 0, '2021-10-14 18:19:18', 1, NULL, 0, 1, 'Добрый день!\nНам интересен Ваш профиль и мы хотим предложить Вам на рассмотрение нашу вакансию. Будем рады ознакомиться с Вашим резюме)', NULL, NULL, NULL, '2021-10-07 18:19:18', '2021-10-07 18:19:18', NULL),
(47, 56, 63, 62, 0, 0, '2021-10-14 18:22:50', 1, NULL, 0, 1, 'Добрый день!\nНам интересен Ваш профиль и мы хотим предложить Вам на рассмотрение нашу вакансию. Будем рады ознакомиться с Вашим резюме)', NULL, NULL, NULL, '2021-10-07 18:22:50', '2021-10-07 18:22:50', NULL),
(48, 55, 63, 62, 0, 0, '2021-10-14 18:24:37', 1, NULL, 0, 1, 'Добрый день!\nНам интересен Ваш профиль и мы хотим предложить Вам на рассмотрение нашу вакансию. Будем рады ознакомиться с Вашим резюме)', NULL, NULL, NULL, '2021-10-07 18:24:37', '2021-10-07 18:24:37', NULL),
(49, 11, 35, 55, 0, 0, '2021-10-28 15:48:41', 1, NULL, 0, 1, 'Добрый день!\nНам интересен Ваш профиль и мы хотим предложить Вам на рассмотрение нашу вакансию. Будем рады ознакомиться с Вашим резюме)', NULL, NULL, NULL, '2021-10-21 15:48:41', '2021-10-21 15:48:41', NULL),
(52, 58, 68, 69, 0, 0, '2021-11-02 16:51:38', 1, NULL, 0, 1, 'Добрый день!\nНам интересен Ваш профиль и мы хотим предложить Вам на рассмотрение нашу вакансию. Будем рады ознакомиться с Вашим резюме)', NULL, NULL, NULL, '2021-10-26 16:51:38', '2021-10-26 16:51:38', NULL),
(53, 59, 35, 76, 0, 0, '2021-11-08 09:15:11', 2, NULL, 0, 1, 'Добрый день!\nНам интересен Ваш профиль и мы хотим предложить Вам на рассмотрение нашу вакансию. Будем рады ознакомиться с Вашим резюме)', NULL, NULL, '2021-11-24 22:00:00', '2021-11-01 09:15:11', '2021-11-01 09:15:45', NULL),
(54, 60, 68, 76, 0, 0, '2021-11-08 09:18:48', 2, NULL, 0, 1, 'Добрый день!\nНам интересен Ваш профиль и мы хотим предложить Вам на рассмотрение нашу вакансию. Будем рады ознакомиться с Вашим резюме)', NULL, NULL, '2021-11-25 22:00:00', '2021-11-01 09:18:48', '2021-11-01 09:19:04', NULL),
(55, 59, 68, 76, 0, 1, NULL, 2, NULL, 0, 0, 'Добрый день! Notify Test\nМне интересна ваша вакансия Test Payment Vacancy\nhttp://jobzz.loc/vacancies/59-test-payment-vacancy\n\nОткрываю свои контакты и резюме\n\nС нетерпением буду ждать вашего ответа)\n\n--------------------------------------------\nС уважением Крачулов Вадим\nvadox.dev@gmail.com', '44a44d1018d664612010e29440526b13.docx', 'public/resume/20211214/XUydlxU0vxI4qO1wZZ7990c5c7wqS6GPtx9ja4hz.docx', '2021-12-29 22:00:00', '2021-12-14 10:47:26', '2021-12-20 11:11:50', NULL),
(56, 59, 66, 76, 0, 0, '2021-12-24 13:14:42', 1, NULL, 0, 1, 'Добрый день!\nНам интересен Ваш профиль и мы хотим предложить Вам на рассмотрение нашу вакансию. Будем рады ознакомиться с Вашим резюме)', NULL, NULL, NULL, '2021-12-17 13:14:42', '2021-12-17 13:14:42', NULL),
(57, 59, 79, 76, 0, 0, '2022-01-05 11:02:16', 1, NULL, 0, 1, 'Добрый день!\nНам интересен Ваш профиль и мы хотим предложить Вам на рассмотрение нашу вакансию. Будем рады ознакомиться с Вашим резюме)', NULL, NULL, NULL, '2021-12-29 11:02:16', '2021-12-29 11:02:16', NULL);

-- 
-- Вывод данных для таблицы notify_settings
--
INSERT INTO notify_settings VALUES
(1, 63, 1, 0, 0, 1, 1, 1, 1, 1, 1, '2021-10-07 18:03:00', '2021-10-07 18:03:00'),
(2, 68, 1, 1, 0, 1, 1, 1, 1, 1, 1, '2021-10-08 15:36:35', '2021-10-26 16:44:33'),
(3, 69, 1, 1, 0, 1, 1, 1, 1, 1, 1, '2021-10-09 10:23:05', '2021-10-26 15:37:36'),
(4, 55, 1, 0, 0, 1, 1, 1, 1, 1, 1, '2021-10-16 12:25:14', '2021-10-16 12:25:14'),
(5, 76, 1, 1, 0, 1, 1, 1, 1, 1, 1, '2021-10-29 10:02:17', '2021-10-29 10:02:17'),
(6, 77, 1, 1, 0, 1, 1, 1, 1, 1, 1, '2021-11-08 09:13:00', '2021-11-08 09:13:00'),
(7, 78, 1, 1, 0, 1, 1, 1, 1, 1, 1, '2021-11-30 09:37:01', '2021-11-30 09:37:01'),
(8, 65, 1, 1, 0, 1, 1, 1, 1, 1, 1, '2022-02-22 09:24:37', '2022-02-22 09:24:37'),
(9, 81, 1, 1, 0, 1, 1, 1, 1, 1, 1, '2022-02-22 11:07:46', '2022-02-22 11:07:46');

-- 
-- Вывод данных для таблицы notification_logs
--
INSERT INTO notification_logs VALUES
(3, 'chat-message-mail', 'App\\Models\\Auth\\User', 55, 54, NULL, '2021-09-17 10:51:55', '2021-09-17 10:51:55');

-- 
-- Вывод данных для таблицы notification_items
--
INSERT INTO notification_items VALUES
(1, NULL, 'info', 'admin', 'user-check', NULL, 'Зарегистрирован новый рекрутер', 'Новый рекрутер <a href=''http://jobzz.loc/admin/recruiter/81''>Recruiter Test</a> требует модерации', 0, '2022-02-22 09:27:37', '2022-02-22 09:27:37');

-- 
-- Вывод данных для таблицы model_has_roles
--
INSERT INTO model_has_roles VALUES
(1, 'App\\Models\\Auth\\User', 1),
(2, 'App\\Models\\Auth\\User', 2),
(3, 'App\\Models\\Auth\\User', 3),
(3, 'App\\Models\\Auth\\User', 4),
(3, 'App\\Models\\Auth\\User', 5),
(3, 'App\\Models\\Auth\\User', 6),
(3, 'App\\Models\\Auth\\User', 7),
(3, 'App\\Models\\Auth\\User', 8),
(3, 'App\\Models\\Auth\\User', 9),
(3, 'App\\Models\\Auth\\User', 10),
(3, 'App\\Models\\Auth\\User', 11),
(3, 'App\\Models\\Auth\\User', 12),
(3, 'App\\Models\\Auth\\User', 13),
(3, 'App\\Models\\Auth\\User', 14),
(3, 'App\\Models\\Auth\\User', 15),
(3, 'App\\Models\\Auth\\User', 16),
(3, 'App\\Models\\Auth\\User', 17),
(3, 'App\\Models\\Auth\\User', 18),
(3, 'App\\Models\\Auth\\User', 19),
(3, 'App\\Models\\Auth\\User', 20),
(3, 'App\\Models\\Auth\\User', 21),
(3, 'App\\Models\\Auth\\User', 22),
(3, 'App\\Models\\Auth\\User', 23),
(3, 'App\\Models\\Auth\\User', 24),
(3, 'App\\Models\\Auth\\User', 25),
(3, 'App\\Models\\Auth\\User', 26),
(3, 'App\\Models\\Auth\\User', 27),
(3, 'App\\Models\\Auth\\User', 28),
(3, 'App\\Models\\Auth\\User', 29),
(3, 'App\\Models\\Auth\\User', 30),
(3, 'App\\Models\\Auth\\User', 31),
(3, 'App\\Models\\Auth\\User', 32),
(3, 'App\\Models\\Auth\\User', 33),
(3, 'App\\Models\\Auth\\User', 34),
(3, 'App\\Models\\Auth\\User', 35),
(3, 'App\\Models\\Auth\\User', 36),
(3, 'App\\Models\\Auth\\User', 37),
(3, 'App\\Models\\Auth\\User', 38),
(3, 'App\\Models\\Auth\\User', 39),
(3, 'App\\Models\\Auth\\User', 40),
(3, 'App\\Models\\Auth\\User', 41),
(3, 'App\\Models\\Auth\\User', 42),
(3, 'App\\Models\\Auth\\User', 43),
(3, 'App\\Models\\Auth\\User', 44),
(3, 'App\\Models\\Auth\\User', 45),
(3, 'App\\Models\\Auth\\User', 46),
(3, 'App\\Models\\Auth\\User', 47),
(3, 'App\\Models\\Auth\\User', 48),
(3, 'App\\Models\\Auth\\User', 49),
(3, 'App\\Models\\Auth\\User', 50),
(3, 'App\\Models\\Auth\\User', 51),
(3, 'App\\Models\\Auth\\User', 52),
(4, 'App\\Models\\Auth\\User', 53),
(4, 'App\\Models\\Auth\\User', 54),
(4, 'App\\Models\\Auth\\User', 55),
(4, 'App\\Models\\Auth\\User', 56),
(4, 'App\\Models\\Auth\\User', 57),
(4, 'App\\Models\\Auth\\User', 58),
(4, 'App\\Models\\Auth\\User', 59),
(4, 'App\\Models\\Auth\\User', 60),
(4, 'App\\Models\\Auth\\User', 62),
(3, 'App\\Models\\Auth\\User', 63),
(3, 'App\\Models\\Auth\\User', 64),
(3, 'App\\Models\\Auth\\User', 65),
(3, 'App\\Models\\Auth\\User', 66),
(3, 'App\\Models\\Auth\\User', 67),
(3, 'App\\Models\\Auth\\User', 68),
(4, 'App\\Models\\Auth\\User', 69),
(4, 'App\\Models\\Auth\\User', 70),
(3, 'App\\Models\\Auth\\User', 71),
(1, 'App\\Models\\Auth\\User', 72),
(2, 'App\\Models\\Auth\\User', 75),
(4, 'App\\Models\\Auth\\User', 76),
(3, 'App\\Models\\Auth\\User', 77),
(4, 'App\\Models\\Auth\\User', 78),
(3, 'App\\Models\\Auth\\User', 79),
(3, 'App\\Models\\Auth\\User', 80),
(4, 'App\\Models\\Auth\\User', 81),
(4, 'App\\Models\\Auth\\User', 82);

-- 
-- Вывод данных для таблицы model_has_permissions
--
-- Таблица jobzzz.model_has_permissions не содержит данных

-- 
-- Вывод данных для таблицы migrations
--
INSERT INTO migrations VALUES
(153, '0000_00_00_000000_create_websockets_statistics_entries_table', 1),
(154, '2014_10_12_000000_create_users_table', 1),
(155, '2014_10_12_100000_create_password_resets_table', 1),
(156, '2019_08_19_000000_create_failed_jobs_table', 1),
(157, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(158, '2020_05_29_020244_create_password_histories_table', 1),
(159, '2021_02_07_070003_create_site_options_table', 1),
(160, '2021_02_07_090212_create_permission_tables', 1),
(161, '2021_02_07_090525_create_media_table', 1),
(162, '2021_02_15_094530_create_pages_table', 1),
(163, '2021_05_20_070502_create_language_lines_table', 1),
(164, '2021_05_20_091150_create_countries_table', 1),
(165, '2021_05_20_091557_create_regions_table', 1),
(166, '2021_05_20_104620_create_cities_table', 1),
(167, '2021_05_20_110647_create_addresses_table', 1),
(168, '2021_05_21_051135_create_specialization_types_table', 1),
(169, '2021_05_21_051542_create_specializations_table', 1),
(170, '2021_05_21_065456_create_experiences_table', 1),
(171, '2021_05_21_070510_create_salaries_table', 1),
(172, '2021_05_21_071332_create_english_levels_table', 1),
(173, '2021_05_21_072954_create_currencies_table', 1),
(174, '2021_05_21_075310_create_employment_types_table', 1),
(175, '2021_05_21_080533_create_skills_table', 1),
(176, '2021_05_21_103230_create_companies_table', 1),
(177, '2021_05_21_105619_create_company_users_table', 1),
(178, '2021_05_21_115235_create_candidate_profiles_table', 1),
(179, '2021_05_21_121341_create_candidate_employment_types_table', 1),
(180, '2021_05_21_121652_create_candidate_cities_table', 1),
(181, '2021_05_21_121907_create_candidate_specializations_table', 1),
(182, '2021_05_21_122649_create_candidate_skills_table', 1),
(183, '2021_05_21_123628_create_vacancies_table', 1),
(184, '2021_05_21_125856_create_vacancy_cities_table', 1),
(185, '2021_05_21_130021_create_vacancy_specializations_table', 1),
(186, '2021_05_21_130235_create_vacancy_employment_types_table', 1),
(187, '2021_06_04_074530_create_candidate_vacancies_table', 1),
(188, '2021_06_16_070826_create_payouts_table', 1),
(189, '2021_06_17_094411_create_notification_items_table', 1),
(190, '2021_06_18_062620_create_payment_methods_table', 1),
(191, '2021_06_19_063750_create_chat_messages_table', 1),
(192, '2021_06_22_131342_create_candidate_open_data_table', 1),
(193, '2021_06_26_075327_create_partners_table', 1),
(194, '2021_06_29_111955_create_html_blocks_table', 1),
(195, '2021_07_13_062257_add_prices_columns_to_vacancies_table', 2),
(196, '2021_07_13_071324_create_vacancy_skills_table', 2),
(197, '2021_07_13_111442_add_agree_column_to_users_table', 2),
(198, '2021_07_14_063800_create_menus_table', 3),
(199, '2021_07_14_063816_create_menu_items_table', 3),
(200, '2021_07_14_120259_change_type_column_in_users_table', 3),
(201, '2021_07_21_064055_create_recruiter_settings_table', 4),
(202, '2021_07_22_112615_create_jobs_table', 5),
(206, '2021_07_23_064409_create_push_questions_table', 6),
(207, '2021_07_26_142702_rename_candidate_vacancies_table', 7),
(208, '2021_08_09_082413_create_specializations_skills_table', 8),
(209, '2021_08_09_140451_add_is_custom_column_to_skills_table', 9),
(215, '2021_08_24_095942_create_invoices_table', 10),
(216, '2021_08_24_101631_add_invoice_id_column_to_payouts_table', 10),
(217, '2021_08_26_104255_add_position_column_to_candidate_skills_table', 11),
(218, '2021_08_26_154500_change_vacancy_id_column_to_offers_table', 12),
(219, '2021_08_26_155554_change_vacancy_id_column_to_payouts_table', 13),
(220, '2021_08_26_170135_change_candidate_id_foreign_to_offers_table', 14),
(221, '2021_08_27_082309_change_candidate_id_foreign_to_payouts_table', 15),
(223, '2021_08_27_100448_add_title_en_column_to_payment_methods_table', 16),
(225, '2021_08_27_131823_add_notification_columns_to_payouts_table', 17),
(230, '2021_09_17_081141_add_chat_id_column_to_users_table', 18),
(231, '2021_09_17_081458_create_notification_logs_table', 18),
(232, '2021_09_20_112111_update_title_column_to_pages_table', 19),
(233, '2021_10_07_092937_add_soft_delete_column_to_offers_table', 20),
(234, '2021_10_07_163052_create_notify_settings_table', 21),
(239, '2021_10_08_110203_add_act_column_to_payouts_table', 22),
(242, '2021_10_25_125343_change_login_column_to_users_table', 23),
(243, '2021_10_25_131845_create_push_subscriptions_table', 24),
(244, '2021_10_25_141048_add_push_column_to_notify_settings_table', 25),
(245, '2021_10_26_130330_create_visitables_table', 26),
(246, '2022_01_28_101156_add_edited_to_chat_messages', 27);

-- 
-- Вывод данных для таблицы menu_items
--
INSERT INTO menu_items VALUES
(1, 1, 0, '{"ru":"\\u0412\\u0430\\u043a\\u0430\\u043d\\u0441\\u0438\\u0438","en":"Vacancies"}', '/vacancies', 0, 0, 1, 1, '2021-09-20 10:23:53', '2021-09-20 10:23:53'),
(2, 1, 0, '{"ru":"\\u0418\\u043d\\u0444\\u043e\\u0440\\u043c\\u0430\\u0446\\u0438\\u044f","en":"Information"}', '/info', 0, 1, 1, 0, '2021-09-20 10:23:53', '2021-10-07 10:38:43'),
(3, 1, 0, '{"ru":"\\u0420\\u0430\\u0431\\u043e\\u0442\\u043e\\u0434\\u0430\\u0442\\u0435\\u043b\\u044f\\u043c","en":"For employers"}', '/for-employers', 2, 1, 1, 0, '2021-09-20 10:23:53', '2021-09-20 10:23:53'),
(4, 2, 0, '{"ru":"\\u0412\\u0430\\u043a\\u0430\\u043d\\u0441\\u0438\\u0438","en":"Vacancies"}', '/vacancies', 0, 1, 1, 0, '2021-09-20 10:23:53', '2021-10-21 17:25:11'),
(5, 2, 0, '{"ru":"\\u0420\\u0430\\u0431\\u043e\\u0442\\u043e\\u0434\\u0430\\u0442\\u0435\\u043b\\u044f\\u043c","en":"For employers"}', '/for-employers', 0, 2, 0, 0, '2021-09-20 10:23:53', '2021-10-21 17:25:11'),
(6, 2, 0, '{"ru":"\\u0418\\u043d\\u0444\\u043e\\u0440\\u043c\\u0430\\u0446\\u0438\\u044f","en":"Information"}', '/info', 0, 3, 1, 0, '2021-09-20 10:23:53', '2021-10-21 17:25:11'),
(7, 2, 0, '{"ru":"\\u042f \\u043d\\u0430\\u0448\\u0451\\u043b \\u0440\\u0430\\u0431\\u043e\\u0442\\u0443","en":"Found a job"}', '/recruiter/confirm', 0, 4, 1, 0, '2021-09-20 10:23:53', '2021-10-21 17:25:11'),
(8, 2, 0, '{"ru":"\\u041a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u044b","en":"Contacts"}', '/contacts', 0, 5, 0, 0, '2021-09-20 10:23:53', '2021-10-21 17:25:11'),
(9, 2, 0, '{"ru":"\\u0421\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u044f","en":"Messages"}', '/messenger', 2, 6, 1, 0, '2021-09-20 10:23:53', '2021-10-21 17:25:11'),
(10, 3, 0, '{"ru":"\\u041a\\u0430\\u043d\\u0434\\u0438\\u0434\\u0430\\u0442\\u044b","en":"Candidates"}', '/candidates', 0, 0, 1, 0, '2021-09-20 10:23:53', '2021-09-20 10:23:53'),
(11, 3, 0, '{"ru":"\\u0418\\u043d\\u0444\\u043e\\u0440\\u043c\\u0430\\u0446\\u0438\\u044f","en":"Information"}', '/info', 0, 1, 0, 0, '2021-09-20 10:23:53', '2021-09-20 10:23:53'),
(12, 3, 0, '{"ru":"\\u0421\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u044f","en":"Messages"}', '/messenger', 0, 2, 1, 0, '2021-09-20 10:23:53', '2021-09-20 10:23:53');

-- 
-- Вывод данных для таблицы media
--
-- Таблица jobzzz.media не содержит данных

-- 
-- Вывод данных для таблицы language_lines
--
INSERT INTO language_lines VALUES
(1, '*', 'Активные', '{"en":"Active"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(2, '*', 'Активные вакансии', '{"en":"Active vacancies"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(3, '*', 'Анонимные', '{"en":"Anonymous"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(4, '*', 'Анонимные вакансии', '{"en":"Anonymous vacancies"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(5, '*', 'Вакансии в холде', '{"en":"Vacancies in the hold"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(6, '*', 'Закрытые вакансии', '{"en":"Closed vacancies"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(10, '*', '(you can also indicate your preferences and directions in which you want to develop)', '{"ru":"(также вы можете указать о своих предпочтениях и направлениях в которых вы хотите развиваться)"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(11, '*', '1 year', '{"ru":"1 год","en":"1 year"}', '2021-11-30 10:46:05', '2022-01-27 11:46:30'),
(12, '*', '2-3 years', '{"ru":"2-3 года"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(13, '*', '2FA', '{"ru":"2fa"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(14, '*', '4-5 years', '{"ru":"4-5 лет"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(15, '*', '5 years or more', '{"ru":"5 лет и более"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(16, '*', '7-10 years', '{"ru":"от 7 до 10 лет"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(17, '*', 'A confirmation link has been sent to your email address.', '{"ru":"На ваш адрес электронной почты была отправлена ссылка для подтверждения."}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(18, '*', 'A fresh verification link has been sent to your email address.', '{"ru":"На ваш адрес электронной почты была отправлена новая ссылка для подтверждения."}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(19, '*', 'About company', '{"ru":"О компании"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(20, '*', 'About myself', '{"ru":"О себе"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(21, '*', 'Access', '{"ru":"Доступ"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(22, '*', 'Access Denied', '{"ru":"Доступ запрещен"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(23, '*', 'Account', '{"ru":"Учетная запись"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(24, '*', 'Account Blocked', '{"ru":"Аккаунт заблокирован"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(25, '*', 'Account Created', '{"ru":"Аккаунт создан"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(26, '*', 'Account Deleted', '{"ru":"Аккаунт удален"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(27, '*', 'Account Deleting', '{"ru":"Удаление аккаунта"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(28, '*', 'Account not found. Please register.', '{"ru":"Аккаунт не найден. Пожалуйста зарегистрируйтесь."}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(29, '*', 'Attach resume!', '{"ru":"Прикрепите резюме!"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(30, '*', 'Act', '{"ru":"Акт"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(31, '*', 'Action', '{"ru":"Действие"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(32, '*', 'Actions', '{"ru":"Действия"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(33, '*', 'Active', '{"ru":"Активный"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(34, '*', 'Activate', '{"ru":"Активировать"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(35, '*', 'Active Users', '{"ru":"Активные пользователи"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(36, '*', 'Active vacancies', '{"ru":"Активные вакансии"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(37, '*', 'Add. Information', '{"ru":"Доп. Информация"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(38, '*', 'Additional Permissions', '{"ru":"Дополнительные разрешения"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(39, '*', 'Additionally', '{"ru":"Дополнительно"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(40, '*', 'Address', '{"ru":"Адрес"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(41, '*', 'Administration', '{"ru":"Администрирование"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(42, '*', 'Administrator', '{"ru":"Администратор"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(43, '*', 'After deleting your account, you will not be able to restore the materials and information posted on the site.', '{"ru":"После удаления аккаунта вы не сможете восстановить размещенные на сайте материалы и информацию."}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(44, '*', 'Alert settings', '{"ru":"Настройки оповещений"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(45, '*', 'All', '{"ru":"Все"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(46, '*', 'All Permissions', '{"ru":"Все разрешения"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(47, '*', 'All Rights Reserved', '{"ru":"Все права защищены"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(48, '*', 'All company vacancies', '{"ru":"Все вакансии компании"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(49, '*', 'Already have an account?', '{"ru":"Уже есть аккаунт?"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(50, '*', 'An error occurred while making a payment. Please try later or another way.', '{"ru":"Ошибка при выполнении оплаты. Попробуйте позже или другой способ."}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(51, '*', 'An experience', '{"ru":"Опыт"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(52, '*', 'Anonymous vacancies', '{"ru":"Анонимные вакансии"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(53, '*', 'Any old backup codes have been invalidated.', '{"ru":"Все старые резервные коды были признаны недействительными."}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(54, '*', 'Applied Filters', '{"ru":"Выбранные фильтры"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(55, '*', 'Applied Sorting', '{"ru":"Выбранная сортировка"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(56, '*', 'Are you an employer?', '{"ru":"Вы работодатель?"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(57, '*', 'Are you ready to collaborate?', '{"ru":"Готовы сотрудничать?"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(58, '*', 'Are you sure you want to delete this entry?', '{"ru":"Вы уверены, что хотите удалить эту запись?"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(59, '*', 'Are you sure you want to delete your account?', '{"ru":"Вы уверены что хотите удалить свой аккаунт?"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(60, '*', 'Are you sure?', '{"ru":"Вы уверены?"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(61, '*', 'Attach file', '{"ru":"Прикрепить файл"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(62, '*', 'Attach resume', '{"ru":"Прикрепить резюме"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(63, '*', 'Attach resume *', '{"ru":"Прикрепить резюме *"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(64, '*', 'Authorization Code', '{"ru":"Код авторизации"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(65, '*', 'Avatar', '{"ru":"Аватар"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(66, '*', 'Awaiting Payment', '{"ru":"Ожидается оплата"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(67, '*', 'Back', '{"ru":"Назад"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(68, '*', 'Back to editing', '{"ru":"Вернуться к редактированию"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(69, '*', 'Basic skills', '{"ru":"Основные навыки"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(70, '*', 'Become a candidate', '{"ru":"Стать кандидатом"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(71, '*', 'Before proceeding, please check your email for a verification link.', '{"ru":"Прежде чем продолжить, проверьте свою электронную почту на наличие ссылки для подтверждения."}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(72, '*', 'Blocked Users', '{"ru":"Заблокированные пользователи"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(73, '*', 'Blog', '{"ru":"Блог"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(74, '*', 'Bulk Actions', '{"ru":"Пакетные действия"}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(75, '*', 'By accepting the privacy policy, you give permission to process and store your personal data.', '{"ru":"Принимая политику конфиденциальности вы даёте разрешение на обработку и хранение своих персональных данных."}', '2021-11-30 10:46:05', '2021-11-30 10:46:05'),
(76, '*', 'Corporate mail only', '{"ru":"Только корпоративная почта"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(77, '*', 'Cancel', '{"ru":"Отмена"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(78, '*', 'Canceled', '{"ru":"Отменено"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(79, '*', 'Candidate Email', '{"ru":"Email кандидата"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(80, '*', 'Candidate hired', '{"ru":"Кандидат нанят"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(81, '*', 'Candidate opened contacts', '{"ru":"Кандидат открыл контакты"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(82, '*', 'Candidate profile', '{"ru":"Профиль кандидата"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(83, '*', 'Candidate registration', '{"ru":"Регистрация кандидата"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(84, '*', 'Candidates', '{"ru":"Кандидаты"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(85, '*', 'Categories by type', '{"ru":"Категории по типу"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(86, '*', 'Change Password', '{"ru":"Сменить пароль"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(87, '*', 'Change Password for :name', '{"ru":"Изменить пароль на :name"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(88, '*', 'Choose no more than 5 skills', '{"ru":"СВыберите не более 5ти навыков"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(89, '*', 'Choose your specialization', '{"ru":"Выберите свою специализацию"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(90, '*', 'Cities in which you are considering a job', '{"ru":"Города в которых рассматриваете работу"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(91, '*', 'Clear', '{"ru":"Очистить"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(92, '*', 'Clear Session', '{"ru":"Очистить сессию"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(93, '*', 'Close', '{"ru":"Закрыть"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(94, '*', 'If you have any problems with clicking the button ":actionText"\nuse this link:', '{"ru":"При возникновении проблем с нажатием кнопки \\":actionText\\"\\nиспользуйте данную ссылку:"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(95, '*', 'Email Confirmation', '{"ru":"Подтверждение электронной почты"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(96, '*', 'Please click the button below to confirm your email address.', '{"ru":"Пожалуйста, нажмите кнопку ниже, чтобы подтвердить свой адрес электронной почты."}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(97, '*', 'If you didn''t create an account, just ignore the email.', '{"ru":"Если вы не создавали учётную запись, просто проигнорируйте письмо."}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(98, '*', 'Close vacancy', '{"ru":"Закрыть вакансию"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(99, '*', 'Closing a vacancy', '{"ru":"Закрытие вакансии"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(100, '*', 'Companies', '{"ru":"Компании"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(101, '*', 'Company', '{"ru":"Компания"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(102, '*', 'Company address', '{"ru":"Адрес компании"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(103, '*', 'Company description', '{"ru":"Описание компании"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(104, '*', 'Company logo', '{"ru":"Лого компании"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(105, '*', 'Company name', '{"ru":"Название компании"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(106, '*', 'Company website', '{"ru":"Веб-сайт компании","en":"Company website"}', '2021-11-30 10:46:06', '2022-01-27 11:51:10'),
(107, '*', 'Confirm Password', '{"ru":"Подтвердите Пароль"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(108, '*', 'Confirm hiring', '{"ru":"Подтвердить найм"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(109, '*', 'Contact details', '{"ru":"Контактные данные"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(110, '*', 'Contact support', '{"ru":"Написать в поддержку"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(111, '*', 'Contact us here', '{"ru":"Свяжитесь с нами тут"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(112, '*', 'Contacts', '{"ru":"Контакты"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(113, '*', 'Copy vacancy link', '{"ru":"Копировать ссылку на вакансию"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(114, '*', 'Copyright', '{"ru":"Авторское право"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(115, '*', 'Country', '{"ru":"Страна"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(116, '*', 'Create Role', '{"ru":"Создать роль"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(117, '*', 'Create User', '{"ru":"Создать пользователя"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(118, '*', 'Create Vacancy', '{"ru":"Создать вакансию"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(119, '*', 'Create a profile', '{"ru":"Создание профиля"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(120, '*', 'Create invoice', '{"ru":"Создать счет"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(121, '*', 'Create page', '{"ru":"Создать страницу"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(122, '*', 'Create vacancy', '{"ru":"Создать вакансию"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(123, '*', 'Current Password', '{"ru":"действующий пароль"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(124, '*', 'Dashboard', '{"ru":"Обзор"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(125, '*', 'Date of Birth', '{"ru":"Дата рождения"}', '2021-11-30 10:46:06', '2021-11-30 10:46:06'),
(126, '*', 'Date of publication', '{"ru":"Дата публикации"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(127, '*', 'Deactivate', '{"ru":"Деактивировать"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(128, '*', 'Deactivated Users', '{"ru":"Деактивированные пользователи"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(129, '*', 'Delete', '{"ru":"Удалить"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(130, '*', 'Delete Account', '{"ru":"Удалить аккаунт"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(131, '*', 'Delete account', '{"ru":"Удалить аккаунт"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(132, '*', 'Delete vacancy', '{"ru":"Удалить вакансию"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(133, '*', 'Deleted Users', '{"ru":"Удаленные пользователи"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(134, '*', 'Description', '{"ru":"Описание"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(135, '*', 'Did our resource help to close the vacancy?', '{"ru":"Помог ли наш ресурс закрыть вакансию?"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(136, '*', 'Did our resource help you find a job?', '{"ru":"Помог ли наш ресурс найти вам работу?"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(137, '*', 'Disable Two Factor Authentication', '{"ru":"Отключить двухфакторную аутентификацию"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(138, '*', 'Docs', '{"ru":"Документы"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(139, '*', 'Don''t have an account?', '{"ru":"Нет аккаунта?"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(140, '*', 'Download', '{"ru":"Скачать"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(141, '*', 'Download invoice', '{"ru":"Скачать счет"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(142, '*', 'Drag the file here <br> or upload from your device', '{"ru":"Перетащите файл сюда <br> или загрузите с устройства"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(143, '*', 'E-mail', '{"ru":"Эл. почта"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(144, '*', 'E-mail Address', '{"ru":"Адрес электронной почты"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(145, '*', 'E-mail Verified', '{"ru":"E-mail подтвержден"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(146, '*', 'Each code can only be used once!', '{"ru":"Каждый код может быть использован только один раз!"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(147, '*', 'Edit', '{"ru":"Редактировать"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(148, '*', 'Edit Information', '{"ru":"Редактировать информацию"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(149, '*', 'Edit Vacancy', '{"ru":"Редактировать вакансию"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(150, '*', 'Edit page', '{"ru":"Редактировать страницу"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(151, '*', 'Editing :role', '{"ru":"Редактирование :role"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(152, '*', 'Email', '{"ru":"Email"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(153, '*', 'Email notifications', '{"ru":"Email уведомления"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(154, '*', 'Employment type', '{"ru":"Тип занятости"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(155, '*', 'Enable Two Factor Authentication', '{"ru":"Включить двухфакторную аутентификацию"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(156, '*', 'English Level', '{"ru":"Уровень английского языка","en":"English Level"}', '2021-11-30 10:46:07', '2021-11-30 11:44:06'),
(157, '*', 'English level', '{"ru":"Уровень английского","en":"English Level"}', '2021-11-30 10:46:07', '2021-11-30 11:45:00'),
(158, '*', 'Enter keywords', '{"ru":"Введите ключевые слова"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(159, '*', 'Enter name...', '{"ru":"Введите имя..."}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(160, '*', 'Enter position', '{"ru":"Введите должность"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(161, '*', 'Enter text', '{"ru":"Введите текст"}', '2021-11-30 10:46:07', '2021-11-30 10:46:07'),
(162, '*', 'Enter the name of the city', '{"ru":"Введите название города"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(163, '*', 'Enter vacancy title', '{"ru":"Введите название вакансии"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(164, '*', 'Enter your email', '{"ru":"Введите адрес электронной почты"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(165, '*', 'Enter your name *', '{"ru":"Введите Имя *"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(166, '*', 'Enter your password', '{"ru":"Введите свой пароль"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(167, '*', 'Enter your surname *', '{"ru":"Введите Фамилию *"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(168, '*', 'Experience', '{"ru":"Опыт"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(169, '*', 'Expired', '{"ru":"Просрочено"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(170, '*', 'Female', '{"ru":"Женский"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(171, '*', 'Fill in required fields!', '{"ru":"Заполните обязательные поля!"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(172, '*', 'Filters', '{"ru":"Фильтры"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(173, '*', 'First Name', '{"ru":"Имя"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(174, '*', 'For employers', '{"ru":"Работодателям"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(175, '*', 'For example:', '{"ru":"Например:"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(176, '*', 'For payments from the EU', '{"ru":"Для выплаты из ЕС"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(177, '*', 'For the applicant', '{"ru":"Соискателю"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(178, '*', 'For the employer', '{"ru":"Работодателю"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(179, '*', 'Forgot Your Password?', '{"ru":"Забыли Ваш пароль?"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(180, '*', 'Forgot password?', '{"ru":"Забыли пароль?"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(181, '*', 'Found a bug', '{"ru":"Нашёл баг"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(182, '*', 'Freelance', '{"ru":"Фриланс"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(183, '*', 'Full name', '{"ru":"ФИО"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(184, '*', 'Gender', '{"ru":"Пол"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(185, '*', 'General Permissions', '{"ru":"Общие разрешения"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(186, '*', 'Generate New Backup Codes', '{"ru":"Создать новые резервные коды"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(187, '*', 'Generate a code from your 2FA app and enter it below:', '{"ru":"Сгенерируйте код из вашего приложения 2FA и введите его ниже:"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(188, '*', 'Global settings', '{"ru":"Основные настройки"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(189, '*', 'Go to the payment', '{"ru":"Перейти к оплате"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(190, '*', 'Have questions', '{"ru":"Есть вопросы"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(191, '*', 'Headquarters', '{"ru":"Штаб-квартира"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(192, '*', 'Hello!', '{"ru":"Здравствуйте!"}', '2021-11-30 10:46:08', '2021-11-30 10:46:08'),
(193, '*', 'Help with relocation', '{"ru":"Помощь с релокейтом"}', '2021-11-30 10:46:09', '2021-11-30 10:46:09'),
(194, '*', 'Hide resume', '{"ru":"Скрыть резюме"}', '2021-11-30 10:46:09', '2021-11-30 10:46:09'),
(195, '*', 'Hired a candidate? Tell us please', '{"ru":"Наняли кандидата? Сообщите нам, пожалуйста"}', '2021-11-30 10:46:09', '2021-11-30 10:46:09'),
(196, '*', 'Hiring confirmed', '{"ru":"Найм подтвержден"}', '2021-11-30 10:46:09', '2021-11-30 10:46:09'),
(197, '*', 'Hold vacancy (7 days)', '{"ru":"Поставить на холд (7 дней)"}', '2021-11-30 10:46:09', '2021-11-30 10:46:09'),
(198, '*', 'Home', '{"ru":"Главная"}', '2021-11-30 10:46:09', '2021-11-30 10:46:09'),
(199, '*', 'Home Page', '{"ru":"Главная страница"}', '2021-11-30 10:46:09', '2021-11-30 10:46:09'),
(200, '*', 'How it works', '{"ru":"Как это работает"}', '2021-11-30 10:46:09', '2021-11-30 10:46:09'),
(201, '*', 'Html Block', '{"ru":"Html блок"}', '2021-11-30 10:46:09', '2021-11-30 10:46:09'),
(202, '*', 'Html Blocks', '{"ru":"Html блоки"}', '2021-11-30 10:46:09', '2021-11-30 10:46:09'),
(203, '*', 'I accept', '{"ru":"Я принимаю"}', '2021-11-30 10:46:09', '2021-11-30 10:46:09'),
(204, '*', 'I agree to the', '{"ru":"я согласен с"}', '2021-11-30 10:46:09', '2021-11-30 10:46:09'),
(205, '*', 'I confirm hiring', '{"ru":"Подтверждаю найм"}', '2021-11-30 10:46:09', '2021-11-30 10:46:09'),
(206, '*', 'I disagree with the terms of use. Delete account.', '{"ru":"Отказаться от условий использования и удалить аккаунт"}', '2021-11-30 10:46:09', '2021-11-30 10:46:09'),
(207, '*', 'I have a suggestion', '{"ru":"У меня есть предложение"}', '2021-11-30 10:46:09', '2021-11-30 10:46:09'),
(208, '*', 'I have read and accept the terms of use', '{"ru":"Я прочитал(а) и принимаю условия использования"}', '2021-11-30 10:46:09', '2021-11-30 10:46:09'),
(209, '*', 'I have stored these codes in a safe place', '{"ru":"Я сохранил(а) эти коды в безопасном месте"}', '2021-11-30 10:46:09', '2021-11-30 10:46:09'),
(210, '*', 'I offer a job', '{"ru":"Предлагаю работу"}', '2021-11-30 10:46:09', '2021-11-30 10:46:09'),
(211, '*', 'I want to look around', '{"ru":"Хочу осмотреться"}', '2021-11-30 10:46:09', '2021-11-30 10:46:09'),
(212, '*', 'If you change your e-mail you will be logged out until you confirm your new e-mail address.', '{"ru":"Если вы измените свой адрес электронной почты, вы выйдете из системы, пока не подтвердите свой новый адрес электронной почты."}', '2021-11-30 10:46:09', '2021-11-30 10:46:09'),
(213, '*', 'If you did not create an account, no further action is required.', '{"ru":"Если вы не создали учетную запись, никаких дальнейших действий не требуется."}', '2021-11-30 10:46:09', '2021-11-30 10:46:09'),
(214, '*', 'If you did not receive the email', '{"ru":"Если вы не получили письмо"}', '2021-11-30 10:46:09', '2021-11-30 10:46:09'),
(215, '*', 'If you did not request a password reset, no further action is required.', '{"ru":"Если вы не запрашивали сброс пароля, никаких дальнейших действий не требуется."}', '2021-11-30 10:46:09', '2021-11-30 10:46:09'),
(216, '*', 'If you’re having trouble clicking the ":actionText" button, copy and paste the URL below\ninto your web browser:', '{"ru":"Если у вас возникли проблемы с нажатием кнопки \\":actionText\\", скопируйте и вставьте URL-адрес ниже\\nв ваш веб-браузер:"}', '2021-11-30 10:46:09', '2021-11-30 10:46:09'),
(217, '*', 'In order to apply for a vacancy you need', '{"ru":"Для того, чтоб откликнуться на вакансию нужно"}', '2021-11-30 10:46:09', '2021-11-30 10:46:09'),
(218, '*', 'Inactive', '{"ru":"Неактивный"}', '2021-11-30 10:46:09', '2021-11-30 10:46:09'),
(219, '*', 'Inactive Users', '{"ru":"Неактивные пользователи"}', '2021-11-30 10:46:10', '2021-11-30 10:46:10'),
(220, '*', 'Indicate which of our employers hired you', '{"ru":"Укажите кто из наших работодателей Вас нанял"}', '2021-11-30 10:46:10', '2021-11-30 10:46:10'),
(221, '*', 'Indicate your level of English proficiency', '{"ru":"Укажите ваш уровень владения английским языком"}', '2021-11-30 10:46:10', '2021-11-30 10:46:10'),
(222, '*', 'Indicate level of English proficiency', '{"ru":"Укажите уровень владения английским языком"}', '2021-11-30 10:46:10', '2021-11-30 10:46:10'),
(223, '*', 'Information', '{"ru":"Информация"}', '2021-11-30 10:46:10', '2021-11-30 10:46:10'),
(224, '*', 'Interaction', '{"ru":"Взаимодействие"}', '2021-11-30 10:46:10', '2021-11-30 10:46:10'),
(225, '*', 'Interest', '{"ru":"Заинтересованность"}', '2021-11-30 10:46:10', '2021-11-30 10:46:10'),
(226, '*', 'Invoice', '{"ru":"Счет"}', '2021-11-30 10:46:10', '2021-11-30 10:46:10'),
(227, '*', 'Invoice Order', '{"ru":"Заказ счета"}', '2021-11-30 10:46:10', '2021-11-30 10:46:10'),
(228, '*', 'Invoices', '{"ru":"Счета"}', '2021-11-30 10:46:10', '2021-11-30 10:46:10'),
(229, '*', 'Job', '{"ru":"Работа"}', '2021-11-30 10:46:10', '2021-11-30 10:46:10'),
(230, '*', 'Job Application Sent', '{"ru":"Отклик отправлен"}', '2021-11-30 10:46:10', '2021-11-30 10:46:10'),
(231, '*', 'Job Applications', '{"ru":"Отклики"}', '2021-11-30 10:46:10', '2021-11-30 10:46:10'),
(232, '*', 'Job Categories', '{"ru":"Категории вакансий"}', '2021-11-30 10:46:10', '2021-11-30 10:46:10'),
(233, '*', 'Job Title', '{"ru":"Название вакансии"}', '2021-11-30 10:46:10', '2021-11-30 10:46:10'),
(234, '*', 'Job creation', '{"ru":"Создание вакансии"}', '2021-11-30 10:46:10', '2021-11-30 10:46:10'),
(235, '*', 'Jobs at JOBZZ.RU', '{"ru":"Вакансии на JOBZZ.RU"}', '2021-11-30 10:46:10', '2021-11-30 10:46:10'),
(236, '*', 'Jobzz.ru news', '{"ru":"Новости Jobzz.ru"}', '2021-11-30 10:46:10', '2021-11-30 10:46:10'),
(237, '*', 'Jobzz.ru news (they will be very rare)', '{"ru":"Новости Jobzz.ru (они будут очень редко)"}', '2021-11-30 10:46:10', '2021-11-30 10:46:10'),
(238, '*', 'Last Activity', '{"ru":"Последняя активность"}', '2021-11-30 10:46:10', '2021-11-30 10:46:10'),
(239, '*', 'Last Known IP Address', '{"ru":"Последний известный IP-адрес"}', '2021-11-30 10:46:10', '2021-11-30 10:46:10'),
(240, '*', 'Last Login At', '{"ru":"Последний вход в систему"}', '2021-11-30 10:46:10', '2021-11-30 10:46:10'),
(241, '*', 'Last Name', '{"ru":"Фамилия"}', '2021-11-30 10:46:10', '2021-11-30 10:46:10'),
(242, '*', 'Last Updated', '{"ru":"Последнее обновление"}', '2021-11-30 10:46:11', '2021-11-30 10:46:11'),
(243, '*', 'Leave blank for automatic generation', '{"ru":"Оставьте пустым для автоматической генерации"}', '2021-11-30 10:46:11', '2021-11-30 10:46:11'),
(244, '*', 'Less than a year', '{"ru":"Менее года"}', '2021-11-30 10:46:11', '2021-11-30 10:46:11'),
(245, '*', 'Load more', '{"ru":"Загрузить еще"}', '2021-11-30 10:46:11', '2021-11-30 10:46:11'),
(246, '*', 'Location', '{"ru":"Локация"}', '2021-11-30 10:46:11', '2021-11-30 10:46:11'),
(247, '*', 'Location \\ Cities', '{"ru":"Локация \\\\ Города"}', '2021-11-30 10:46:11', '2021-11-30 10:46:11'),
(248, '*', 'Location selection', '{"ru":"Выбор локации"}', '2021-11-30 10:46:11', '2021-11-30 10:46:11'),
(249, '*', 'Log', '{"ru":"Журнал"}', '2021-11-30 10:46:11', '2021-11-30 10:46:11'),
(250, '*', 'Login', '{"ru":"Авторизация"}', '2021-11-30 10:46:11', '2021-11-30 10:46:11'),
(251, '*', 'Login with Bitbucket', '{"ru":"Войти с помощью Bitbucket"}', '2021-11-30 10:46:11', '2021-11-30 10:46:11'),
(252, '*', 'Login with Facebook', '{"ru":"Войти с Facebook"}', '2021-11-30 10:46:11', '2021-11-30 10:46:11'),
(253, '*', 'Login with Github', '{"ru":"Войти через Github"}', '2021-11-30 10:46:11', '2021-11-30 10:46:11'),
(254, '*', 'Login with Google', '{"ru":"Войти через Google"}', '2021-11-30 10:46:11', '2021-11-30 10:46:11'),
(255, '*', 'Login with Linkedin', '{"ru":"Войти через Linkedin"}', '2021-11-30 10:46:11', '2021-11-30 10:46:11'),
(256, '*', 'Login with Twitter', '{"ru":"Войти через Twitter"}', '2021-11-30 10:46:11', '2021-11-30 10:46:11'),
(257, '*', 'Logo', '{"ru":"Логотип"}', '2021-11-30 10:46:11', '2021-11-30 10:46:11'),
(258, '*', 'Logout', '{"ru":"Выйти"}', '2021-11-30 10:46:11', '2021-11-30 10:46:11'),
(259, '*', 'Logs', '{"ru":"Журналы"}', '2021-11-30 10:46:11', '2021-11-30 10:46:11'),
(260, '*', 'Looking for a job', '{"ru":"Ищу работу"}', '2021-11-30 10:46:11', '2021-11-30 10:46:11'),
(261, '*', 'Looking for a job?', '{"ru":"Ищете работу?"}', '2021-11-30 10:46:11', '2021-11-30 10:46:11'),
(262, '*', 'Looking for a specialist', '{"ru":"Ищу специалиста"}', '2021-11-30 10:46:11', '2021-11-30 10:46:11'),
(263, '*', 'Male', '{"ru":"Мужской"}', '2021-11-30 10:46:11', '2021-11-30 10:46:11'),
(264, '*', 'Menu', '{"ru":"Меню"}', '2021-11-30 10:46:12', '2021-11-30 10:46:12'),
(265, '*', 'Menu management', '{"ru":"Управление меню"}', '2021-11-30 10:46:12', '2021-11-30 10:46:12'),
(266, '*', 'Messages', '{"ru":"Сообщения"}', '2021-11-30 10:46:12', '2021-11-30 10:46:12'),
(267, '*', 'Mob. Phone', '{"ru":"Моб. Телефон"}', '2021-11-30 10:46:12', '2021-11-30 10:46:12'),
(268, '*', 'More', '{"ru":"Больше"}', '2021-11-30 10:46:12', '2021-11-30 10:46:12'),
(269, '*', 'More categories', '{"ru":"Больше категорий"}', '2021-11-30 10:46:12', '2021-11-30 10:46:12'),
(270, '*', 'More details', '{"ru":"Детальнее"}', '2021-11-30 10:46:12', '2021-11-30 10:46:12'),
(271, '*', 'More than 10 years', '{"ru":"Более 10 лет"}', '2021-11-30 10:46:12', '2021-11-30 10:46:12'),
(272, '*', 'Most applications will let you set up by scanning the QR code from within the app. If you prefer, you may type the key below the QR code in manually.', '{"ru":"Большинство приложений позволит вам настроить путем сканирования QR-кода из приложения. При желании вы можете ввести ключ под QR-кодом вручную."}', '2021-11-30 10:46:12', '2021-11-30 10:46:12'),
(273, '*', 'Most suitable job options', '{"ru":"Наиболее подходящие варианты работы"}', '2021-11-30 10:46:12', '2021-11-30 10:46:12'),
(274, '*', 'My Account', '{"ru":"Мой счет"}', '2021-11-30 10:46:12', '2021-11-30 10:46:12'),
(275, '*', 'My Contacts', '{"ru":"Мои контакты"}', '2021-11-30 10:46:12', '2021-11-30 10:46:12'),
(276, '*', 'My Messages', '{"ru":"Мои сообщения"}', '2021-11-30 10:46:12', '2021-11-30 10:46:12'),
(277, '*', 'My Profile', '{"ru":"Мой профиль","en":"My Profile"}', '2021-11-30 10:46:12', '2021-12-29 13:05:41'),
(278, '*', 'My Vacancies', '{"ru":"Мои вакансии"}', '2021-11-30 10:46:12', '2021-11-30 10:46:12'),
(279, '*', 'My account', '{"ru":"Мой аккаунт"}', '2021-11-30 10:46:12', '2021-11-30 10:46:12'),
(280, '*', 'My contacts', '{"ru":"Мои контакты"}', '2021-11-30 10:46:12', '2021-11-30 10:46:12'),
(281, '*', 'My contacts and resume', '{"ru":"Мои контакты и резюме","en":"My contacts and resume"}', '2021-11-30 10:46:12', '2021-12-29 15:31:55'),
(282, '*', 'My profile', '{"ru":"Мой профиль"}', '2021-11-30 10:46:12', '2021-11-30 10:46:12'),
(283, '*', 'My vacancies', '{"ru":"Мои вакансии"}', '2021-11-30 10:46:12', '2021-11-30 10:46:12'),
(284, '*', 'N/A', '{"ru":"N \\/ A"}', '2021-11-30 10:46:12', '2021-11-30 10:46:12'),
(285, '*', 'Name', '{"ru":"Имя"}', '2021-11-30 10:46:13', '2021-11-30 10:46:13'),
(286, '*', 'Need help', '{"ru":"Нужна помощь"}', '2021-11-30 10:46:13', '2021-11-30 10:46:13'),
(287, '*', 'Net (s\\n clean)', '{"ru":"Net (з\\\\п чистыми)"}', '2021-11-30 10:46:13', '2021-11-30 10:46:13'),
(288, '*', 'New Message|New Messages', '{"ru":"Новое сообщение|Новых сообщений"}', '2021-11-30 10:46:13', '2021-11-30 10:46:13'),
(289, '*', 'New Notification|New Notifications', '{"ru":"Новое уведомление|Новых уведомлений"}', '2021-11-30 10:46:13', '2021-11-30 10:46:13'),
(290, '*', 'New messages', '{"ru":"Новые сообщения"}', '2021-11-30 10:46:13', '2021-11-30 10:46:13'),
(291, '*', 'New offers', '{"ru":"Новые предложения"}', '2021-11-30 10:46:13', '2021-11-30 10:46:13'),
(292, '*', 'New Password', '{"ru":"Новый пароль"}', '2021-11-30 10:46:13', '2021-11-30 10:46:13'),
(293, '*', 'New Password Confirmation', '{"ru":"Подтверждение нового пароля"}', '2021-11-30 10:46:13', '2021-11-30 10:46:13'),
(294, '*', 'New candidates', '{"ru":"Новые кандидаты"}', '2021-11-30 10:46:13', '2021-11-30 10:46:13'),
(295, '*', 'New job application', '{"ru":"Новый отклик на вакансию"}', '2021-11-30 10:46:13', '2021-11-30 10:46:13'),
(296, '*', 'New job offer', '{"ru":"Новое предложение вакансии"}', '2021-11-30 10:46:13', '2021-11-30 10:46:13'),
(297, '*', 'New vacancies', '{"ru":"Новые вакансии"}', '2021-11-30 10:46:13', '2021-11-30 10:46:13'),
(298, '*', 'New vacancies in my profile', '{"ru":"Новые вакансии по моему профилю"}', '2021-11-30 10:46:13', '2021-11-30 10:46:13'),
(299, '*', 'New notification from recruiter', '{"ru":"Новое оповещение от рекрутера"}', '2021-11-30 10:46:13', '2021-11-30 10:46:13'),
(300, '*', 'New notification from candidate', '{"ru":"Новое оповещение от кандидата"}', '2021-11-30 10:46:13', '2021-11-30 10:46:13'),
(301, '*', 'New page', '{"ru":"Новая страница"}', '2021-11-30 10:46:13', '2021-11-30 10:46:13'),
(302, '*', 'Job offer has already been sent', '{"ru":"Предложение о работе уже отправлено"}', '2021-11-30 10:46:13', '2021-11-30 10:46:13'),
(303, '*', 'We received a request to change the password for the Jobzz account.', '{"ru":"Мы получили запрос на смену пароля для аккаунта Jobzz."}', '2021-11-30 10:46:13', '2021-11-30 10:46:13'),
(304, '*', 'No', '{"ru":"Нет"}', '2021-11-30 10:46:14', '2021-11-30 10:46:14'),
(305, '*', 'No Permissions', '{"ru":"Нет разрешений"}', '2021-11-30 10:46:14', '2021-11-30 10:46:14'),
(306, '*', 'No Vacancies', '{"ru":"Нет вакансий"}', '2021-11-30 10:46:14', '2021-11-30 10:46:14'),
(307, '*', 'No candidates found for the specified parameters', '{"ru":"Не найдено кандидатов по заданным параметрам"}', '2021-11-30 10:46:14', '2021-11-30 10:46:14'),
(308, '*', 'No candidates found for this vacancy', '{"ru":"Не найдены кандидаты на данную вакансию"}', '2021-11-30 10:46:14', '2021-11-30 10:46:14'),
(309, '*', 'No data available', '{"ru":"Данные отсутствуют"}', '2021-11-30 10:46:14', '2021-11-30 10:46:14'),
(310, '*', 'No vacancies found for the specified parameters', '{"ru":"Не найдено вакансий по заданным параметрам"}', '2021-11-30 10:46:14', '2021-11-30 10:46:14'),
(311, '*', 'No, I was not hired', '{"ru":"Нет, меня не нанимали"}', '2021-11-30 10:46:14', '2021-11-30 10:46:14'),
(312, '*', 'No, didn''t help', '{"ru":"Нет, не помог"}', '2021-11-30 10:46:14', '2021-11-30 10:46:14'),
(313, '*', 'No, we did not make new hires', '{"ru":"Нет, мы не совершали новых наймов"}', '2021-11-30 10:46:14', '2021-11-30 10:46:14'),
(314, '*', 'Not Used', '{"ru":"Не используется"}', '2021-11-30 10:46:14', '2021-11-30 10:46:14'),
(315, '*', 'Not specified', '{"ru":"Не указано"}', '2021-11-30 10:46:14', '2021-11-30 10:46:14'),
(316, '*', 'Not yet', '{"ru":"Еще нет"}', '2021-11-30 10:46:14', '2021-11-30 10:46:14'),
(317, '*', 'Notifications settings', '{"ru":"Настройки уведомлений"}', '2021-11-30 10:46:14', '2021-11-30 10:46:14'),
(318, '*', 'Number of Users', '{"ru":"Количество пользователей"}', '2021-11-30 10:46:14', '2021-11-30 10:46:14'),
(319, '*', 'Offer Sent', '{"ru":"Предложение отправлено"}', '2021-11-30 10:46:14', '2021-11-30 10:46:14'),
(320, '*', 'Offer sent', '{"ru":"Предложение отправлено"}', '2021-11-30 10:46:14', '2021-11-30 10:46:14'),
(321, '*', 'Office address', '{"ru":"Адрес офиса"}', '2021-11-30 10:46:15', '2021-11-30 10:46:15'),
(322, '*', 'One or more permissions were not found or are not allowed to be associated with this role type.', '{"ru":"Одно или несколько разрешений не найдены или не могут быть связаны с этим типом роли."}', '2021-11-30 10:46:15', '2021-11-30 10:46:15'),
(323, '*', 'One or more permissions were not found or are not allowed to be associated with this user type.', '{"ru":"Одно или несколько разрешений не найдены или не могут быть связаны с этим типом пользователя."}', '2021-11-30 10:46:15', '2021-11-30 10:46:15'),
(324, '*', 'One or more roles were not found or are not allowed to be associated with this user type.', '{"ru":"Одна или несколько ролей не найдены или не могут быть связаны с этим типом пользователя."}', '2021-11-30 10:46:15', '2021-11-30 10:46:15'),
(325, '*', 'Only the administrator can change their password.', '{"ru":"Только администратор может изменить свой пароль."}', '2021-11-30 10:46:15', '2021-11-30 10:46:15'),
(326, '*', 'Only the administrator can update this user.', '{"ru":"Только администратор может обновить этого пользователя."}', '2021-11-30 10:46:15', '2021-11-30 10:46:15'),
(327, '*', 'Open your contacts', '{"ru":"Открыть свои контакты"}', '2021-11-30 10:46:15', '2021-11-30 10:46:15'),
(328, '*', 'Opened a resume', '{"ru":"Открыл(а) резюме"}', '2021-11-30 10:46:15', '2021-11-30 10:46:15'),
(329, '*', 'Our partners', '{"ru":"Наши партнеры"}', '2021-11-30 10:46:15', '2021-11-30 10:46:15'),
(330, '*', 'Page Expired', '{"ru":"Срок действия страницы истек"}', '2021-11-30 10:46:15', '2021-11-30 10:46:15'),
(331, '*', 'Page Not Found', '{"ru":"Страница не найдена"}', '2021-11-30 10:46:15', '2021-11-30 10:46:15'),
(332, '*', 'Page management', '{"ru":"Управление страницами"}', '2021-11-30 10:46:15', '2021-11-30 10:46:15'),
(333, '*', 'Page updated.', '{"ru":"Страница обновлена"}', '2021-11-30 10:46:15', '2021-11-30 10:46:15'),
(334, '*', 'Pages list', '{"ru":"Список страниц"}', '2021-11-30 10:46:15', '2021-11-30 10:46:15'),
(335, '*', 'Partnership', '{"ru":"Партнерство"}', '2021-11-30 10:46:15', '2021-11-30 10:46:15'),
(336, '*', 'Password', '{"ru":"Пароль"}', '2021-11-30 10:46:15', '2021-11-30 10:46:15'),
(337, '*', 'Password Confirmation', '{"ru":"Подтверждение пароля"}', '2021-11-30 10:46:15', '2021-11-30 10:46:15'),
(338, '*', 'Password successfully updated.', '{"ru":"Пароль успешно обновлен."}', '2021-11-30 10:46:15', '2021-11-30 10:46:15'),
(339, '*', 'Pay', '{"ru":"Оплатить"}', '2021-11-30 10:46:16', '2021-11-30 10:46:16'),
(340, '*', 'Pay before', '{"ru":"Оплатить до"}', '2021-11-30 10:46:16', '2021-11-30 10:46:16'),
(341, '*', 'Pay by card', '{"ru":"Оплатить картой"}', '2021-11-30 10:46:16', '2021-11-30 10:46:16'),
(342, '*', 'Payed', '{"ru":"Оплачено"}', '2021-11-30 10:46:16', '2021-11-30 10:46:16'),
(343, '*', 'Payer', '{"ru":"Плательщик"}', '2021-11-30 10:46:16', '2021-11-30 10:46:16'),
(344, '*', 'Payer''s address', '{"ru":"Адрес плательщика"}', '2021-11-30 10:46:16', '2021-11-30 10:46:16'),
(345, '*', 'Payer''s details', '{"ru":"Реквизиты плательщика"}', '2021-11-30 10:46:16', '2021-11-30 10:46:16'),
(346, '*', 'Payment', '{"ru":"Оплата"}', '2021-11-30 10:46:16', '2021-11-30 10:46:16'),
(347, '*', 'Payment archive', '{"ru":"Архив оплат"}', '2021-11-30 10:46:16', '2021-11-30 10:46:16'),
(348, '*', 'Payment candidates', '{"ru":"Кандидаты на оплату"}', '2021-11-30 10:46:16', '2021-11-30 10:46:16'),
(349, '*', 'Permanently Delete', '{"ru":"Удалить навсегда"}', '2021-11-30 10:46:16', '2021-11-30 10:46:16'),
(350, '*', 'Permission Categories', '{"ru":"Категории разрешений"}', '2021-11-30 10:46:16', '2021-11-30 10:46:16'),
(351, '*', 'Permissions', '{"ru":"Права доступа"}', '2021-11-30 10:46:16', '2021-11-30 10:46:16'),
(352, '*', 'Personal Information', '{"ru":"Персональные данные"}', '2021-11-30 10:46:16', '2021-11-30 10:46:16'),
(353, '*', 'Phone', '{"ru":"Телефон"}', '2021-11-30 10:46:16', '2021-11-30 10:46:16'),
(354, '*', 'Phone number', '{"ru":"Номер телефона"}', '2021-11-30 10:46:16', '2021-11-30 10:46:16'),
(355, '*', 'Please click the button below to verify your email address.', '{"ru":"Пожалуйста, нажмите кнопку ниже, чтобы подтвердить свой адрес электронной почты."}', '2021-11-30 10:46:17', '2021-11-30 10:46:17'),
(356, '*', 'Please confirm your password before continuing.', '{"ru":"Пожалуйста, подтвердите ваш пароль, прежде чем продолжить."}', '2021-11-30 10:46:17', '2021-11-30 10:46:17'),
(357, '*', 'Please fill in your profile.', '{"ru":"Пожалуйста, заполните ваш профиль."}', '2021-11-30 10:46:17', '2021-11-30 10:46:17'),
(358, '*', 'Please indicate which of the candidates you hired', '{"ru":"Укажите, пожалуйста, кого из кандидатов вы наняли"}', '2021-11-30 10:46:17', '2021-11-30 10:46:17'),
(359, '*', 'Please select at least one', '{"ru":"Выберите не менее одного"}', '2021-11-30 10:46:17', '2021-11-30 10:46:17'),
(360, '*', 'Popular', '{"ru":"Популярные"}', '2021-11-30 10:46:17', '2021-11-30 10:46:17'),
(361, '*', 'Popular cities', '{"ru":"Популярные города"}', '2021-11-30 10:46:17', '2021-11-30 10:46:17'),
(362, '*', 'Portfolio link', '{"ru":"Ссылка на портфолио"}', '2021-11-30 10:46:17', '2021-11-30 10:46:17'),
(363, '*', 'Portfolio', '{"ru":"Портфолио"}', '2021-11-30 10:46:17', '2021-11-30 10:46:17'),
(364, '*', 'Position', '{"ru":"Должность"}', '2021-11-30 10:46:17', '2021-11-30 10:46:17'),
(365, '*', 'Position in the company', '{"ru":"Должность в компании"}', '2021-11-30 10:46:17', '2021-11-30 10:46:17'),
(366, '*', 'Post anonymously', '{"ru":"Опубликовать анонимно"}', '2021-11-30 10:46:17', '2021-11-30 10:46:17'),
(367, '*', 'Powered by', '{"ru":"Питаться от"}', '2021-11-30 10:46:17', '2021-11-30 10:46:17'),
(368, '*', 'Preview', '{"ru":"Предпросмотр"}', '2021-11-30 10:46:17', '2021-11-30 10:46:17'),
(369, '*', 'Preview Profile', '{"ru":"Предпросмотр Профиля"}', '2021-11-30 10:46:17', '2021-11-30 10:46:17'),
(370, '*', 'Previous messages', '{"ru":"Предыдущие сообщения"}', '2021-11-30 10:46:17', '2021-11-30 10:46:17'),
(371, '*', 'Price', '{"ru":"Стоимость"}', '2021-11-30 10:46:18', '2021-11-30 10:46:18'),
(372, '*', 'Privacy Policy', '{"ru":"Политика конфиденциальности"}', '2021-11-30 10:46:18', '2021-11-30 10:46:18'),
(373, '*', 'Privacy policy', '{"ru":"Политику конфиденциальности"}', '2021-11-30 10:46:18', '2021-11-30 10:46:18'),
(374, '*', 'Problems with the site', '{"ru":"Проблемы с сайтом"}', '2021-11-30 10:46:18', '2021-11-30 10:46:18'),
(375, '*', 'Proceed', '{"ru":"Продолжить"}', '2021-11-30 10:46:18', '2021-11-30 10:46:18'),
(376, '*', 'Process description', '{"ru":"Описание процесса"}', '2021-11-30 10:46:18', '2021-11-30 10:46:18'),
(377, '*', 'Product companies', '{"ru":"Продуктовые компании"}', '2021-11-30 10:46:18', '2021-11-30 10:46:18'),
(378, '*', 'Product company', '{"ru":"Продуктовая компания"}', '2021-11-30 10:46:18', '2021-11-30 10:46:18'),
(379, '*', 'Profile', '{"ru":"Профиль"}', '2021-11-30 10:46:18', '2021-11-30 10:46:18'),
(380, '*', 'Profile Created', '{"ru":"Профиль создан"}', '2021-11-30 10:46:18', '2021-11-30 10:46:18'),
(381, '*', 'Profile Updated', '{"ru":"Профиль обновлен"}', '2021-11-30 10:46:18', '2021-11-30 10:46:18'),
(382, '*', 'Profile deleted', '{"ru":"Профиль удален"}', '2021-11-30 10:46:18', '2021-11-30 10:46:18'),
(383, '*', 'Profile is active', '{"ru":"Профиль активен"}', '2021-11-30 10:46:18', '2021-11-30 10:46:18'),
(384, '*', 'Profile is blocked', '{"ru":"Профиль заблокирован"}', '2021-11-30 10:46:18', '2021-11-30 10:46:18'),
(385, '*', 'Profile is inactive', '{"ru":"Профиль не активен"}', '2021-11-30 10:46:19', '2021-11-30 10:46:19'),
(386, '*', 'Profile is not active', '{"ru":"Профиль не активен"}', '2021-11-30 10:46:19', '2021-11-30 10:46:19'),
(387, '*', 'Profile locked', '{"ru":"Профиль заблокирован"}', '2021-11-30 10:46:19', '2021-11-30 10:46:19'),
(388, '*', 'Profile on moderation', '{"ru":"Профиль на модерации"}', '2021-11-30 10:46:19', '2021-11-30 10:46:19'),
(389, '*', 'Profile preview', '{"ru":"Предпросмотр профиля"}', '2021-11-30 10:46:19', '2021-11-30 10:46:19'),
(390, '*', 'Profile successfully updated.', '{"ru":"Профиль успешно обновлен."}', '2021-11-30 10:46:19', '2021-11-30 10:46:19'),
(391, '*', 'Provider', '{"ru":"Поставщик"}', '2021-11-30 10:46:19', '2021-11-30 10:46:19'),
(392, '*', 'Provider ID', '{"ru":"ID провайдера"}', '2021-11-30 10:46:19', '2021-11-30 10:46:19'),
(393, '*', 'Publish', '{"ru":"Опубликовать"}', '2021-11-30 10:46:19', '2021-11-30 10:46:19'),
(394, '*', 'Jobs on jobzz.ru', '{"ru":"Вакансий на jobzz.ru"}', '2021-11-30 10:46:19', '2021-11-30 10:46:19'),
(395, '*', 'You have been sent an offer for this vacancy', '{"ru":"Вам было отправлено предложение по данной вакансии"}', '2021-11-30 10:46:19', '2021-11-30 10:46:19'),
(396, '*', 'You have already submitted a response for this vacancy', '{"ru":"Вы уже отправили отклик по данной вакансии"}', '2021-11-30 10:46:19', '2021-11-30 10:46:19'),
(397, '*', 'Publish Date', '{"ru":"Дата публикации"}', '2021-11-30 10:46:19', '2021-11-30 10:46:19'),
(398, '*', 'Publish on site', '{"ru":"Опубликовать на сайте"}', '2021-11-30 10:46:19', '2021-11-30 10:46:19'),
(399, '*', 'Reactivate', '{"ru":"Возобновить"}', '2021-11-30 10:46:19', '2021-11-30 10:46:19'),
(400, '*', 'Recovery codes are used to access your account in the event you no longer have access to your authenticator app.', '{"ru":"Коды восстановления используются для доступа к вашей учетной записи, если у вас больше нет доступа к вашему приложению для проверки подлинности."}', '2021-11-30 10:46:20', '2021-11-30 10:46:20'),
(401, '*', 'Recruiter', '{"ru":"Рекрутер"}', '2021-11-30 10:46:20', '2021-11-30 10:46:20'),
(402, '*', 'Recruiter registration', '{"ru":"Регистрация рекрутера"}', '2021-11-30 10:46:20', '2021-11-30 10:46:20'),
(403, '*', 'Recruiters', '{"ru":"Рекрутеры"}', '2021-11-30 10:46:20', '2021-11-30 10:46:20'),
(404, '*', 'Recruiters see your profile and can send you new offers', '{"ru":"Ваш профиль видят рекрутеры и могут отправлять вам новые предложения"}', '2021-11-30 10:46:20', '2021-11-30 10:46:20'),
(405, '*', 'Regards', '{"ru":"С Уважением"}', '2021-11-30 10:46:20', '2021-11-30 10:46:20'),
(406, '*', 'Register', '{"ru":"Регистрация"}', '2021-11-30 10:46:20', '2021-11-30 10:46:20'),
(407, '*', 'Registration', '{"ru":"Регистрация"}', '2021-11-30 10:46:20', '2021-11-30 10:46:20'),
(408, '*', 'Release date', '{"ru":"Дата выхода"}', '2021-11-30 10:46:20', '2021-11-30 10:46:20'),
(409, '*', 'Released to work', '{"ru":"Дата выхода на работу"}', '2021-11-30 10:46:20', '2021-11-30 10:46:20'),
(410, '*', 'Relocate to another country', '{"ru":"Релокейт в другую страну"}', '2021-11-30 10:46:20', '2021-11-30 10:46:20'),
(411, '*', 'Remember Me', '{"ru":"Запомни меня"}', '2021-11-30 10:46:20', '2021-11-30 10:46:20'),
(412, '*', 'Remember me', '{"ru":"Запомните меня"}', '2021-11-30 10:46:20', '2021-11-30 10:46:20'),
(413, '*', 'Remote work', '{"ru":"Удаленная работа"}', '2021-11-30 10:46:21', '2021-11-30 10:46:21'),
(414, '*', 'Remotely', '{"ru":"Удаленно"}', '2021-11-30 10:46:21', '2021-11-30 10:46:21'),
(415, '*', 'Remove Two Factor Authentication', '{"ru":"Удалить двухфакторную аутентификацию"}', '2021-11-30 10:46:21', '2021-11-30 10:46:21'),
(416, '*', 'Remove filter option', '{"ru":"Удалить опцию фильтра"}', '2021-11-30 10:46:21', '2021-11-30 10:46:21'),
(417, '*', 'Remove sort option', '{"ru":"Удалить опцию сортировки"}', '2021-11-30 10:46:21', '2021-11-30 10:46:21'),
(418, '*', 'Report hiring', '{"ru":"Сообщить о найме"}', '2021-11-30 10:46:21', '2021-11-30 10:46:21'),
(419, '*', 'Reset Password', '{"ru":"Сброс пароля"}', '2021-11-30 10:46:21', '2021-11-30 10:46:21'),
(420, '*', 'Reset Password Notification', '{"ru":"Уведомление о сбросе пароле"}', '2021-11-30 10:46:21', '2021-11-30 10:46:21'),
(421, '*', 'Resend confirmation link', '{"ru":"Повторно отправить ссылку подтверждения"}', '2021-11-30 10:46:21', '2021-11-30 10:46:21'),
(422, '*', 'Respond', '{"ru":"Откликнуться"}', '2021-11-30 10:46:21', '2021-11-30 10:46:21'),
(423, '*', 'Response sent', '{"ru":"Отклик отправлен"}', '2021-11-30 10:46:21', '2021-11-30 10:46:21'),
(424, '*', 'Restore', '{"ru":"Восстановить"}', '2021-11-30 10:46:21', '2021-11-30 10:46:21'),
(425, '*', 'Results found', '{"ru":"Найдено результатов"}', '2021-11-30 10:46:21', '2021-11-30 10:46:21'),
(426, '*', 'Resume', '{"ru":"Резюме"}', '2021-11-30 10:46:21', '2021-11-30 10:46:21'),
(427, '*', 'Return to your account', '{"ru":"Вернуться в свой аккаунт"}', '2021-11-30 10:46:22', '2021-11-30 10:46:22'),
(428, '*', 'Role', '{"ru":"Роль"}', '2021-11-30 10:46:22', '2021-11-30 10:46:22'),
(429, '*', 'Role Management', '{"ru":"Управление ролями"}', '2021-11-30 10:46:22', '2021-11-30 10:46:22'),
(430, '*', 'Roles', '{"ru":"Роли"}', '2021-11-30 10:46:22', '2021-11-30 10:46:22'),
(431, '*', 'Roles List', '{"ru":"Список ролей"}', '2021-11-30 10:46:22', '2021-11-30 10:46:22'),
(432, '*', 'Salary', '{"ru":"Зарплата"}', '2021-11-30 10:46:22', '2021-11-30 10:46:22'),
(433, '*', 'Salary wishes', '{"ru":"Зарплатные пожелания"}', '2021-11-30 10:46:22', '2021-11-30 10:46:22'),
(434, '*', 'Save', '{"ru":"Сохранить"}', '2021-11-30 10:46:22', '2021-11-30 10:46:22'),
(435, '*', 'Save and publish', '{"ru":"Сохранить и опубликовать"}', '2021-11-30 10:46:22', '2021-11-30 10:46:22'),
(436, '*', 'Save without publishing', '{"ru":"Сохранить без публикации"}', '2021-11-30 10:46:22', '2021-11-30 10:46:22'),
(437, '*', 'Save your two factor recovery codes:', '{"ru":"Сохраните код восстановления 2FA:"}', '2021-11-30 10:46:22', '2021-11-30 10:46:22'),
(438, '*', 'Search', '{"ru":"Поиск"}', '2021-11-30 10:46:22', '2021-11-30 10:46:22'),
(439, '*', 'Search for candidates', '{"ru":"Поиск кандидатов"}', '2021-11-30 10:46:22', '2021-11-30 10:46:22'),
(440, '*', 'Search on our portal', '{"ru":"На нашем портале ищут"}', '2021-11-30 10:46:23', '2021-11-30 10:46:23'),
(441, '*', 'Search...', '{"ru":"Поиск..."}', '2021-11-30 10:46:23', '2021-11-30 10:46:23'),
(442, '*', 'See all candidates', '{"ru":"Смотреть всех кандидатов"}', '2021-11-30 10:46:23', '2021-11-30 10:46:23'),
(443, '*', 'Select All', '{"ru":"Выбрать все"}', '2021-11-30 10:46:23', '2021-11-30 10:46:23'),
(444, '*', 'Select a Payment Method', '{"ru":"Выберите способ оплаты"}', '2021-11-30 10:46:23', '2021-11-30 10:46:23'),
(445, '*', 'Select a chat user', '{"ru":"Выберите пользователя для переписки"}', '2021-11-30 10:46:23', '2021-11-30 10:46:23'),
(446, '*', 'Select and offer a vacancy', '{"ru":"Выбрать и предложить вакансию"}', '2021-11-30 10:46:23', '2021-11-30 10:46:23'),
(447, '*', 'Select basic skills', '{"ru":"Выберите ключевые навыки"}', '2021-11-30 10:46:23', '2021-11-30 10:46:23'),
(448, '*', 'Select job options', '{"ru":"Выберите варианты работы"}', '2021-11-30 10:46:23', '2021-11-30 10:46:23'),
(449, '*', 'Select your level of English proficiency', '{"ru":"Выберите уровень владения английским языком"}', '2021-11-30 10:46:23', '2021-11-30 10:46:23'),
(450, '*', 'Send', '{"ru":"Отправить"}', '2021-11-30 10:46:23', '2021-11-30 10:46:23'),
(451, '*', 'Send Confirmation E-mail', '{"ru":"Отправить подтверждение по электронной почте"}', '2021-11-30 10:46:23', '2021-11-30 10:46:23'),
(452, '*', 'Send Password Reset Link', '{"ru":"Отправить ссылку для сброса пароля"}', '2021-11-30 10:46:24', '2021-11-30 10:46:24'),
(453, '*', 'Send your contacts', '{"ru":"Отправить свои контакты"}', '2021-11-30 10:46:24', '2021-11-30 10:46:24'),
(454, '*', 'Server Logs', '{"ru":"Журналы сервера"}', '2021-11-30 10:46:24', '2021-11-30 10:46:24'),
(455, '*', 'Service Unavailable', '{"ru":"Ведутся технические работы"}', '2021-11-30 10:46:24', '2021-11-30 10:46:24'),
(456, '*', 'Services in the area of personnel search and selection', '{"ru":"Услуги в сфере поиска и подбора персонала"}', '2021-11-30 10:46:24', '2021-11-30 10:46:24'),
(457, '*', 'Settings', '{"ru":"Настройки"}', '2021-11-30 10:46:24', '2021-11-30 10:46:24'),
(458, '*', 'Settings updated', '{"ru":"Настройки обновлены"}', '2021-11-30 10:46:24', '2021-11-30 10:46:24'),
(459, '*', 'Short description', '{"ru":"Краткое описание"}', '2021-11-30 10:46:24', '2021-11-30 10:46:24'),
(460, '*', 'Show all messages', '{"ru":"Показать все сообщения"}', '2021-11-30 10:46:24', '2021-11-30 10:46:24'),
(461, '*', 'Show all notifications', '{"ru":"Показать все уведомления"}', '2021-11-30 10:46:24', '2021-11-30 10:46:24'),
(462, '*', 'Show recent chat messages', '{"ru":"Показать последние сообщения в чате"}', '2021-11-30 10:46:24', '2021-11-30 10:46:24'),
(463, '*', 'Show resume', '{"ru":"Показать резюме"}', '2021-11-30 10:46:24', '2021-11-30 10:46:24'),
(464, '*', 'Showing', '{"ru":"Показано"}', '2021-11-30 10:46:24', '2021-11-30 10:46:24'),
(465, '*', 'Sign in', '{"ru":"Войти"}', '2021-11-30 10:46:25', '2021-11-30 10:46:25'),
(466, '*', 'Sign in to your account to continue', '{"ru":"Войдите в свою учетную запись, чтобы продолжить"}', '2021-11-30 10:46:25', '2021-11-30 10:46:25'),
(467, '*', 'Sign up', '{"ru":"Зарегистрироваться"}', '2021-11-30 10:46:25', '2021-11-30 10:46:25'),
(468, '*', 'Site content', '{"ru":"Контент сайта"}', '2021-11-30 10:46:25', '2021-11-30 10:46:25'),
(469, '*', 'Site menus', '{"ru":"Меню сайта"}', '2021-11-30 10:46:25', '2021-11-30 10:46:25'),
(470, '*', 'Site pages', '{"ru":"Страницы сайта"}', '2021-11-30 10:46:25', '2021-11-30 10:46:25'),
(471, '*', 'Skill', '{"ru":"Навык"}', '2021-11-30 10:46:25', '2021-11-30 10:46:25'),
(472, '*', 'Skills', '{"ru":"Навыки"}', '2021-11-30 10:46:25', '2021-11-30 10:46:25'),
(473, '*', 'Social Provider', '{"ru":"Социальный провайдер"}', '2021-11-30 10:46:25', '2021-11-30 10:46:25'),
(474, '*', 'Sort by date', '{"ru":"Сортировка по дате"}', '2021-11-30 10:46:25', '2021-11-30 10:46:25'),
(475, '*', 'Specialization', '{"ru":"Специализация"}', '2021-11-30 10:46:25', '2021-11-30 10:46:25'),
(476, '*', 'Specialization category', '{"ru":"Категория специализации"}', '2021-11-30 10:46:26', '2021-11-30 10:46:26'),
(477, '*', 'Status', '{"ru":"Статус"}', '2021-11-30 10:46:26', '2021-11-30 10:46:26'),
(478, '*', 'Status Updated', '{"ru":"Статус обновлен"}', '2021-11-30 10:46:26', '2021-11-30 10:46:26'),
(479, '*', 'Step 1: Configure your 2FA app', '{"ru":"Шаг 1. Настройте приложение 2FA"}', '2021-11-30 10:46:26', '2021-11-30 10:46:26'),
(480, '*', 'Step 2: Enter a 2FA code', '{"ru":"Шаг 2: введите код 2FA"}', '2021-11-30 10:46:26', '2021-11-30 10:46:26'),
(481, '*', 'Switch off', '{"ru":"Выключить"}', '2021-11-30 10:46:26', '2021-11-30 10:46:26'),
(482, '*', 'Switch on', '{"ru":"Включить"}', '2021-11-30 10:46:26', '2021-11-30 10:46:26'),
(483, '*', 'System', '{"ru":"Система"}', '2021-11-30 10:46:26', '2021-11-30 10:46:26'),
(484, '*', 'Found a job at Jobzz.ru', '{"ru":"Нашёл работу на Jobzz.ru"}', '2021-11-30 10:46:26', '2021-11-30 10:46:26'),
(485, '*', 'Found a job', '{"ru":"Я нашёл работу"}', '2021-11-30 10:46:26', '2021-11-30 10:46:26'),
(486, '*', 'Tax number', '{"ru":"ОГРН\\/ИНН"}', '2021-11-30 10:46:26', '2021-11-30 10:46:26'),
(487, '*', 'Team', '{"ru":"Команда"}', '2021-11-30 10:46:26', '2021-11-30 10:46:26'),
(488, '*', 'Notifications', '{"ru":"Уведомления"}', '2021-11-30 10:46:27', '2021-11-30 10:46:27'),
(489, '*', 'PUSH notifications', '{"ru":"PUSH Уведомления"}', '2021-11-30 10:46:27', '2021-11-30 10:46:27'),
(490, '*', 'Telegram notifications', '{"ru":"Уведомления в телеграм"}', '2021-11-30 10:46:27', '2021-11-30 10:46:27'),
(491, '*', 'Tell us about yourself', '{"ru":"Расскажите о себе"}', '2021-11-30 10:46:27', '2021-11-30 10:46:27'),
(492, '*', 'Tell us briefly about yourself and your experience', '{"ru":"Расскажите кратко о себе и своем опыте"}', '2021-11-30 10:46:27', '2021-11-30 10:46:27'),
(493, '*', 'Terms & Conditions', '{"ru":"Условия использования"}', '2021-11-30 10:46:27', '2021-11-30 10:46:27'),
(494, '*', 'Terms of Use', '{"ru":"Условия использования"}', '2021-11-30 10:46:27', '2021-11-30 10:46:27'),
(495, '*', 'Text', '{"ru":"Текст"}', '2021-11-30 10:46:27', '2021-11-30 10:46:27'),
(496, '*', 'Thank you for verifying your e-mail address.', '{"ru":"Спасибо за подтверждение вашего адреса электронной почты."}', '2021-11-30 10:46:27', '2021-11-30 10:46:27'),
(497, '*', 'Thank you for your answer!', '{"ru":"Благодарим за ваш ответ!"}', '2021-11-30 10:46:27', '2021-11-30 10:46:27'),
(498, '*', 'That is not your old password.', '{"ru":"Это не твой старый пароль."}', '2021-11-30 10:46:27', '2021-11-30 10:46:27'),
(499, '*', 'The Application is currently in read only mode. All requests other than GET are disabled.', '{"ru":"Приложение в настоящее время находится в режиме только для чтения. Все запросы, кроме GET, отключены."}', '2021-11-30 10:46:27', '2021-11-30 10:46:27'),
(500, '*', 'The password was found in a third party data breach, and can not be used.', '{"ru":"Пароль был обнаружен в результате взлома данных третьей стороной и не может быть использован."}', '2021-11-30 10:46:28', '2021-11-30 10:46:28'),
(501, '*', 'The recruiter will be able to see your resume, photo and contact details only after you open them', '{"ru":"Ваше резюме, фото и контактные данные рекрутер сможет увидеть только после того, как вы их откроете"}', '2021-11-30 10:46:28', '2021-11-30 10:46:28'),
(502, '*', 'The requested resource was not found.', '{"ru":"Запрашиваемый ресурс не найден."}', '2021-11-30 10:46:28', '2021-11-30 10:46:28'),
(503, '*', 'The role was successfully created.', '{"ru":"Роль была успешно создана."}', '2021-11-30 10:46:28', '2021-11-30 10:46:28'),
(504, '*', 'The role was successfully deleted.', '{"ru":"Роль была успешно удалена."}', '2021-11-30 10:46:28', '2021-11-30 10:46:28'),
(505, '*', 'The role was successfully updated.', '{"ru":"Роль была успешно обновлена."}', '2021-11-30 10:46:28', '2021-11-30 10:46:28'),
(506, '*', 'Thanks for your reply.', '{"ru":"Спасибо за ваш ответ."}', '2021-11-30 10:46:28', '2021-11-30 10:46:28'),
(507, '*', 'Unknown answer', '{"ru":"Не известный ответ"}', '2021-11-30 10:46:28', '2021-11-30 10:46:28'),
(508, '*', 'Thanks for your reply. Your vacancy has been published for 30 days.', '{"ru":"Спасибо за ваш ответ. Ваша вакансия опубликована на 30 дней."}', '2021-11-30 10:46:28', '2021-11-30 10:46:28'),
(509, '*', 'The salary', '{"ru":"Зарплата"}', '2021-11-30 10:46:28', '2021-11-30 10:46:28'),
(510, '*', 'The skills you own', '{"ru":"Навыки которыми вы владеете"}', '2021-11-30 10:46:28', '2021-11-30 10:46:28'),
(511, '*', 'The user was permanently deleted.', '{"ru":"Пользователь был навсегда удален."}', '2021-11-30 10:46:29', '2021-11-30 10:46:29'),
(512, '*', 'The user was successfully created.', '{"ru":"Пользователь был успешно создан."}', '2021-11-30 10:46:29', '2021-11-30 10:46:29'),
(513, '*', 'The user was successfully deleted.', '{"ru":"Пользователь был успешно удален."}', '2021-11-30 10:46:29', '2021-11-30 10:46:29'),
(514, '*', 'The user was successfully restored.', '{"ru":"Пользователь был успешно восстановлен."}', '2021-11-30 10:46:29', '2021-11-30 10:46:29'),
(515, '*', 'The user was successfully updated.', '{"ru":"Пользователь был успешно обновлен."}', '2021-11-30 10:46:29', '2021-11-30 10:46:29'),
(516, '*', 'The vacancy will not be displayed in the search, but you can send the candidate a link to the vacancy', '{"ru":"Вакансия не будет отображаться в поиске, но вы сможете передать кандидату ссылку на вакансию"}', '2021-11-30 10:46:29', '2021-11-30 10:46:29'),
(517, '*', 'There are no additional permissions to choose from for this type.', '{"ru":"Для этого типа нет дополнительных разрешений на выбор."}', '2021-11-30 10:46:29', '2021-11-30 10:46:29'),
(518, '*', 'There are no permissions to choose from.', '{"ru":"Нет разрешений на выбор."}', '2021-11-30 10:46:29', '2021-11-30 10:46:29'),
(519, '*', 'There are no roles to choose from for this type.', '{"ru":"Для этого типа нет ролей на выбор."}', '2021-11-30 10:46:29', '2021-11-30 10:46:29'),
(520, '*', 'There was a problem connecting to :provider', '{"ru":"Возникла проблема с подключением к :provider"}', '2021-11-30 10:46:29', '2021-11-30 10:46:29'),
(521, '*', 'There was a problem creating the role.', '{"ru":"При создании роли возникла проблема."}', '2021-11-30 10:46:29', '2021-11-30 10:46:29'),
(522, '*', 'There was a problem creating this user. Please try again.', '{"ru":"При создании этого пользователя возникла проблема. Пожалуйста, попробуйте еще раз."}', '2021-11-30 10:46:30', '2021-11-30 10:46:30'),
(523, '*', 'There was a problem creating your account.', '{"ru":"При создании аккаунта возникла проблема."}', '2021-11-30 10:46:30', '2021-11-30 10:46:30'),
(524, '*', 'There was a problem deleting the role.', '{"ru":"При удалении роли произошла ошибка."}', '2021-11-30 10:46:30', '2021-11-30 10:46:30'),
(525, '*', 'There was a problem permanently deleting this user. Please try again.', '{"ru":"При удалении этого пользователя возникла проблема. Пожалуйста, попробуйте еще раз."}', '2021-11-30 10:46:30', '2021-11-30 10:46:30'),
(526, '*', 'There was a problem restoring this user. Please try again.', '{"ru":"Возникла проблема с восстановлением этого пользователя. Пожалуйста, попробуйте еще раз."}', '2021-11-30 10:46:30', '2021-11-30 10:46:30'),
(527, '*', 'There was a problem updating the role.', '{"ru":"При обновлении роли произошла ошибка."}', '2021-11-30 10:46:30', '2021-11-30 10:46:30'),
(528, '*', 'There was a problem updating this user. Please try again.', '{"ru":"При обновлении этого пользователя возникла проблема. Пожалуйста, попробуйте еще раз."}', '2021-11-30 10:46:30', '2021-11-30 10:46:30'),
(529, '*', 'These credentials do not match our records.', '{"ru":"Эти учетные данные не соответствуют нашим записям."}', '2021-11-30 10:46:30', '2021-11-30 10:46:30'),
(530, '*', 'This action cannot be undone', '{"ru":"Это действие нельзя будет отменить"}', '2021-11-30 10:46:30', '2021-11-30 10:46:30'),
(531, '*', 'The password reset link has a lifespan of :count minutes.', '{"ru":"Срок жизни ссылки для сброса пароля - :count минут."}', '2021-11-30 10:46:30', '2021-11-30 10:46:30'),
(532, '*', 'If you didn''t ask for a password reset, just ignore the email.', '{"ru":"Если вы не запрашивали сброс пароля, просто проигнорируйте письмо."}', '2021-11-30 10:46:30', '2021-11-30 10:46:30'),
(533, '*', 'Timezone', '{"ru":"Часовой пояс"}', '2021-11-30 10:46:31', '2021-11-30 10:46:31'),
(534, '*', 'Title', '{"ru":"Заголовок"}', '2021-11-30 10:46:31', '2021-11-30 10:46:31'),
(535, '*', 'To apply for a vacancy, you need to attach a resume', '{"ru":"Для отклика на вакансию нужно прикрепить резюме"}', '2021-11-30 10:46:31', '2021-11-30 10:46:31'),
(536, '*', 'To pay', '{"ru":"К оплате"}', '2021-11-30 10:46:31', '2021-11-30 10:46:31'),
(537, '*', 'Toggle navigation', '{"ru":"Переключить навигацию"}', '2021-11-30 10:46:31', '2021-11-30 10:46:31'),
(538, '*', 'Too Many Requests', '{"ru":"Слишком много запросов"}', '2021-11-30 10:46:31', '2021-11-30 10:46:31'),
(539, '*', 'Total:', '{"ru":"Итого:"}', '2021-11-30 10:46:31', '2021-11-30 10:46:31'),
(540, '*', 'Translation', '{"ru":"Перевод"}', '2021-11-30 10:46:31', '2021-11-30 10:46:31'),
(541, '*', 'Translations', '{"ru":"Переводы"}', '2021-11-30 10:46:31', '2021-11-30 10:46:31'),
(542, '*', 'Transmittal letter', '{"ru":"Сопроводительное письмо"}', '2021-11-30 10:46:31', '2021-11-30 10:46:31'),
(543, '*', 'Two Factor Authentication', '{"ru":"Двухфакторная аутентификация"}', '2021-11-30 10:46:31', '2021-11-30 10:46:31'),
(544, '*', 'Two Factor Authentication Successfully Disabled', '{"ru":"Двухфакторная аутентификация успешно отключена"}', '2021-11-30 10:46:32', '2021-11-30 10:46:32'),
(545, '*', 'Two Factor Authentication Successfully Enabled', '{"ru":"Двухфакторная аутентификация успешно включена"}', '2021-11-30 10:46:32', '2021-11-30 10:46:32'),
(546, '*', 'Two Factor Authentication is Disabled', '{"ru":"Двухфакторная аутентификация отключена"}', '2021-11-30 10:46:32', '2021-11-30 10:46:32'),
(547, '*', 'Two Factor Authentication is Enabled', '{"ru":"Двухфакторная аутентификация включена"}', '2021-11-30 10:46:32', '2021-11-30 10:46:32'),
(548, '*', 'Two Factor Recovery Codes', '{"ru":"Двухфакторные коды восстановления"}', '2021-11-30 10:46:32', '2021-11-30 10:46:32'),
(549, '*', 'Two Factor Recovery Codes Regenerated', '{"ru":"Восстановлены двухфакторные коды восстановления"}', '2021-11-30 10:46:32', '2021-11-30 10:46:32'),
(550, '*', 'Two-factor Authentication must be :status to view this page.', '{"ru":"Двухфакторная аутентификация должна быть :status для просмотра этой страницы."}', '2021-11-30 10:46:32', '2021-11-30 10:46:32'),
(551, '*', 'Type', '{"ru":"Тип"}', '2021-11-30 10:46:32', '2021-11-30 10:46:32'),
(552, '*', 'Unread at the top', '{"ru":"Непрочитанные вверху"}', '2021-11-30 10:46:32', '2021-11-30 10:46:32'),
(553, '*', 'Unselect All', '{"ru":"Снять все"}', '2021-11-30 10:46:32', '2021-11-30 10:46:32'),
(554, '*', 'Update', '{"ru":"Обновить"}', '2021-11-30 10:46:32', '2021-11-30 10:46:32'),
(555, '*', 'Update Password', '{"ru":"Обновить пароль"}', '2021-11-30 10:46:33', '2021-11-30 10:46:33'),
(556, '*', 'Update Role', '{"ru":"Обновить роль"}', '2021-11-30 10:46:33', '2021-11-30 10:46:33'),
(557, '*', 'Update User', '{"ru":"Обновить пользователя"}', '2021-11-30 10:46:33', '2021-11-30 10:46:33'),
(558, '*', 'Used', '{"ru":"Используемый"}', '2021-11-30 10:46:33', '2021-11-30 10:46:33'),
(559, '*', 'User', '{"ru":"Пользователь"}', '2021-11-30 10:46:33', '2021-11-30 10:46:33'),
(560, '*', 'User Management', '{"ru":"Управление пользователями"}', '2021-11-30 10:46:33', '2021-11-30 10:46:33'),
(561, '*', 'Username', '{"ru":"Никнейм"}', '2021-11-30 10:46:33', '2021-11-30 10:46:33'),
(562, '*', 'Users', '{"ru":"Пользователи"}', '2021-11-30 10:46:33', '2021-11-30 10:46:33'),
(563, '*', 'Users List', '{"ru":"Список пользователей"}', '2021-11-30 10:46:33', '2021-11-30 10:46:33'),
(564, '*', 'Vacancies', '{"ru":"Вакансии"}', '2021-11-30 10:46:33', '2021-11-30 10:46:33'),
(565, '*', 'Vacancies in the hold', '{"ru":"Вакансии в холде"}', '2021-11-30 10:46:34', '2021-11-30 10:46:34'),
(566, '*', 'Vacancy', '{"ru":"Вакансия"}', '2021-11-30 10:46:34', '2021-11-30 10:46:34'),
(567, '*', 'Vacancy Archived', '{"ru":"Вакансия закрыта"}', '2021-11-30 10:46:34', '2021-11-30 10:46:34'),
(568, '*', 'Vacancy Created', '{"ru":"Вакансия создана"}', '2021-11-30 10:46:34', '2021-11-30 10:46:34'),
(569, '*', 'Vacancy Deleted', '{"ru":"Вакансия удалена"}', '2021-11-30 10:46:34', '2021-11-30 10:46:34'),
(570, '*', 'Vacancy Updated', '{"ru":"Вакансия обновлена"}', '2021-11-30 10:46:34', '2021-11-30 10:46:34'),
(571, '*', 'Vacancy description', '{"ru":"Описание вакансии"}', '2021-11-30 10:46:34', '2021-11-30 10:46:34'),
(572, '*', 'Vacancy preview', '{"ru":"Предпросмотр вакансии"}', '2021-11-30 10:46:34', '2021-11-30 10:46:34'),
(573, '*', 'Vacancy title', '{"ru":"Название вакансии","en":"Vacancy Title"}', '2021-11-30 10:46:34', '2021-11-30 10:50:25'),
(574, '*', 'Verified', '{"ru":"Проверенный"}', '2021-11-30 10:46:34', '2021-11-30 10:46:34'),
(575, '*', 'Verify E-mail Address', '{"ru":"Подтвердить почту","en":"Verify E-mail Address"}', '2021-11-30 10:46:35', '2022-02-22 15:14:01'),
(576, '*', 'Verify Email Address', '{"ru":"Подтвердить почту","en":"Verify Email Address"}', '2021-11-30 10:46:35', '2022-02-22 15:14:39'),
(577, '*', 'Verify Your E-mail Address', '{"ru":"Проверьте свой адрес электронной почты"}', '2021-11-30 10:46:35', '2021-11-30 10:46:35'),
(578, '*', 'View', '{"ru":"Просмотр"}', '2021-11-30 10:46:35', '2021-11-30 10:46:35'),
(579, '*', 'Look at other candidates', '{"ru":"Посмотреть на других кандидатов"}', '2021-11-30 10:46:35', '2021-11-30 10:46:35'),
(580, '*', 'View User', '{"ru":"Просмотр пользователя"}', '2021-11-30 10:46:35', '2021-11-30 10:46:35'),
(581, '*', 'View all candidates', '{"ru":"Смотреть всех кандидатов"}', '2021-11-30 10:46:35', '2021-11-30 10:46:35'),
(582, '*', 'View all vacancies', '{"ru":"Смотреть все вакансии"}', '2021-11-30 10:46:35', '2021-11-30 10:46:35'),
(583, '*', 'View/Regenerate Recovery Codes', '{"ru":"Посмотреть \\/ восстановить коды восстановления"}', '2021-11-30 10:46:35', '2021-11-30 10:46:35'),
(584, '*', 'We are a product company', '{"ru":"Мы продуктовая компания"}', '2021-11-30 10:46:35', '2021-11-30 10:46:35'),
(585, '*', 'We are glad that we helped you find a job', '{"ru":"Мы рады что помогли найти вам работу"}', '2021-11-30 10:46:35', '2021-11-30 10:46:35'),
(586, '*', 'We are glad that we helped you find a specialist', '{"ru":"Мы рады, что помогли найти вам специалиста"}', '2021-11-30 10:46:36', '2021-11-30 10:46:36'),
(587, '*', 'We are still looking for', '{"ru":"Мы ещё ищем"}', '2021-11-30 10:46:36', '2021-11-30 10:46:36'),
(588, '*', 'We have highlighted this category separately, since we want the candidate to be focused on long-term work in a full-time company or only freelance.', '{"ru":"Мы выделили данную категорию отдельно, так как, хотим, чтобы кандидат был ориентирован на долгосрочную работу в компании с полной загрузкой или только фриланс."}', '2021-11-30 10:46:36', '2021-11-30 10:46:36'),
(589, '*', 'We help with relocation', '{"ru":"Мы помогаем с релокейтом"}', '2021-11-30 10:46:36', '2021-11-30 10:46:36'),
(590, '*', 'We still communicate', '{"ru":"Ещё общаемся"}', '2021-11-30 10:46:36', '2021-11-30 10:46:36'),
(591, '*', 'Website', '{"ru":"Вебсайт"}', '2021-11-30 10:46:36', '2021-11-30 10:46:36'),
(592, '*', 'Welcome :Name', '{"ru":"Добро пожаловать :Name"}', '2021-11-30 10:46:36', '2021-11-30 10:46:36'),
(593, '*', 'Welcome to the Dashboard', '{"ru":"Добро пожаловать на панель инструментов"}', '2021-11-30 10:46:36', '2021-11-30 10:46:36'),
(594, '*', 'Where would you like to receive notifications?', '{"ru":"Куда бы вы хотели получать уведомления?"}', '2021-11-30 10:46:36', '2021-11-30 10:46:36'),
(595, '*', 'Whoops!', '{"ru":"Ой!"}', '2021-11-30 10:46:37', '2021-11-30 10:46:37'),
(596, '*', 'Without experience', '{"ru":"Без опыта"}', '2021-11-30 10:46:37', '2021-11-30 10:46:37'),
(597, '*', 'Work experience', '{"ru":"Опыт работы"}', '2021-11-30 10:46:37', '2021-11-30 10:46:37'),
(598, '*', 'Work options considered', '{"ru":"Рассматриваемые варианты работы"}', '2021-11-30 10:46:37', '2021-11-30 10:46:37'),
(599, '*', 'Write a message', '{"ru":"Напиши сообщение"}', '2021-11-30 10:46:37', '2021-11-30 10:46:37'),
(600, '*', 'Yes', '{"ru":"Да"}', '2021-11-30 10:46:37', '2021-11-30 10:46:37'),
(601, '*', 'Yes, I confirm the complete deletion of the account.', '{"ru":"Да, подтверждаю полное удаление аккаунта."}', '2021-11-30 10:46:37', '2021-11-30 10:46:37'),
(602, '*', 'Yes, I found a job', '{"ru":"Да, я нашёл(a) работу"}', '2021-11-30 10:46:37', '2021-11-30 10:46:37'),
(603, '*', 'Yes, I found a job at', '{"ru":"Да, я нашёл(a) работу на"}', '2021-11-30 10:46:37', '2021-11-30 10:46:37'),
(604, '*', 'Yes, I found a job at Jobzz.ru', '{"ru":"Да, я нашёл(a) работу на Jobzz.ru"}', '2021-11-30 10:46:37', '2021-11-30 10:46:37'),
(605, '*', 'Yes, I will work for this company', '{"ru":"Да, я буду работать в данной компании"}', '2021-11-30 10:46:38', '2021-11-30 10:46:38'),
(606, '*', 'Yes, we found a candidate on this resource', '{"ru":"Да, мы нашли кандидата на данном ресурсе"}', '2021-11-30 10:46:38', '2021-11-30 10:46:38'),
(607, '*', 'Yes, we hired a candidate', '{"ru":"Да, мы наняли кандидата"}', '2021-11-30 10:46:38', '2021-11-30 10:46:38'),
(608, '*', 'Yesterday', '{"ru":"Вчера"}', '2021-11-30 10:46:38', '2021-11-30 10:46:38'),
(609, '*', 'You', '{"ru":"Вы"}', '2021-11-30 10:46:38', '2021-11-30 10:46:38'),
(610, '*', 'Please indicate in the purpose of payment the information that is indicated in the invoice (numbers too) or inform the support about payment so that we can immediately check it and confirm th', '{"ru":"Пожалуйста, в назначение платежа указывать информацию, которая указанна в инвойсе (цифры тоже) или сообщите в саппорт об оплате, чтобы мы могли ее сразу проверить и подтвердить платёж"}', '2021-11-30 10:46:38', '2021-11-30 10:46:38'),
(611, '*', 'You are currently logged in as :name.', '{"ru":"Вы вошли в систему как :name."}', '2021-11-30 10:46:38', '2021-11-30 10:46:38'),
(612, '*', 'You are currently selecting all', '{"ru":"Вы сейчас выбираете все"}', '2021-11-30 10:46:38', '2021-11-30 10:46:38'),
(613, '*', 'You are logged in!', '{"ru":"Вы вошли в систему!"}', '2021-11-30 10:46:38', '2021-11-30 10:46:38'),
(614, '*', 'You are not connected to the internet.', '{"ru":"You are not connected to the internet."}', '2021-11-30 10:46:39', '2021-11-30 10:46:39'),
(615, '*', 'You are receiving this email because we received a password reset request for your account.', '{"ru":"Вы получили это письмо, потому что мы получили запрос на сброс пароля для вашей учетной записи."}', '2021-11-30 10:46:39', '2021-11-30 10:46:39'),
(616, '*', 'You can not clear your own session.', '{"ru":"Вы не можете очистить свой собственный сеанс."}', '2021-11-30 10:46:39', '2021-11-30 10:46:39'),
(617, '*', 'You can not deactivate the administrator account.', '{"ru":"Вы не можете деактивировать учетную запись администратора."}', '2021-11-30 10:46:39', '2021-11-30 10:46:39'),
(618, '*', 'You can not delete a role with associated users.', '{"ru":"Вы не можете удалить роль со связанными пользователями."}', '2021-11-30 10:46:39', '2021-11-30 10:46:39'),
(619, '*', 'You can not delete the Administrator role.', '{"ru":"Вы не можете удалить роль администратора."}', '2021-11-30 10:46:39', '2021-11-30 10:46:39'),
(620, '*', 'You can not delete the master administrator.', '{"ru":"Вы не можете удалить главного администратора."}', '2021-11-30 10:46:39', '2021-11-30 10:46:39'),
(621, '*', 'You can not delete yourself.', '{"ru":"Вы не можете удалить себя."}', '2021-11-30 10:46:39', '2021-11-30 10:46:39'),
(622, '*', 'You can not do that to yourself.', '{"ru":"Вы не можете сделать это для себя."}', '2021-11-30 10:46:39', '2021-11-30 10:46:39'),
(623, '*', 'You can not edit the Administrator role.', '{"ru":"Вы не можете редактировать роль администратора."}', '2021-11-30 10:46:40', '2021-11-30 10:46:40'),
(624, '*', 'You can not set a password that you have previously used within the last 3 times.', '{"ru":"Вы не можете установить пароль, который вы ранее использовали в течение последних 3 раз."}', '2021-11-30 10:46:40', '2021-11-30 10:46:40'),
(625, '*', 'You can not set a password that you have previously used within the last :num times.', '{"ru":"Вы не можете установить пароль, который вы ранее использовали в течение последних :num раз."}', '2021-11-30 10:46:40', '2021-11-30 10:46:40'),
(626, '*', 'You can send standard text or edit it.', '{"ru":"Вы можете отправить стандартный текст или отредактировать его."}', '2021-11-30 10:46:40', '2021-11-30 10:46:40'),
(627, '*', 'You can send the standard text to the candidate or edit it.', '{"ru":"Вы можете отправить кандидату стандартный текст или отредактировать его."}', '2021-11-30 10:46:40', '2021-11-30 10:46:40'),
(628, '*', 'You do not have access to do that.', '{"ru":"У вас нет доступа для этого."}', '2021-11-30 10:46:40', '2021-11-30 10:46:40'),
(629, '*', 'You have no vacancies to propose to a candidate.', '{"ru":"У вас нет вакансий чтобы предложить кандидату."}', '2021-11-30 10:46:40', '2021-11-30 10:46:40'),
(630, '*', 'You have selected', '{"ru":"Вы выбрали"}', '2021-11-30 10:46:40', '2021-11-30 10:46:40'),
(631, '*', 'You must accept the Terms & Conditions.', '{"ru":"Вы должны принять Условия."}', '2021-11-30 10:46:40', '2021-11-30 10:46:40'),
(632, '*', 'You must confirm your new e-mail address before you can go any further.', '{"ru":"Вы должны подтвердить свой новый адрес электронной почты, прежде чем идти дальше."}', '2021-11-30 10:46:41', '2021-11-30 10:46:41'),
(633, '*', 'You need to add a resume', '{"ru":"Нужно добавить резюме"}', '2021-11-30 10:46:41', '2021-11-30 10:46:41'),
(634, '*', 'You will not receive job offers from recruiters, but you can apply for vacancies yourself', '{"ru":"Вы не будете получать предложения о работе от рекрутеров, но можете откликаться на вакансии самостоятельно"}', '2021-11-30 10:46:41', '2021-11-30 10:46:41'),
(635, '*', 'Your account has been blocked by the administrator', '{"ru":"Ваш аккаунт заблокирован администратором"}', '2021-11-30 10:46:41', '2021-11-30 10:46:41'),
(636, '*', 'Your account has been blocked', '{"ru":"Ваш аккаунт заблокирован"}', '2021-11-30 10:46:41', '2021-11-30 10:46:41'),
(637, '*', 'Your account has been deactivated.', '{"ru":"Ваш аккаунт был деактивирован."}', '2021-11-30 10:46:41', '2021-11-30 10:46:41'),
(638, '*', 'Your address', '{"ru":"Ваш адрес"}', '2021-11-30 10:46:41', '2021-11-30 10:46:41'),
(639, '*', 'Your authorization code was invalid. Please try again.', '{"ru":"Ваш код авторизации был недействительным. Пожалуйста, попробуйте еще раз."}', '2021-11-30 10:46:41', '2021-11-30 10:46:41'),
(640, '*', 'Your avatar', '{"ru":"Ваша аватарка"}', '2021-11-30 10:46:41', '2021-11-30 10:46:41'),
(641, '*', 'Your chat messages will also be deleted.', '{"ru":"Ваши сообщения в чате также будут удалены."}', '2021-11-30 10:46:42', '2021-11-30 10:46:42'),
(642, '*', 'Your name and surname', '{"ru":"Ваше имя и фамилия"}', '2021-11-30 10:46:42', '2021-11-30 10:46:42'),
(643, '*', 'Your password has expired.', '{"ru":"Ваш пароль истек."}', '2021-11-30 10:46:42', '2021-11-30 10:46:42'),
(644, '*', 'Your password has expired. We require you to change your password every :days days for security purposes.', '{"ru":"Ваш пароль истек. Мы требуем, чтобы вы меняли свой пароль каждые :days день в целях безопасности."}', '2021-11-30 10:46:42', '2021-11-30 10:46:42'),
(645, '*', 'Your position', '{"ru":"Ваша должность"}', '2021-11-30 10:46:42', '2021-11-30 10:46:42'),
(646, '*', 'Your profile has been blocked by the administrator', '{"ru":"Ваш профиль заблокирован администратором"}', '2021-11-30 10:46:42', '2021-11-30 10:46:42'),
(647, '*', 'Your profile is on moderation', '{"ru":"Ваш профиль на модерации"}', '2021-11-30 10:46:42', '2021-11-30 10:46:42'),
(648, '*', 'Your zip code', '{"ru":"Ваш почтовый индекс"}', '2021-11-30 10:46:42', '2021-11-30 10:46:42'),
(649, '*', 'Thank you for your payment!', '{"ru":"Спасибо за оплату!"}', '2021-11-30 10:46:42', '2021-11-30 10:46:42'),
(650, '*', 'Zip', '{"ru":"Индекс"}', '2021-11-30 10:46:43', '2021-11-30 10:46:43'),
(651, '*', 'Enter keywords...', '{"ru":"Введите ключевые слова..."}', '2021-11-30 10:46:43', '2021-11-30 10:46:43'),
(652, '*', 'Vacancies by my profile', '{"ru":"Вакансии по моему профилю","en":"Vacancies by my profile"}', '2021-11-30 10:46:43', '2021-11-30 12:17:01'),
(653, '*', 'according to my profile', '{"ru":"по моему профилю"}', '2021-11-30 10:46:43', '2021-11-30 10:46:43'),
(654, '*', 'and', '{"ru":"и"}', '2021-11-30 10:46:43', '2021-11-30 10:46:43'),
(655, '*', 'before', '{"ru":"до"}', '2021-11-30 10:46:43', '2021-11-30 10:46:43'),
(656, '*', 'candidates will not see the exact number, but the vacancy will be located in one of the salary categories', '{"ru":"кандидаты не увидят точной цифры, но вакансия будет расположена в одной из зарплатных категорий"}', '2021-11-30 10:46:43', '2021-11-30 10:46:43'),
(657, '*', 'click here to request another', '{"ru":"нажмите здесь, чтобы запросить другой"}', '2021-11-30 10:46:43', '2021-11-30 10:46:43'),
(658, '*', 'do not forget to include requirements, responsibilities and what you offer', '{"ru":"не забудьте указать требования, обязанности и что вы предлагаете"}', '2021-11-30 10:46:44', '2021-11-30 10:46:44'),
(659, '*', 'female', '{"ru":"женский"}', '2021-11-30 10:46:44', '2021-11-30 10:46:44'),
(660, '*', 'from', '{"ru":"с"}', '2021-11-30 10:46:44', '2021-11-30 10:46:44'),
(661, '*', 'in', '{"ru":"в"}', '2021-11-30 10:46:44', '2021-11-30 10:46:44'),
(662, '*', 'just', '{"ru":"только что"}', '2021-11-30 10:46:44', '2021-11-30 10:46:44'),
(663, '*', 'just now', '{"ru":"только что"}', '2021-11-30 10:46:44', '2021-11-30 10:46:44'),
(664, '*', 'male', '{"ru":"мужской"}', '2021-11-30 10:46:44', '2021-11-30 10:46:44'),
(665, '*', 'no more than 5 skills, not necessary, but this will help speed up the job search process', '{"ru":"не более 5 навыков, не обязательно но это поможет ускорить процесс поиска работы"}', '2021-11-30 10:46:45', '2021-11-30 10:46:45'),
(666, '*', 'not necessary', '{"ru":"не обязательно"}', '2021-11-30 10:46:45', '2021-11-30 10:46:45'),
(667, '*', 'of', '{"ru":"из"}', '2021-11-30 10:46:45', '2021-11-30 10:46:45'),
(668, '*', 'of the year', '{"ru":"года"}', '2021-11-30 10:46:45', '2021-11-30 10:46:45'),
(669, '*', 'or', '{"ru":"или"}', '2021-11-30 10:46:45', '2021-11-30 10:46:45'),
(670, '*', 'profile', '{"ru":"профиль"}', '2021-11-30 10:46:45', '2021-11-30 10:46:45'),
(671, '*', 'results', '{"ru":"строки"}', '2021-11-30 10:46:45', '2021-11-30 10:46:45'),
(672, '*', 'rows', '{"ru":"строк"}', '2021-11-30 10:46:45', '2021-11-30 10:46:45'),
(673, '*', 'rows, do you want to select all', '{"ru":"строки, вы хотите выделить все"}', '2021-11-30 10:46:46', '2021-11-30 10:46:46'),
(674, '*', 'rubles', '{"ru":"рублей"}', '2021-11-30 10:46:46', '2021-11-30 10:46:46'),
(675, '*', 'rubles/hour', '{"ru":"рублей\\/час"}', '2021-11-30 10:46:46', '2021-11-30 10:46:46'),
(676, '*', 'sent', '{"ru":"отправлено"}', '2021-11-30 10:46:46', '2021-11-30 10:46:46'),
(677, '*', 'step', '{"ru":"шаг"}', '2021-11-30 10:46:46', '2021-11-30 10:46:46'),
(678, '*', 'to', '{"ru":"по"}', '2021-11-30 10:46:46', '2021-11-30 10:46:46'),
(679, '*', 'year', '{"ru":"год"}', '2021-11-30 10:46:46', '2021-11-30 10:46:46'),
(680, '*', 'years', '{"ru":"лет"}', '2021-11-30 10:46:46', '2021-11-30 10:46:46'),
(681, 'auth', 'failed', '{"en":"These credentials do not match our records.","ru":"Имя пользователя и пароль не совпадают."}', '2021-11-30 10:46:46', '2021-11-30 10:46:56'),
(682, 'auth', 'password', '{"en":"The provided password is incorrect."}', '2021-11-30 10:46:47', '2021-11-30 10:46:47'),
(683, 'auth', 'throttle', '{"en":"Too many login attempts. Please try again in :seconds seconds.","ru":"Слишком много попыток входа. Пожалуйста, попробуйте еще раз через :seconds секунд."}', '2021-11-30 10:46:47', '2021-11-30 10:46:56'),
(684, 'candidate', 'title', '{"en":"Candidate","ru":"Кандидат"}', '2021-11-30 10:46:47', '2021-11-30 10:46:56'),
(685, 'candidate', 'title_many', '{"en":"Candidates","ru":"Кандидаты"}', '2021-11-30 10:46:47', '2021-11-30 10:46:56'),
(686, 'candidate', 'publish-date', '{"en":"Publish date","ru":"Дата публикации"}', '2021-11-30 10:46:47', '2021-11-30 10:46:56'),
(687, 'candidate', 'activity', '{"en":"Activity:","ru":"Активность:"}', '2021-11-30 10:46:47', '2021-11-30 10:46:56'),
(688, 'candidate', 'experience', '{"en":"Experience","ru":"Опыт"}', '2021-11-30 10:46:47', '2021-11-30 10:46:56'),
(689, 'candidate', 'english-level', '{"en":"English Level","ru":"Уровень Английского"}', '2021-11-30 10:46:47', '2021-11-30 10:46:56'),
(690, 'candidate', 'salary', '{"en":"Salary","ru":"Зарплата"}', '2021-11-30 10:46:47', '2021-11-30 10:46:57'),
(691, 'candidate', 'location', '{"en":"Location","ru":"Локация"}', '2021-11-30 10:46:47', '2021-11-30 10:46:57'),
(692, 'candidate', 'work-options', '{"en":"Work options considered","ru":"Рассматриваемые варианты работы"}', '2021-11-30 10:46:47', '2021-11-30 10:46:57'),
(693, 'candidate', 'specialization', '{"en":"Specialization","ru":"Специализация"}', '2021-11-30 10:46:47', '2021-11-30 10:46:57'),
(694, 'candidate', 'skills', '{"en":"Basic skills","ru":"Основные навыки"}', '2021-11-30 10:46:47', '2021-11-30 10:46:57'),
(695, 'candidate', 'additional-skills', '{"en":"Skills","ru":"Навыки"}', '2021-11-30 10:46:47', '2021-11-30 10:46:57'),
(696, 'candidate', 'short-description', '{"en":"Short description","ru":"Краткое описание"}', '2021-11-30 10:46:47', '2021-11-30 10:46:57'),
(697, 'candidate', 'description', '{"en":"Description","ru":"Описание"}', '2021-11-30 10:46:47', '2021-11-30 10:46:57'),
(698, 'candidate', 'about', '{"en":"About myself","ru":"О себе"}', '2021-11-30 10:46:48', '2021-11-30 10:46:57'),
(699, 'candidate', 'price_full_time', '{"en":"Fulltime Cost","ru":"Стоимость Фултайм"}', '2021-11-30 10:46:48', '2021-11-30 10:46:57'),
(700, 'candidate', 'price_freelance', '{"en":"Freelance Cost","ru":"Стоимость Freelance"}', '2021-11-30 10:46:48', '2021-11-30 10:46:57'),
(701, 'candidate', 'look-around', '{"en":"I want to see vacancies","ru":"Хочу посмотреть вакансии"}', '2021-11-30 10:46:48', '2021-11-30 10:46:57'),
(702, 'candidate', 'candidate-registration', '{"en":"Candidate registration","ru":"Регистрация кандидата"}', '2021-11-30 10:46:48', '2021-11-30 10:46:57'),
(703, 'candidate', 'employer-registration', '{"en":"Employer registration","ru":"Регистрация работодателя"}', '2021-11-30 10:46:48', '2021-11-30 10:46:58'),
(704, 'candidate', 'from', '{"en":"from","ru":"от"}', '2021-11-30 10:46:48', '2021-11-30 10:46:58'),
(705, 'candidate', 'to', '{"en":"to","ru":"до"}', '2021-11-30 10:46:48', '2021-11-30 10:46:58'),
(706, 'pagination', 'previous', '{"en":"&laquo; Previous","ru":"&laquo; Назад"}', '2021-11-30 10:46:48', '2021-11-30 10:46:58'),
(707, 'pagination', 'next', '{"en":"Next &raquo;","ru":"Вперёд &raquo;"}', '2021-11-30 10:46:48', '2021-11-30 10:46:58'),
(708, 'passwords', 'reset', '{"en":"Your password has been reset!","ru":"Ваш пароль был изменен!"}', '2021-11-30 10:46:48', '2021-11-30 10:46:58'),
(709, 'passwords', 'sent', '{"en":"We have e-mailed your password reset link!","ru":"На ваш E-mail отправлена инструкция на изменение пароля!"}', '2021-11-30 10:46:48', '2021-11-30 10:46:58'),
(710, 'passwords', 'throttled', '{"en":"Please wait before retrying.","ru":"Please wait before retrying."}', '2021-11-30 10:46:48', '2021-11-30 10:46:58'),
(711, 'passwords', 'token', '{"en":"This password reset token is invalid.","ru":"Ошибочный код изменения пароля."}', '2021-11-30 10:46:48', '2021-11-30 10:46:58'),
(712, 'passwords', 'user', '{"en":"We can''t find a user with that e-mail address.","ru":"Не удалось найти пользователя с указанным E-mail."}', '2021-11-30 10:46:48', '2021-11-30 10:46:58'),
(713, 'payment', 'title', '{"en":"Payment","ru":"Оплата"}', '2021-11-30 10:46:48', '2021-11-30 10:46:59'),
(714, 'payment', 'your-details', '{"en":"Your details","ru":"Реквизиты плательщика"}', '2021-11-30 10:46:49', '2021-11-30 10:46:59'),
(715, 'payment', 'full-name', '{"en":"Full name","ru":"ФИО"}', '2021-11-30 10:46:49', '2021-11-30 10:46:59'),
(716, 'payment', 'your-name-and-surname', '{"en":"Your name and surname","ru":"Ваше имя и фамилия"}', '2021-11-30 10:46:49', '2021-11-30 10:46:59'),
(717, 'payment', 'address', '{"en":"Address","ru":"Адрес"}', '2021-11-30 10:46:49', '2021-11-30 10:46:59'),
(718, 'payment', 'you-address', '{"en":"You address","ru":"Ваш адрес"}', '2021-11-30 10:46:49', '2021-11-30 10:46:59'),
(719, 'payment', 'zip', '{"en":"Zip","ru":"Индекс"}', '2021-11-30 10:46:49', '2021-11-30 10:46:59'),
(720, 'payment', 'your-zip-code', '{"en":"Your zip code","ru":"Ваш почтовый индекс"}', '2021-11-30 10:46:49', '2021-11-30 10:46:59'),
(721, 'payment', 'phone-number', '{"en":"Phone number","ru":"Номер телефона"}', '2021-11-30 10:46:49', '2021-11-30 10:46:59'),
(722, 'vacancy', 'from', '{"en":"from","ru":"от"}', '2021-11-30 10:46:49', '2021-11-30 10:46:59'),
(723, 'vacancy', 'to', '{"en":"to","ru":"до"}', '2021-11-30 10:46:49', '2021-11-30 10:46:59'),
(724, 'vacancy', 'rubles', '{"en":"rubles","ru":"рублей"}', '2021-11-30 10:46:49', '2021-11-30 10:46:59'),
(725, 'vacancy', 'net', '{"en":"Net","ru":"Net (з\\\\п чистыми)"}', '2021-11-30 10:46:49', '2021-11-30 10:47:00'),
(726, 'vacancy', 'from-one-year', '{"en":"year","ru":"года"}', '2021-11-30 10:46:49', '2021-11-30 10:47:00'),
(727, 'vacancy', 'from-many-years', '{"en":"years","ru":"лет"}', '2021-11-30 10:46:49', '2021-11-30 10:47:00'),
(728, 'validation', 'accepted', '{"en":"The :attribute must be accepted.","ru":"Вы должны принять :attribute."}', '2021-11-30 10:46:49', '2021-11-30 10:47:00'),
(729, 'validation', 'active_url', '{"en":"The :attribute is not a valid URL.","ru":"Поле :attribute содержит недействительный URL."}', '2021-11-30 10:46:50', '2021-11-30 10:47:00'),
(730, 'validation', 'after', '{"en":"The :attribute must be a date after :date.","ru":"В поле :attribute должна быть дата после :date."}', '2021-11-30 10:46:50', '2021-11-30 10:47:00'),
(731, 'validation', 'after_or_equal', '{"en":"The :attribute must be a date after or equal to :date.","ru":"В поле :attribute должна быть дата после или равняться :date."}', '2021-11-30 10:46:50', '2021-11-30 10:47:00'),
(732, 'validation', 'alpha', '{"en":"The :attribute may only contain letters.","ru":"Поле :attribute может содержать только буквы."}', '2021-11-30 10:46:50', '2021-11-30 10:47:00'),
(733, 'validation', 'alpha_dash', '{"en":"The :attribute may only contain letters, numbers, dashes and underscores.","ru":"Поле :attribute может содержать только буквы, цифры и дефис."}', '2021-11-30 10:46:50', '2021-11-30 10:47:00'),
(734, 'validation', 'alpha_num', '{"en":"The :attribute may only contain letters and numbers.","ru":"Поле :attribute может содержать только буквы и цифры."}', '2021-11-30 10:46:50', '2021-11-30 10:47:00'),
(735, 'validation', 'array', '{"en":"The :attribute must be an array.","ru":"Поле :attribute должно быть массивом."}', '2021-11-30 10:46:50', '2021-11-30 10:47:00'),
(736, 'validation', 'before', '{"en":"The :attribute must be a date before :date.","ru":"В поле :attribute должна быть дата до :date."}', '2021-11-30 10:46:50', '2021-11-30 10:47:00'),
(737, 'validation', 'before_or_equal', '{"en":"The :attribute must be a date before or equal to :date.","ru":"В поле :attribute должна быть дата до или равняться :date."}', '2021-11-30 10:46:50', '2021-11-30 10:47:00'),
(738, 'validation', 'between.numeric', '{"en":"The :attribute must be between :min and :max.","ru":"Поле :attribute должно быть между :min и :max."}', '2021-11-30 10:46:50', '2021-11-30 10:47:01'),
(739, 'validation', 'between.file', '{"en":"The :attribute must be between :min and :max kilobytes.","ru":"Размер файла в поле :attribute должен быть между :min и :max Килобайт(а)."}', '2021-11-30 10:46:50', '2021-11-30 10:47:01'),
(740, 'validation', 'between.string', '{"en":"The :attribute must be between :min and :max characters.","ru":"Количество символов в поле :attribute должно быть между :min и :max."}', '2021-11-30 10:46:50', '2021-11-30 10:47:01'),
(741, 'validation', 'between.array', '{"en":"The :attribute must have between :min and :max items.","ru":"Количество элементов в поле :attribute должно быть между :min и :max."}', '2021-11-30 10:46:50', '2021-11-30 10:47:01'),
(742, 'validation', 'boolean', '{"en":"The :attribute field must be true or false.","ru":"Поле :attribute должно иметь значение логического типа."}', '2021-11-30 10:46:50', '2021-11-30 10:47:01'),
(743, 'validation', 'confirmed', '{"en":"The :attribute confirmation does not match.","ru":"Поле :attribute не совпадает с подтверждением."}', '2021-11-30 10:46:50', '2021-11-30 10:47:01'),
(744, 'validation', 'date', '{"en":"The :attribute is not a valid date.","ru":"Поле :attribute не является датой."}', '2021-11-30 10:46:51', '2021-11-30 10:47:01'),
(745, 'validation', 'date_equals', '{"en":"The :attribute must be a date equal to :date.","ru":"The :attribute must be a date equal to :date."}', '2021-11-30 10:46:51', '2021-11-30 10:47:01'),
(746, 'validation', 'date_format', '{"en":"The :attribute does not match the format :format.","ru":"Поле :attribute не соответствует формату :format."}', '2021-11-30 10:46:51', '2021-11-30 10:47:01'),
(747, 'validation', 'different', '{"en":"The :attribute and :other must be different.","ru":"Поля :attribute и :other должны различаться."}', '2021-11-30 10:46:51', '2021-11-30 10:47:01'),
(748, 'validation', 'digits', '{"en":"The :attribute must be :digits digits.","ru":"Длина цифрового поля :attribute должна быть :digits."}', '2021-11-30 10:46:51', '2021-11-30 10:47:01'),
(749, 'validation', 'digits_between', '{"en":"The :attribute must be between :min and :max digits.","ru":"Длина цифрового поля :attribute должна быть между :min и :max."}', '2021-11-30 10:46:51', '2021-11-30 10:47:01'),
(750, 'validation', 'dimensions', '{"en":"The :attribute has invalid image dimensions.","ru":"Поле :attribute имеет недопустимые размеры изображения."}', '2021-11-30 10:46:51', '2021-11-30 10:47:02'),
(751, 'validation', 'distinct', '{"en":"The :attribute field has a duplicate value.","ru":"Поле :attribute содержит повторяющееся значение."}', '2021-11-30 10:46:51', '2021-11-30 10:47:02'),
(752, 'validation', 'email', '{"en":"The :attribute must be a valid email address.","ru":"Поле :attribute должно быть действительным электронным адресом."}', '2021-11-30 10:46:51', '2021-11-30 10:47:02'),
(753, 'validation', 'ends_with', '{"en":"The :attribute must end with one of the following: :values.","ru":"The :attribute must end with one of the following: :values"}', '2021-11-30 10:46:51', '2021-11-30 10:47:02'),
(754, 'validation', 'exists', '{"en":"The selected :attribute is invalid.","ru":"Выбранное значение для :attribute некорректно."}', '2021-11-30 10:46:51', '2021-11-30 10:47:02'),
(755, 'validation', 'file', '{"en":"The :attribute must be a file.","ru":"Поле :attribute должно быть файлом."}', '2021-11-30 10:46:51', '2021-11-30 10:47:02'),
(756, 'validation', 'filled', '{"en":"The :attribute field must have a value.","ru":"Поле :attribute обязательно для заполнения."}', '2021-11-30 10:46:51', '2021-11-30 10:47:02'),
(757, 'validation', 'gt.numeric', '{"en":"The :attribute must be greater than :value.","ru":"The :attribute must be greater than :value."}', '2021-11-30 10:46:51', '2021-11-30 10:47:02'),
(758, 'validation', 'gt.file', '{"en":"The :attribute must be greater than :value kilobytes.","ru":"The :attribute must be greater than :value kilobytes."}', '2021-11-30 10:46:51', '2021-11-30 10:47:02'),
(759, 'validation', 'gt.string', '{"en":"The :attribute must be greater than :value characters.","ru":"The :attribute must be greater than :value characters."}', '2021-11-30 10:46:52', '2021-11-30 10:47:02'),
(760, 'validation', 'gt.array', '{"en":"The :attribute must have more than :value items.","ru":"The :attribute must have more than :value items."}', '2021-11-30 10:46:52', '2021-11-30 10:47:02'),
(761, 'validation', 'gte.numeric', '{"en":"The :attribute must be greater than or equal :value.","ru":"The :attribute must be greater than or equal :value."}', '2021-11-30 10:46:52', '2021-11-30 10:47:02'),
(762, 'validation', 'gte.file', '{"en":"The :attribute must be greater than or equal :value kilobytes.","ru":"The :attribute must be greater than or equal :value kilobytes."}', '2021-11-30 10:46:52', '2021-11-30 10:47:03'),
(763, 'validation', 'gte.string', '{"en":"The :attribute must be greater than or equal :value characters.","ru":"The :attribute must be greater than or equal :value characters."}', '2021-11-30 10:46:52', '2021-11-30 10:47:03'),
(764, 'validation', 'gte.array', '{"en":"The :attribute must have :value items or more.","ru":"The :attribute must have :value items or more."}', '2021-11-30 10:46:52', '2021-11-30 10:47:03'),
(765, 'validation', 'image', '{"en":"The :attribute must be an image.","ru":"Поле :attribute должно быть изображением."}', '2021-11-30 10:46:52', '2021-11-30 10:47:03'),
(766, 'validation', 'in', '{"en":"The selected :attribute is invalid.","ru":"Выбранное значение для :attribute ошибочно."}', '2021-11-30 10:46:52', '2021-11-30 10:47:03'),
(767, 'validation', 'in_array', '{"en":"The :attribute field does not exist in :other.","ru":"Поле :attribute не существует в :other."}', '2021-11-30 10:46:52', '2021-11-30 10:47:03'),
(768, 'validation', 'integer', '{"en":"The :attribute must be an integer.","ru":"Поле :attribute должно быть целым числом."}', '2021-11-30 10:46:52', '2021-11-30 10:47:03'),
(769, 'validation', 'ip', '{"en":"The :attribute must be a valid IP address.","ru":"Поле :attribute должно быть действительным IP-адресом."}', '2021-11-30 10:46:52', '2021-11-30 10:47:03'),
(770, 'validation', 'ipv4', '{"en":"The :attribute must be a valid IPv4 address.","ru":"Поле :attribute должно быть действительным IPv4 адресом."}', '2021-11-30 10:46:52', '2021-11-30 10:47:03'),
(771, 'validation', 'ipv6', '{"en":"The :attribute must be a valid IPv6 address.","ru":"Поле :attribute должно быть действительным IPv6 адресом."}', '2021-11-30 10:46:52', '2021-11-30 10:47:03'),
(772, 'validation', 'json', '{"en":"The :attribute must be a valid JSON string.","ru":"Поле :attribute должно быть JSON строкой."}', '2021-11-30 10:46:52', '2021-11-30 10:47:03'),
(773, 'validation', 'lt.numeric', '{"en":"The :attribute must be less than :value.","ru":"The :attribute must be less than :value."}', '2021-11-30 10:46:52', '2021-11-30 10:47:03'),
(774, 'validation', 'lt.file', '{"en":"The :attribute must be less than :value kilobytes.","ru":"The :attribute must be less than :value kilobytes."}', '2021-11-30 10:46:53', '2021-11-30 10:47:04'),
(775, 'validation', 'lt.string', '{"en":"The :attribute must be less than :value characters.","ru":"The :attribute must be less than :value characters."}', '2021-11-30 10:46:53', '2021-11-30 10:47:04'),
(776, 'validation', 'lt.array', '{"en":"The :attribute must have less than :value items.","ru":"The :attribute must have less than :value items."}', '2021-11-30 10:46:53', '2021-11-30 10:47:04'),
(777, 'validation', 'lte.numeric', '{"en":"The :attribute must be less than or equal :value.","ru":"The :attribute must be less than or equal :value."}', '2021-11-30 10:46:53', '2021-11-30 10:47:04'),
(778, 'validation', 'lte.file', '{"en":"The :attribute must be less than or equal :value kilobytes.","ru":"The :attribute must be less than or equal :value kilobytes."}', '2021-11-30 10:46:53', '2021-11-30 10:47:04'),
(779, 'validation', 'lte.string', '{"en":"The :attribute must be less than or equal :value characters.","ru":"The :attribute must be less than or equal :value characters."}', '2021-11-30 10:46:53', '2021-11-30 10:47:04'),
(780, 'validation', 'lte.array', '{"en":"The :attribute must not have more than :value items.","ru":"The :attribute must not have more than :value items."}', '2021-11-30 10:46:53', '2021-11-30 10:47:04'),
(781, 'validation', 'max.numeric', '{"en":"The :attribute may not be greater than :max.","ru":"Поле :attribute не может быть более :max."}', '2021-11-30 10:46:53', '2021-11-30 10:47:04'),
(782, 'validation', 'max.file', '{"en":"The :attribute may not be greater than :max kilobytes.","ru":"Размер файла в поле :attribute не может быть более :max Килобайт(а)."}', '2021-11-30 10:46:53', '2021-11-30 10:47:04'),
(783, 'validation', 'max.string', '{"en":"The :attribute may not be greater than :max characters.","ru":"Количество символов в поле :attribute не может превышать :max."}', '2021-11-30 10:46:53', '2021-11-30 10:47:04'),
(784, 'validation', 'max.array', '{"en":"The :attribute may not have more than :max items.","ru":"Количество элементов в поле :attribute не может превышать :max."}', '2021-11-30 10:46:53', '2021-11-30 10:47:04'),
(785, 'validation', 'mimes', '{"en":"The :attribute must be a file of type: :values.","ru":"Поле :attribute должно быть файлом одного из следующих типов: :values."}', '2021-11-30 10:46:53', '2021-11-30 10:47:04'),
(786, 'validation', 'mimetypes', '{"en":"The :attribute must be a file of type: :values.","ru":"Поле :attribute должно быть файлом одного из следующих типов: :values."}', '2021-11-30 10:46:53', '2021-11-30 10:47:04'),
(787, 'validation', 'min.numeric', '{"en":"The :attribute must be at least :min.","ru":"Поле :attribute должно быть не менее :min."}', '2021-11-30 10:46:54', '2021-11-30 10:47:05'),
(788, 'validation', 'min.file', '{"en":"The :attribute must be at least :min kilobytes.","ru":"Размер файла в поле :attribute должен быть не менее :min Килобайт(а)."}', '2021-11-30 10:46:54', '2021-11-30 10:47:05'),
(789, 'validation', 'min.string', '{"en":"The :attribute must be at least :min characters.","ru":"Количество символов в поле :attribute должно быть не менее :min."}', '2021-11-30 10:46:54', '2021-11-30 10:47:05'),
(790, 'validation', 'min.array', '{"en":"The :attribute must have at least :min items.","ru":"Количество элементов в поле :attribute должно быть не менее :min."}', '2021-11-30 10:46:54', '2021-11-30 10:47:05'),
(791, 'validation', 'multiple_of', '{"en":"The :attribute must be a multiple of :value"}', '2021-11-30 10:46:54', '2021-11-30 10:46:54'),
(792, 'validation', 'not_in', '{"en":"The selected :attribute is invalid.","ru":"Выбранное значение для :attribute ошибочно."}', '2021-11-30 10:46:54', '2021-11-30 10:47:05'),
(793, 'validation', 'not_regex', '{"en":"The :attribute format is invalid.","ru":"The :attribute format is invalid."}', '2021-11-30 10:46:54', '2021-11-30 10:47:05'),
(794, 'validation', 'numeric', '{"en":"The :attribute must be a number.","ru":"Поле :attribute должно быть числом."}', '2021-11-30 10:46:54', '2021-11-30 10:47:05'),
(795, 'validation', 'password', '{"en":"The password is incorrect.","ru":"Не верный пароль."}', '2021-11-30 10:46:54', '2021-11-30 10:47:05'),
(796, 'validation', 'phone', '{"en":"The :attribute field contains an invalid number.","ru":"Поле :attribute содержит не корректный номер телефона."}', '2021-11-30 10:46:54', '2021-11-30 10:47:05'),
(797, 'validation', 'present', '{"en":"The :attribute field must be present.","ru":"Поле :attribute должно присутствовать."}', '2021-11-30 10:46:54', '2021-11-30 10:47:05'),
(798, 'validation', 'regex', '{"en":"The :attribute format is invalid.","ru":"Поле :attribute имеет ошибочный формат."}', '2021-11-30 10:46:54', '2021-11-30 10:47:05'),
(799, 'validation', 'required', '{"en":"The :attribute field is required.","ru":"Поле :attribute обязательно для заполнения."}', '2021-11-30 10:46:54', '2021-11-30 10:47:05'),
(800, 'validation', 'required_if', '{"en":"The :attribute field is required when :other is :value.","ru":"Поле :attribute обязательно для заполнения, когда :other равно :value."}', '2021-11-30 10:46:55', '2021-11-30 10:47:06'),
(801, 'validation', 'required_unless', '{"en":"The :attribute field is required unless :other is in :values.","ru":"Поле :attribute обязательно для заполнения, когда :other не равно :values."}', '2021-11-30 10:46:55', '2021-11-30 10:47:06'),
(802, 'validation', 'required_with', '{"en":"The :attribute field is required when :values is present.","ru":"Поле :attribute обязательно для заполнения, когда :values указано."}', '2021-11-30 10:46:55', '2021-11-30 10:47:06'),
(803, 'validation', 'required_with_all', '{"en":"The :attribute field is required when :values are present.","ru":"Поле :attribute обязательно для заполнения, когда :values указано."}', '2021-11-30 10:46:55', '2021-11-30 10:47:06'),
(804, 'validation', 'required_without', '{"en":"The :attribute field is required when :values is not present.","ru":"Поле :attribute обязательно для заполнения, когда :values не указано."}', '2021-11-30 10:46:55', '2021-11-30 10:47:06'),
(805, 'validation', 'required_without_all', '{"en":"The :attribute field is required when none of :values are present.","ru":"Поле :attribute обязательно для заполнения, когда ни одно из :values не указано."}', '2021-11-30 10:46:55', '2021-11-30 10:47:06'),
(806, 'validation', 'same', '{"en":"The :attribute and :other must match.","ru":"Значение :attribute должно совпадать с :other."}', '2021-11-30 10:46:55', '2021-11-30 10:47:06'),
(807, 'validation', 'size.numeric', '{"en":"The :attribute must be :size.","ru":"Поле :attribute должно быть равным :size."}', '2021-11-30 10:46:55', '2021-11-30 10:47:06'),
(808, 'validation', 'size.file', '{"en":"The :attribute must be :size kilobytes.","ru":"Размер файла в поле :attribute должен быть равен :size Килобайт(а)."}', '2021-11-30 10:46:55', '2021-11-30 10:47:06'),
(809, 'validation', 'size.string', '{"en":"The :attribute must be :size characters.","ru":"Количество символов в поле :attribute должно быть равным :size."}', '2021-11-30 10:46:55', '2021-11-30 10:47:06'),
(810, 'validation', 'size.array', '{"en":"The :attribute must contain :size items.","ru":"Количество элементов в поле :attribute должно быть равным :size."}', '2021-11-30 10:46:55', '2021-11-30 10:47:06'),
(811, 'validation', 'starts_with', '{"en":"The :attribute must start with one of the following: :values.","ru":"The :attribute must start with one of the following: :values"}', '2021-11-30 10:46:55', '2021-11-30 10:47:06'),
(812, 'validation', 'string', '{"en":"The :attribute must be a string.","ru":"Поле :attribute должно быть строкой."}', '2021-11-30 10:46:55', '2021-11-30 10:47:07'),
(813, 'validation', 'timezone', '{"en":"The :attribute must be a valid zone.","ru":"Поле :attribute должно быть действительным часовым поясом."}', '2021-11-30 10:46:56', '2021-11-30 10:47:07'),
(814, 'validation', 'unique', '{"en":"The :attribute has already been taken.","ru":"Такое значение поля :attribute уже существует."}', '2021-11-30 10:46:56', '2021-11-30 10:47:07'),
(815, 'validation', 'uploaded', '{"en":"The :attribute failed to upload.","ru":"Загрузка поля :attribute не удалась."}', '2021-11-30 10:46:56', '2021-11-30 10:47:07'),
(816, 'validation', 'url', '{"en":"The :attribute format is invalid.","ru":"Поле :attribute имеет ошибочный формат."}', '2021-11-30 10:46:56', '2021-11-30 10:47:07'),
(817, 'validation', 'uuid', '{"en":"The :attribute must be a valid UUID.","ru":"The :attribute must be a valid UUID."}', '2021-11-30 10:46:56', '2021-11-30 10:47:07'),
(818, 'validation', 'custom.attribute-name.rule-name', '{"en":"custom-message","ru":"сообщение"}', '2021-11-30 10:46:56', '2021-11-30 10:47:07'),
(819, 'footer', 'registration', '{"ru":"Регистрация"}', '2021-11-30 10:46:58', '2021-11-30 10:46:58'),
(820, 'footer', 'vacancies', '{"ru":"Вакансии"}', '2021-11-30 10:46:58', '2021-11-30 10:46:58'),
(821, 'footer', 'и', '{"ru":"Блог"}', '2021-11-30 10:46:58', '2021-11-30 10:46:58'),
(822, '*', 'от', '{"en":"from"}', '2021-12-20 14:30:43', '2021-12-20 14:30:43'),
(823, '*', 'года', '{"en":"year"}', '2021-12-20 14:30:43', '2021-12-20 14:30:43'),
(824, '*', 'лет', '{"en":"years"}', '2021-12-20 14:30:44', '2021-12-20 14:30:44'),
(825, '*', 'ч', '{"en":"H"}', '2021-12-20 14:30:44', '2021-12-20 14:30:44'),
(826, '*', 'Hidden', '{"ru":"Скрыт"}', '2021-12-20 14:31:09', '2021-12-20 14:31:09'),
(827, '*', 'Less than 1 year', '{"ru":"Менее 1 года"}', '2021-12-20 14:31:17', '2021-12-20 14:31:17'),
(828, '*', 'PH', '{"ru":"ПС"}', '2021-12-20 14:31:35', '2021-12-20 14:31:35'),
(829, '*', 'Profile Hidden', '{"ru":"Профиль Скрыт"}', '2021-12-20 14:31:35', '2021-12-20 14:31:35'),
(830, '*', 'Please indicate in the purpose of payment the information that is indicated in the invoice (numbers too) or inform the support about payment so that we can immediately check it and confirm th', '{"ru":"Пожалуйста, в назначение платежа указывать информацию, которая указанна в инвойсе (цифры тоже) или сообщите в саппорт об оплате, чтобы мы могли ее сразу проверить и подтвердить платёж"}', '2021-12-20 14:32:07', '2021-12-20 14:32:07'),
(831, 'auth', 'register-candidate', '{"en":"Applicant Registration","ru":"Регистрация Кандидата"}', '2021-12-20 14:32:17', '2021-12-20 14:32:29'),
(832, 'auth', 'register-recruiter', '{"en":"Employer Registration","ru":"Регистрация Работодателя"}', '2021-12-20 14:32:17', '2021-12-20 14:32:29'),
(833, 'candidate', 'hours', '{"en":"H","ru":"ч"}', '2021-12-20 14:32:19', '2021-12-20 14:32:31'),
(834, 'candidate', 'experience-title.without', '{"en":"Without experience","ru":"Без опыта"}', '2021-12-20 14:32:19', '2021-12-20 14:32:31'),
(835, 'candidate', 'experience-title.less-a-year', '{"en":"Less a year","ru":"Менее года"}', '2021-12-20 14:32:19', '2021-12-20 14:32:31'),
(836, 'candidate', 'experience-title.less-1-year', '{"en":"Less 1 year","ru":"Менее 1 года"}', '2021-12-20 14:32:19', '2021-12-20 14:32:31'),
(837, 'candidate', 'experience-title.7years-p', '{"en":"7 years+","ru":"7 лет+"}', '2021-12-20 14:32:19', '2021-12-20 14:32:31'),
(838, 'candidate', 'experience-title.10years-p', '{"en":"10 years+","ru":"10 лет+"}', '2021-12-20 14:32:19', '2021-12-20 14:32:31'),
(839, '*', 'Please indicate in the purpose of payment the information that is indicated in the invoice (numbers too) or inform the support about payment so that we can immediately check it and confirm th', '{"ru":"Пожалуйста, в назначение платежа указывать информацию, которая указанна в инвойсе (цифры тоже) или сообщите в саппорт об оплате, чтобы мы могли ее сразу проверить и подтвердить платёж"}', '2021-12-20 14:34:44', '2021-12-20 14:34:44'),
(840, '*', 'Please indicate in the purpose of payment the information that is indicated in the invoice (numbers too) or inform the support about payment so that we can immediately check it and confirm th', '{"ru":"Пожалуйста, в назначение платежа указывать информацию, которая указанна в инвойсе (цифры тоже) или сообщите в саппорт об оплате, чтобы мы могли ее сразу проверить и подтвердить платёж"}', '2021-12-29 11:32:14', '2021-12-29 11:32:14'),
(841, 'candidate', 'position-note', '{"en":"Indicate the position for which you are applying in English. For example: Senior QA Automation Engineer","ru":"Указывайте должность на которую претендуете на английском. Например: Senior QA Automation Engineer"}', '2021-12-29 11:32:23', '2021-12-29 11:32:34'),
(842, '*', 'Please indicate in the purpose of payment the information that is indicated in the invoice (numbers too) or inform the support about payment so that we can immediately check it and confirm th', '{"ru":"Пожалуйста, в назначение платежа указывать информацию, которая указанна в инвойсе (цифры тоже) или сообщите в саппорт об оплате, чтобы мы могли ее сразу проверить и подтвердить платёж"}', '2021-12-29 13:07:03', '2021-12-29 13:07:03'),
(843, '*', 'Please indicate in the purpose of payment the information that is indicated in the invoice (numbers too) or inform the support about payment so that we can immediately check it and confirm th', '{"ru":"Пожалуйста, в назначение платежа указывать информацию, которая указанна в инвойсе (цифры тоже) или сообщите в саппорт об оплате, чтобы мы могли ее сразу проверить и подтвердить платёж"}', '2021-12-29 13:10:21', '2021-12-29 13:10:21'),
(844, '*', 'Please indicate in the purpose of payment the information that is indicated in the invoice (numbers too) or inform the support about payment so that we can immediately check it and confirm th', '{"ru":"Пожалуйста, в назначение платежа указывать информацию, которая указанна в инвойсе (цифры тоже) или сообщите в саппорт об оплате, чтобы мы могли ее сразу проверить и подтвердить платёж"}', '2021-12-29 15:29:09', '2021-12-29 15:29:09'),
(845, 'header', 'menu.settings', '{"en":"Settings","ru":"Настройки"}', '2021-12-29 15:29:20', '2021-12-29 15:29:32'),
(846, 'header', 'menu.my-profile', '{"en":"My Profile","ru":"Мой профиль"}', '2021-12-29 15:29:20', '2021-12-29 15:29:32'),
(847, 'header', 'menu.my-contacts', '{"en":"My Contacts","ru":"Мои контакты"}', '2021-12-29 15:29:20', '2021-12-29 15:29:32'),
(848, 'header', 'menu.team', '{"en":"Team","ru":"Команда"}', '2021-12-29 15:29:20', '2021-12-29 15:29:32'),
(849, 'header', 'menu.payment', '{"en":"Payment","ru":"Оплата"}', '2021-12-29 15:29:20', '2021-12-29 15:29:32'),
(850, 'header', 'my-vacancies', '{"en":"My vacancies","ru":"Мои вакансии"}', '2021-12-29 15:29:20', '2021-12-29 15:29:33'),
(851, 'header', 'create-vacancy', '{"en":"Create vacancy","ru":"Создать вакансию"}', '2021-12-29 15:29:20', '2021-12-29 15:29:33'),
(852, 'header', 'profile-moderation', '{"en":"Profile on moderation","ru":"Профиль на модерации"}', '2021-12-29 15:29:21', '2021-12-29 15:29:33'),
(853, 'header', 'profile-blocked', '{"en":"Profile is blocked","ru":"Профиль заблокирован"}', '2021-12-29 15:29:21', '2021-12-29 15:29:33'),
(854, 'header', 'profile-not-active', '{"en":"Profile is not active","ru":"Профиль не активен"}', '2021-12-29 15:29:21', '2021-12-29 15:29:33'),
(855, 'header', 'sign-in', '{"en":"Sign in","ru":"Войти"}', '2021-12-29 15:29:21', '2021-12-29 15:29:33'),
(856, 'header', 'logout', '{"en":"Logout","ru":"Выход"}', '2021-12-29 15:29:21', '2021-12-29 15:29:33'),
(857, '*', 'Please indicate in the purpose of payment the information that is indicated in the invoice (numbers too) or inform the support about payment so that we can immediately check it and confirm th', '{"ru":"Пожалуйста, в назначение платежа указывать информацию, которая указанна в инвойсе (цифры тоже) или сообщите в саппорт об оплате, чтобы мы могли ее сразу проверить и подтвердить платёж"}', '2021-12-29 15:38:35', '2021-12-29 15:38:35');

-- 
-- Вывод данных для таблицы jobs
--
-- Таблица jobzzz.jobs не содержит данных

-- 
-- Вывод данных для таблицы html_blocks
--
INSERT INTO html_blocks VALUES
(1, 'Баннер на главной', 'ЗАГОЛОВОК БАННЕРА<br> БУДЕТ ТУТ', 'BANNER HEADER<br>WILL BE HERE', '', '', NULL, 'home_banner', 'home_banner', '2021-10-07 12:01:52', '2021-10-07 12:01:52'),
(2, 'Вступление на главной', '<span>О платформе</span>', '<span>About the platform</span>', '<p>Jobzz.ru - это портал для анонимного поиска работы в IT сфере.</p>\r\n<p>Вы можете вести как активный поиск (вы откликаетесь на размещенные вакансии), так и пассивный (вы публикуете свой профиль и получаете предложения от работодателей).</p>\r\n<p>Если вы опубликуете свой профиль, рекрутеры будут видеть только ваши проф навыки, все ваши контактные данные, резюме и фотография будут скрыты. Вы сами выбираете кому открыть свои контакты и с кем продолжить общение. Ни один рекрутер, без вашего согласия, не сможет узнать ваш номер мобильного, почту или имя. Таким образом поиск работы будет удобным и анонимным.</p>', '<p>Jobzz.ru is a portal for anonymous job search in the IT field.</p>\r\n<p>You can conduct an active search (you respond to posted vacancies) or passive (you publish your profile and receive offers from employers).</p>\r\n<p>If you publish your profile, recruiters will only see your professional skills, all your contact details, resume and photo will be hidden. You yourself choose who to open your contacts and with whom to continue communication. No recruiter, without your consent, will be able to find out your mobile number, mail or name. Thus, job search will be convenient and anonymous.</p>', NULL, 'introduction', 'introduction', '2021-10-07 12:01:52', '2021-12-20 09:07:26'),
(3, 'Как это работает, кандидат, регистрация', 'Регистрация<br> на jobzz.ru', 'Registration<br> on jobzz.ru', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt', 'http://jobzz.loc/images/rezume.png', 'candidate_registration', 'process', '2021-10-07 12:01:52', '2021-10-07 12:01:52'),
(4, 'Как это работает, кандидат, публикация', 'Публикация<br>вашего профиля', 'Publishing<br>your profile', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt', 'http://jobzz.loc/images/head.png', 'candidate_publishing', 'process', '2021-10-07 12:01:52', '2021-10-07 12:01:52'),
(5, 'Как это работает, кандидат, предложение', 'Предложения<br>о работе', 'Job<br>offers', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt', 'http://jobzz.loc/images/comp.png', 'candidate_offers', 'process', '2021-10-07 12:01:52', '2021-10-07 12:01:52'),
(6, 'Как это работает, кандидат, работа', 'Ваша<br>новая работа', 'Your<br>new job', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt', 'http://jobzz.loc/images/hand.png', 'candidate_job', 'process', '2021-10-07 12:01:52', '2021-10-07 12:01:52'),
(7, 'Как это работает, рекрутер, регистрация', 'Регистрация<br> на jobzz.ru', 'Registration<br> on jobzz.ru', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt', 'http://jobzz.loc/images/rezume.png', 'recruiter_registration', 'process', '2021-10-07 12:01:52', '2021-10-07 12:01:52'),
(8, 'Как это работает, рекрутер, вакансия', 'Размещение<br>вакансии', 'Posting<br>vacancies', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt', 'http://jobzz.loc/images/comp.png', 'recruiter_vacancy', 'process', '2021-10-07 12:01:52', '2021-10-07 12:01:52'),
(9, 'Как это работает, рекрутер, поиск', 'Поиск<br>кандидатов', 'Search<br>for candidates', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt', 'http://jobzz.loc/images/head.png', 'recruiter_search', 'process', '2021-10-07 12:01:52', '2021-10-07 12:01:52'),
(10, 'Как это работает, рекрутер, работа', 'Наем<br>сотрудника', 'Hiring<br>n employee', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt', 'http://jobzz.loc/images/hand.png', 'recruiter_offer', 'process', '2021-10-07 12:01:52', '2021-10-07 12:01:52'),
(11, 'Блок о сотрудничестве', 'Готовы<br>сотрудничать?', 'Are you ready<br> to cooperate?', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et\r\n        dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et\r\n        dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip', NULL, 'cooperation_text', 'cooperation', '2021-10-07 12:01:52', '2021-10-07 12:01:52'),
(12, 'Текст в футере', '', '', 'Jobzz.ru - портал для анонимного поиска работы в IT сфере', 'Jobzz.ru - a portal for anonymous job search in the IT field', NULL, 'footer_text', 'footer', '2021-10-07 12:01:52', '2021-10-07 12:01:52'),
(13, 'Удаление аккаунта', 'Вы уверены, что хотите удалить свою учетную запись?', 'Are you sure you want to delete your account?', 'После удаления, аккаунт невозможно будет восстановить. При удалении этого аккаунта вы сможете создать абсолютно новый аккаунт даже с той же самой почтой. Работодатели, с которыми вы общались ранее, об этом не узнают и ваши контакты будут для них снова скрыты = поиск на Jobzz с чистого листа :)', 'Once deleted, the account cannot be restored. By deleting this account, you will be able to create a completely new account even with the same mail. Employers with whom you spoke earlier will not be aware of this and your contacts will be hidden for them again = search on Jobzz from scratch :)', NULL, 'account_delete', 'footer', '2021-10-07 12:01:52', '2021-10-07 12:01:52'),
(14, 'Маркетинговый слоган про компанию', 'Маркетинговый слоган про компанию', 'Marketing slogan about the company', NULL, NULL, NULL, 'marketing-slogan', 'footer', '2021-10-07 12:01:52', '2021-10-07 12:01:52');

-- 
-- Вывод данных для таблицы failed_jobs
--
-- Таблица jobzzz.failed_jobs не содержит данных

-- 
-- Вывод данных для таблицы experiences
--
INSERT INTO experiences VALUES
(1, 'Без опыта', 'Without experience', 'without-experience', '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(2, 'от 1 года', 'from 1 year', 'from-1-year', '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(3, 'от 2 лет', 'from 2 years', 'from-2-years', '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(4, 'от 3 лет', 'from 3 years', 'from-3-years', '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(5, 'от 4 лет', 'from 4 years', 'from-4-years', '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(6, '5 лет и более', '5 years or more', '5-years-or-more', '2021-08-31 14:14:52', '2021-08-31 14:14:52');

-- 
-- Вывод данных для таблицы english_levels
--
INSERT INTO english_levels VALUES
(1, 'Beginner/Elementary (A1)', 'Начальные/Базовые знания Английского языка', 'Basic knowledge of the English language', 'a1', '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(2, 'Pre-Intermediate (A2)', 'Могу читать техническую документацию и вести переписку на английском языке', 'You can read technical documentation and correspond in English', 'a2', '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(3, 'Intermediate (B1)', 'Могу вести диалог на английском языке, но простыми фразами и с ошибками. Могу проходить интервью на английском', 'You can conduct a dialogue in English, but with simple phrases and with mistakes. I can be interviewed in English', 'b1', '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(4, 'Upper-intermediate (B2)', 'Могу активно участвовать в митингах, уверенно проходить интервью на английском и поддержать диалог практически на любую тему, но все же допускаю ошибки', 'You can actively participate in rallies, confidently pass interviews in English and maintain a dialogue on almost any topic, but I still make mistakes', 'b2', '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(5, 'Advanced (C1)', 'Вы бегло говорите на английском и полностью понимаете речь на слух, для вас не составит труда пройти интервью на английском с носителем и вы легко можете поддержать диалог на любую тему', 'You are fluent in English and fully understand the speech by ear, it will not be difficult for you to go through an interview in English with a native speaker and you can easily maintain a dialogue on any topic', 'c1', '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(6, 'Fluent (C2)', 'Вы владеете английским на уровне носителя языка', 'You speak English like a native speaker', 'c2', '2021-08-31 14:14:52', '2021-08-31 14:14:52');

-- 
-- Вывод данных для таблицы currencies
--
INSERT INTO currencies VALUES
(1, 'руб.', 'rub.', 'Российский рубль', 'Russian ruble', '₽', 'RUB', 1.000000, 'rub', '2021-08-31 14:14:52', '2021-08-31 14:14:52'),
(2, 'дол.', 'dollars', 'Доллар США', 'U.S. dollar', '$', 'USD', 0.013726, 'usd', '2021-08-31 14:14:52', '2021-09-16 08:11:12'),
(3, 'евро', 'euro', 'Евро', 'Euro', '€', 'EUR', 0.011619, 'eur', '2021-08-31 14:14:52', '2021-09-16 08:11:12');

-- 
-- Вывод данных для таблицы company_users
--
INSERT INTO company_users VALUES
(53, 1, 1, 1, NULL, NULL),
(54, 2, 1, 1, NULL, NULL),
(55, 3, 1, 1, NULL, '2021-10-21 08:52:55'),
(56, 4, 1, 1, NULL, NULL),
(57, 5, 1, 1, NULL, NULL),
(58, 6, 1, 1, NULL, NULL),
(59, 7, 1, 1, NULL, NULL),
(60, 8, 1, 1, NULL, NULL),
(61, 9, 1, 1, NULL, NULL),
(62, 10, 1, 1, NULL, NULL),
(69, 11, 1, 1, NULL, '2021-10-09 10:23:05'),
(76, 12, 1, 1, NULL, '2022-01-27 16:26:18'),
(81, 13, 1, 1, NULL, '2022-02-22 10:59:33');

-- 
-- Вывод данных для таблицы chat_messages
--
INSERT INTO chat_messages VALUES
(1, 'message', 8, 2, '<p>Добрый день!</p>\r\n\r\n', NULL, 1, 0, 0, '2021-08-27 08:51:58', '2021-08-27 08:52:24'),
(2, 'offer', 8, 30, '<p>Добрый день!<br />\nНам интересен Ваш профиль и мы хотим предложить Вам на рассмотрение нашу вакансию. Будем рады ознакомиться с Вашим резюме)</p>\r\n\r\n', NULL, 0, 0, 0, '2021-08-27 08:56:44', '2021-08-27 08:56:44'),
(9, 'hiring', 8, 30, '<div class="fs-italic text-muted mb-10" >\n<span class="text-success">Сообщил(а) о найме</span>,\nдата выхода на работу <b class="text-black">30.09.2021</b>\n</div>', NULL, 0, 0, 0, '2021-08-27 12:51:11', '2021-08-27 12:51:11'),
(10, 'message', 2, 8, '<p><div>Здравствуйте, Test Recruiter</div><div>26.08.2021 истекает срок оплаты за кандидата Fron-end</div><div>В случае не уплаты ваш аккаунт будет заблокирован</div></p>\r\n\r\n', NULL, 1, 0, 0, '2021-08-27 16:51:36', '2021-08-27 16:52:14'),
(11, 'message', 2, 8, '<p><div>Здравствуйте, Test Recruiter</div><div>26.08.2021 истек срок оплаты за кандидата Fron-end</div><div>Ваш аккаунт был заблокирован.</div><div>Пожалуйста совершите оплату и ваш аккаунт будет разблокирован автоматически.</div><div>Если ваш аккаунт был заблокирован по ошибке, обратитесь в поддержку.</div></p>\r\n\r\n', NULL, 1, 0, 0, '2021-08-27 16:51:56', '2021-08-27 16:52:14'),
(12, 'offer', 4, 8, '<p>Добрый день! Test Recruiter<br />\nМне интересна ваша вакансия Android Developer<br />\nhttp://jobzz.loc/vacancies/android-developer<br />\n<br />\nОткрываю свои контакты и резюме<br />\n<br />\nС нетерпением буду ждать вашего ответа)<br />\n<br />\n--------------------------------------------<br />\nС уважением Vadim Krachulov<br />\nvadox.dev@gmail.com</p>\r\n\r\n<div>\r\n    <a class=''attachment'' href=''http://jobzz.loc/messenger/download/e3264ab0-3fd3-4c90-aeed-17e76d011640.docx'' target=''_blank''>TestResume.docx</a>\r\n</div>\r\n', '{"file_name":"e3264ab0-3fd3-4c90-aeed-17e76d011640.docx","title":"TestResume.docx"}', 1, 0, 0, '2021-08-30 10:57:05', '2021-08-30 10:57:35'),
(13, 'message', 8, 4, '<p>Добрый день!</p>\r\n\r\n', NULL, 1, 0, 0, '2021-08-30 14:30:21', '2021-08-30 16:01:49'),
(14, 'message', 8, 4, '<p>Я хочу предложить вам вот это:<br />\nhttp://jobzz.loc/vacancies/android-developer</p>\r\n\r\n', NULL, 1, 0, 0, '2021-08-30 15:41:51', '2021-08-30 16:01:49'),
(15, 'message', 8, 4, '<p>Очень быстрое сообщение</p>\r\n\r\n', NULL, 1, 0, 0, '2021-08-30 15:42:19', '2021-08-30 16:01:49'),
(16, 'message', 4, 8, '<p>Нет, мне это не подходит</p>\r\n\r\n', NULL, 0, 0, 0, '2021-08-30 16:06:56', '2021-08-30 16:06:56'),
(17, 'message', 55, 2, '<p>Test</p>\r\n\r\n', NULL, 1, 0, 0, '2021-08-31 14:57:46', '2021-08-31 15:16:19'),
(18, 'message', 55, 2, '<p>Test</p>\r\n\r\n', NULL, 1, 0, 0, '2021-08-31 14:57:49', '2021-08-31 15:16:19'),
(19, 'message', 55, 2, '<p>Test</p>\r\n\r\n', NULL, 1, 0, 0, '2021-08-31 14:57:51', '2021-08-31 15:16:19'),
(20, 'message', 55, 2, '<p>Test</p>\r\n\r\n', NULL, 1, 0, 0, '2021-08-31 14:57:55', '2021-08-31 15:16:19'),
(21, 'message', 55, 2, '<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>\r\n\r\n', NULL, 1, 0, 0, '2021-08-31 14:58:09', '2021-08-31 15:16:19'),
(22, 'message', 2, 55, '<p>dsfasdfasfsaf</p>\r\n\r\n', NULL, 1, 0, 0, '2021-08-31 15:16:24', '2021-09-15 16:35:14'),
(23, 'message', 2, 55, '<p>asdfasdfas</p>\r\n\r\n', NULL, 1, 0, 0, '2021-08-31 15:16:26', '2021-09-15 16:35:14'),
(29, 'offer', 55, 32, '<p>Добрый день!<br />\nНам интересен Ваш профиль и мы хотим предложить Вам на рассмотрение нашу вакансию. Будем рады ознакомиться с Вашим резюме)</p>\r\n\r\n', NULL, 0, 0, 0, '2021-09-16 09:04:00', '2021-09-16 09:04:00'),
(30, 'hiring', 55, 32, '<div class="fs-italic text-muted mb-10" >\n<span class="text-success">Сообщил(а) о найме</span>,\nдата выхода на работу <b class="text-black">30.09.2021</b>\n</div>', NULL, 0, 0, 0, '2021-09-16 09:04:53', '2021-09-16 09:04:53'),
(34, 'offer', 64, 55, '<p>Добрый день! Дина Шубина<br />\nМне интересна ваша вакансия Sales Manager<br />\n<a href="http://jobzz.loc/vacancies/15-sales-manager<br" target="_blank">http://jobzz.loc/vacancies/15-sales-manager<br</a> />\n<br />\nОткрываю свои контакты и резюме<br />\n<br />\nС нетерпением буду ждать вашего ответа)<br />\n<a href="http://www.zueva.ru/quaerat-perspiciatis-aut-recusandae-eveniet.html<br" target="_blank">http://www.zueva.ru/quaerat-perspiciatis-aut-recusandae-eveniet.html<br</a> />\n--------------------------------------------<br />\nС уважением Test Payment<br />\n<a href="mailto:candidate1@gmail.com" target="_blank">candidate1@gmail.com</a></p>\r\n\r\n    <div>\r\n        <a class=''attachment''\r\n           href=''http://jobzz.loc/messenger/download/e5cb199f-9f41-4cee-8f80-fdd027558a79.docx?name=TestResume.docx''\r\n           target=''_blank''>TestResume.docx</a>\r\n    </div>\r\n', '{"file_name":"e5cb199f-9f41-4cee-8f80-fdd027558a79.docx","title":"TestResume.docx"}', 1, 0, 0, '2021-09-16 11:32:35', '2021-09-16 11:33:05'),
(35, 'offer', 64, 55, '<p>Добрый день! Дина Шубина<br />\nМне интересна ваша вакансия Sales Manager<br />\nhttp://jobzz.loc/vacancies/15-sales-manager<br />\n<br />\nОткрываю свои контакты и резюме<br />\n<br />\nС нетерпением буду ждать вашего ответа)<br />\nhttp://www.zueva.ru/quaerat-perspiciatis-aut-recusandae-eveniet.html<br />\n--------------------------------------------<br />\nС уважением Test Payment<br />\ncandidate1@gmail.com</p>\r\n\r\n    <div>\r\n        <a class=''attachment''\r\n           href=''http://jobzz.loc/messenger/download/728d53b6-f2c9-4411-9de0-f2804be1a171.docx?name=TestResume.docx''\r\n           target=''_blank''>TestResume.docx</a>\r\n    </div>\r\n', '{"file_name":"728d53b6-f2c9-4411-9de0-f2804be1a171.docx","title":"TestResume.docx"}', 1, 0, 0, '2021-09-16 11:37:22', '2021-09-16 11:37:37'),
(36, 'offer', 64, 55, '<p>Добрый день! Дина Шубина<br />\nМне интересна ваша вакансия Sales Manager<br />\n<a href="http://jobzz.loc/vacancies/15-sales-manager<br" target="_blank">http://jobzz.loc/vacancies/15-sales-manager<br</a> />\n<br />\nОткрываю свои контакты и резюме<br />\n<br />\nС нетерпением буду ждать вашего ответа)<br />\n<a href="http://www.zueva.ru/quaerat-perspiciatis-aut-recusandae-eveniet.html<br" target="_blank">http://www.zueva.ru/quaerat-perspiciatis-aut-recusandae-eveniet.html<br</a> />\n--------------------------------------------<br />\nС уважением Test Payment<br />\n<a href="mailto:candidate1@gmail.com" target="_blank">candidate1@gmail.com</a></p>\r\n\r\n    <div>\r\n        <a class=''attachment''\r\n           href=''http://jobzz.loc/messenger/download/0ad92431-65eb-46f2-9ba4-04b29d62b79f.docx?name=TestResume.docx''\r\n           target=''_blank''>TestResume.docx</a>\r\n    </div>\r\n', '{"file_name":"0ad92431-65eb-46f2-9ba4-04b29d62b79f.docx","title":"TestResume.docx"}', 1, 0, 0, '2021-09-16 11:39:10', '2021-09-16 11:41:50'),
(37, 'offer', 64, 55, '<p>Добрый день! Дина Шубина<br />\nМне интересна ваша вакансия Sales Manager<br />\n&lt;a href=&quot;http://jobzz.loc/vacancies/15-sales-manager&quot; target=&quot;_blank&quot;&gt;http://jobzz.loc/vacancies/15-sales-manager&lt;/a&gt;<br />\n<br />\nОткрываю свои контакты и резюме<br />\n<br />\nС нетерпением буду ждать вашего ответа)<br />\n&lt;a href=&quot;http://www.zueva.ru/quaerat-perspiciatis-aut-recusandae-eveniet.html&quot; target=&quot;_blank&quot;&gt;http://www.zueva.ru/quaerat-perspiciatis-aut-recusandae-eveniet.html&lt;/a&gt;<br />\n--------------------------------------------<br />\nС уважением Test Payment<br />\n&lt;a href=&quot;mailto:candidate1@gmail.com&quot; target=&quot;_blank&quot;&gt;candidate1@gmail.com&lt;/a&gt;</p>\r\n\r\n    <div>\r\n        <a class=''attachment''\r\n           href=''http://jobzz.loc/messenger/download/4038e906-375f-4e6d-8ee4-c1aac818257d.docx?name=TestResume.docx''\r\n           target=''_blank''>TestResume.docx</a>\r\n    </div>\r\n', '{"file_name":"4038e906-375f-4e6d-8ee4-c1aac818257d.docx","title":"TestResume.docx"}', 1, 0, 0, '2021-09-16 11:40:40', '2021-09-16 11:41:50'),
(38, 'offer', 64, 55, '<p>Добрый день! Дина Шубина<br />\nМне интересна ваша вакансия Sales Manager<br />\n<a href="http://jobzz.loc/vacancies/15-sales-manager" target="_blank">http://jobzz.loc/vacancies/15-sales-manager</a><br />\n<br />\nОткрываю свои контакты и резюме<br />\n<br />\nС нетерпением буду ждать вашего ответа)<br />\n<a href="http://www.zueva.ru/quaerat-perspiciatis-aut-recusandae-eveniet.html" target="_blank">http://www.zueva.ru/quaerat-perspiciatis-aut-recusandae-eveniet.html</a><br />\n--------------------------------------------<br />\nС уважением Test Payment<br />\n<a href="mailto:candidate1@gmail.com" target="_blank">candidate1@gmail.com</a></p>\r\n\r\n    <div>\r\n        <a class=''attachment''\r\n           href=''http://jobzz.loc/messenger/download/fb5e1111-bf5c-4cbc-8867-d9acc28fc6f5.docx?name=TestResume.docx''\r\n           target=''_blank''>TestResume.docx</a>\r\n    </div>\r\n', '{"file_name":"fb5e1111-bf5c-4cbc-8867-d9acc28fc6f5.docx","title":"TestResume.docx"}', 1, 0, 0, '2021-09-16 11:41:28', '2021-09-16 11:41:50'),
(39, 'message', 64, 55, '<p>test</p>\r\n\r\n', NULL, 1, 0, 0, '2021-09-16 16:19:41', '2021-09-16 17:18:22'),
(40, 'message', 64, 55, '<p>sdfsdf</p>\r\n\r\n', NULL, 1, 0, 0, '2021-09-16 16:21:39', '2021-09-16 17:18:22'),
(41, 'message', 64, 55, '<p>sdfs</p>\r\n\r\n', NULL, 1, 0, 0, '2021-09-16 16:26:09', '2021-09-16 17:18:22'),
(42, 'message', 64, 55, '<p>test</p>\r\n\r\n', NULL, 1, 0, 0, '2021-09-16 16:28:09', '2021-09-16 17:18:22'),
(43, 'message', 64, 55, '<p>sdf</p>\r\n\r\n', NULL, 1, 0, 0, '2021-09-16 16:30:00', '2021-09-16 17:18:22'),
(44, 'message', 64, 55, '<p>tesdfd</p>\r\n\r\n', NULL, 1, 0, 0, '2021-09-16 16:32:03', '2021-09-16 17:18:22'),
(45, 'message', 64, 55, '<p>test</p>\r\n\r\n', NULL, 1, 0, 0, '2021-09-16 16:35:22', '2021-09-16 17:18:22'),
(46, 'message', 64, 55, '<p>test</p>\r\n\r\n', NULL, 1, 0, 0, '2021-09-16 16:37:37', '2021-09-16 17:18:22'),
(47, 'message', 64, 55, '<p>test</p>\r\n\r\n', NULL, 1, 0, 0, '2021-09-16 17:17:35', '2021-09-16 17:18:22'),
(48, 'message', 64, 55, '<p>afdfdafdsf<br />\nsffdsffd<br />\nsdfdsf</p>\r\n\r\n', NULL, 1, 0, 0, '2021-09-16 17:21:41', '2021-09-16 17:21:53'),
(49, 'message', 64, 55, '<p>sfd<br />\ndfsfsdf<br />\nsdfdsfsdf</p>\r\n\r\n', NULL, 1, 0, 0, '2021-09-16 17:34:14', '2021-09-17 13:32:58'),
(50, 'message', 64, 55, '<p>sdfsdfsd<br />\nsdffsdsdf<br />\nsdfsdfsdf</p>\r\n\r\n', NULL, 1, 0, 0, '2021-09-16 17:34:43', '2021-09-17 13:32:58'),
(51, 'message', 64, 55, '<p>adfdsfasdf<br />\nsdfsdfsdfsdf<br />\nsdfsdfsd</p>\r\n\r\n', NULL, 1, 0, 0, '2021-09-16 17:39:52', '2021-09-17 13:32:58'),
(52, 'message', 64, 55, '<p>test</p>\r\n\r\n', NULL, 1, 0, 0, '2021-09-17 09:21:14', '2021-09-17 13:32:58'),
(53, 'message', 64, 55, '<p>test</p>\r\n\r\n', NULL, 1, 0, 0, '2021-09-17 09:21:15', '2021-09-17 13:32:58'),
(54, 'message', 64, 55, '<p>test</p>\r\n\r\n', NULL, 1, 0, 0, '2021-09-17 09:21:17', '2021-09-17 13:32:58'),
(56, 'offer', 64, 55, '<p>Добрый день! Дина Шубина<br />\nМне интересна ваша вакансия Sales Manager<br />\n<a href="http://jobzz.loc/vacancies/15-sales-manager" target="_blank">http://jobzz.loc/vacancies/15-sales-manager</a><br />\n<br />\nОткрываю свои контакты и резюме<br />\n<br />\nС нетерпением буду ждать вашего ответа)<br />\n<br />\n--------------------------------------------<br />\nС уважением Test Payment<br />\n<a href="mailto:candidate1@gmail.com" target="_blank">candidate1@gmail.com</a></p>\r\n\r\n    <div>\r\n        <a class=''attachment''\r\n           href=''http://jobzz.loc/messenger/download/c1e751e5-7635-4274-bd52-0e616c9b82e3.docx?name=TestResume.docx''\r\n           target=''_blank''>TestResume.docx</a>\r\n    </div>\r\n', '{"file_name":"c1e751e5-7635-4274-bd52-0e616c9b82e3.docx","title":"TestResume.docx"}', 1, 0, 0, '2021-09-17 10:54:31', '2021-09-17 13:32:58'),
(57, 'message', 55, 64, '<p>ok</p>\r\n\r\n', NULL, 1, 0, 0, '2021-09-17 13:44:25', '2021-09-17 16:30:15'),
(58, 'message', 55, 64, '<p>Добрый день! Дина Шубина Мне интересна ваша вакансия Sales Manager Открываю свои контакты и резюме С нетерпением буду ждать вашего ответа)</p>\r\n\r\n', NULL, 1, 0, 0, '2021-09-17 14:50:12', '2021-09-17 16:30:15'),
(59, 'message', 55, 64, '<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>\r\n\r\n', NULL, 1, 0, 0, '2021-09-17 14:50:52', '2021-09-17 16:30:15'),
(60, 'message', 64, 55, '<p>fsfsdfsdf</p>\r\n\r\n', NULL, 1, 0, 0, '2021-09-17 16:30:18', '2021-09-17 16:40:19'),
(61, 'message', 64, 55, '<p>sdfsdfsdf</p>\r\n\r\n', NULL, 1, 0, 0, '2021-09-17 16:30:19', '2021-09-17 16:40:19'),
(62, 'message', 64, 55, '<p>sdfsdfsdf</p>\r\n\r\n', NULL, 1, 0, 0, '2021-09-17 16:30:21', '2021-09-17 16:40:19'),
(63, 'message', 64, 55, '<p>sdfsdfsdf</p>\r\n\r\n', NULL, 1, 0, 0, '2021-09-17 16:30:22', '2021-09-17 16:40:19'),
(64, 'message', 64, 55, '<p>sdfadsfa</p>\r\n\r\n', NULL, 1, 0, 0, '2021-09-17 16:32:38', '2021-09-17 16:40:19'),
(65, 'message', 64, 55, '<p>adfadfadsf</p>\r\n\r\n', NULL, 1, 0, 0, '2021-09-17 16:32:40', '2021-09-17 16:40:19'),
(66, 'message', 64, 55, '<p>adfafafad</p>\r\n\r\n', NULL, 1, 0, 0, '2021-09-17 16:32:41', '2021-09-17 16:40:19'),
(68, 'offer', 64, 55, '<p>Добрый день! Дина Шубина<br />\nМне интересна ваша вакансия UI/UX/Design Manager<br />\n<a href="http://jobzz.loc/vacancies/11-uiuxdesign-manager" target="_blank">http://jobzz.loc/vacancies/11-uiuxdesign-manager</a><br />\n<br />\nОткрываю свои контакты и резюме<br />\n<br />\nС нетерпением буду ждать вашего ответа)<br />\n<br />\n--------------------------------------------<br />\nС уважением Test Payment<br />\n<a href="mailto:candidate1@gmail.com" target="_blank">candidate1@gmail.com</a></p>\r\n\r\n    <div>\r\n        <a class=''attachment''\r\n           href=''http://jobzz.loc/messenger/download/672fd657-43e6-427f-809c-188d7f9a596b.docx?name=TestResume.docx''\r\n           target=''_blank''>TestResume.docx</a>\r\n    </div>\r\n', '{"file_name":"672fd657-43e6-427f-809c-188d7f9a596b.docx","title":"TestResume.docx"}', 1, 0, 0, '2021-09-17 16:59:25', '2021-09-17 16:59:48'),
(69, 'offer', 64, 55, '<p>Добрый день! Дина Шубина<br />\nМне интересна ваша вакансия Other Manager<br />\n<a href="http://jobzz.loc/vacancies/12-other-manager" target="_blank">http://jobzz.loc/vacancies/12-other-manager</a><br />\n<br />\nОткрываю свои контакты и резюме<br />\n<br />\nС нетерпением буду ждать вашего ответа)<br />\n<br />\n--------------------------------------------<br />\nС уважением Test Payment<br />\n<a href="mailto:candidate1@gmail.com" target="_blank">candidate1@gmail.com</a></p>\r\n\r\n    <div>\r\n        <a class=''attachment''\r\n           href=''http://jobzz.loc/messenger/download/842b1020-2a3f-4bb5-8c3e-79f7e264ff0e.docx?name=%D0%9D%D0%B5%20%D0%B3%D1%80%D0%BE%D0%B7%D0%B8%20%D0%AE%D0%B6%D0%BD%D0%BE%D0%BC%D1%83%20%D1%86%D0%B5%D0%BD%D1%82%D1%80%D0%B0%D0%BB%D1%83%20%D0%BF%D0%BE%D0%BF%D0%B8%D0%B2%D0%B0%D1%8F%20%D1%81%D0%BE%D0%BA%20%D1%83%20%D1%81%D0%B5%D0%B1%D1%8F%20%D0%B2%20%D0%BA%D0%B2%D0%B0%D1%80%D1%82%D0%B0%D0%BB%D0%B5.docx''\r\n           target=''_blank''>Не грози Южному централу попивая сок у себя в квартале.docx</a>\r\n    </div>\r\n', '{"file_name":"842b1020-2a3f-4bb5-8c3e-79f7e264ff0e.docx","title":"\\u041d\\u0435 \\u0433\\u0440\\u043e\\u0437\\u0438 \\u042e\\u0436\\u043d\\u043e\\u043c\\u0443 \\u0446\\u0435\\u043d\\u0442\\u0440\\u0430\\u043b\\u0443 \\u043f\\u043e\\u043f\\u0438\\u0432\\u0430\\u044f \\u0441\\u043e\\u043a \\u0443 \\u0441\\u0435\\u0431\\u044f \\u0432 \\u043a\\u0432\\u0430\\u0440\\u0442\\u0430\\u043b\\u0435.docx"}', 1, 0, 0, '2021-09-17 17:09:20', '2021-09-17 17:12:56'),
(70, 'offer', 64, 55, '<p>Добрый день! Дина Шубина<br />\nМне интересна ваша вакансия Other Manager<br />\n<a href="http://jobzz.loc/vacancies/12-other-manager" target="_blank">http://jobzz.loc/vacancies/12-other-manager</a><br />\n<br />\nОткрываю свои контакты и резюме<br />\n<br />\nС нетерпением буду ждать вашего ответа)<br />\n<br />\n--------------------------------------------<br />\nС уважением Test Payment<br />\n<a href="mailto:candidate1@gmail.com" target="_blank">candidate1@gmail.com</a></p>\r\n\r\n    <div>\r\n        <a class=''attachment''\r\n           href=''http://jobzz.loc/messenger/download/4837b09a-343b-4bbb-a89b-16128f39b4ae.docx?name=TestResume.docx''\r\n           target=''_blank''>TestResume.docx</a>\r\n    </div>\r\n', '{"file_name":"4837b09a-343b-4bbb-a89b-16128f39b4ae.docx","title":"TestResume.docx"}', 1, 0, 0, '2021-09-17 17:12:49', '2021-09-17 17:12:56'),
(71, 'profile', 64, 55, '<div class="fs-italic text-muted mb-10" >\n<span class="text-success">Открыл(а) резюме</span> для <b class="text-black">Дина Шубина</b>\n</div>\r\n\r\n<div class="message-resume">\r\n    <div class="message-resume-title">Открыл резюме</div>\r\n    <div class="message-resume-row">\r\n                    <div class="message-resume-col">\r\n                <div class="mri-title">Email</div>\r\n                <div class="mri-value"><a href=''mailto:candidate1@gmail.com'' target=''_blank''>candidate1@gmail.com</a></div>\r\n            </div>\r\n                    <div class="message-resume-col">\r\n                <div class="mri-title">Резюме</div>\r\n                <div class="mri-value"><a class=''attachment'' href=''http://jobzz.loc/messenger/download/0b4a3f8a-068e-459a-9ae6-6da8dd59afc0.docx'' target=''_blank''> TestResume.docx</a></div>\r\n            </div>\r\n            </div>\r\n</div>\r\n', '{"file_name":"0b4a3f8a-068e-459a-9ae6-6da8dd59afc0.docx","title":"TestResume.docx"}', 1, 0, 0, '2021-09-17 17:30:36', '2021-09-17 17:30:51'),
(72, 'hiring', 55, 64, '<div class="fs-italic text-muted mb-10" >\n<span class="text-success">Сообщил(а) о найме</span>,\nдата выхода на работу <b class="text-black">23.09.2021</b>\n</div>', NULL, 1, 0, 0, '2021-09-20 14:55:45', '2021-09-20 14:56:12'),
(73, 'profile', 64, 55, '<div class="fs-italic text-muted mb-10" >\n<span class="text-success">Открыл(а) резюме</span> для <b class="text-black">Дина Шубина</b>\n</div>\r\n\r\n<div class="message-resume">\r\n    <div class="message-resume-title">Opened resume</div>\r\n    <div class="message-resume-row">\r\n                    <div class="message-resume-col">\r\n                <div class="mri-title">Email</div>\r\n                <div class="mri-value"><a href=''mailto:candidate1@gmail.com'' target=''_blank''>candidate1@gmail.com</a></div>\r\n            </div>\r\n                    <div class="message-resume-col">\r\n                <div class="mri-title">Резюме</div>\r\n                <div class="mri-value"><a class=''attachment'' href=''http://jobzz.loc/messenger/download/0c5e7590-47ee-4d7c-aa53-908419ac0526.docx'' target=''_blank''> TestResume.docx</a></div>\r\n            </div>\r\n            </div>\r\n</div>\r\n', '{"file_name":"0c5e7590-47ee-4d7c-aa53-908419ac0526.docx","title":"TestResume.docx"}', 1, 0, 0, '2021-09-20 14:56:20', '2021-09-24 11:36:48'),
(74, 'profile', 64, 55, '<div class="fs-italic text-muted mb-10" >\n<span class="text-success">Открыл(а) резюме</span> для <b class="text-black">Дина Шубина</b>\n</div>\r\n\r\n<div class="message-resume">\r\n    <div class="message-resume-title">Opened resume</div>\r\n    <div class="message-resume-row">\r\n                    <div class="message-resume-col">\r\n                <div class="mri-title">Email</div>\r\n                <div class="mri-value"><a href=''mailto:maxmun@mail.ru'' target=''_blank''>maxmun@mail.ru</a></div>\r\n            </div>\r\n                    <div class="message-resume-col">\r\n                <div class="mri-title">Skype</div>\r\n                <div class="mri-value">@vadoxkrachulov</div>\r\n            </div>\r\n                    <div class="message-resume-col">\r\n                <div class="mri-title">Моб. телефон</div>\r\n                <div class="mri-value">+380978623299</div>\r\n            </div>\r\n                    <div class="message-resume-col">\r\n                <div class="mri-title">Telegram</div>\r\n                <div class="mri-value">@vadox</div>\r\n            </div>\r\n                    <div class="message-resume-col">\r\n                <div class="mri-title">Linked In</div>\r\n                <div class="mri-value">https://www.linkedin.com/in/vadox/</div>\r\n            </div>\r\n                    <div class="message-resume-col">\r\n                <div class="mri-title">GitHub</div>\r\n                <div class="mri-value">https://github.com/vadoxdev</div>\r\n            </div>\r\n                    <div class="message-resume-col">\r\n                <div class="mri-title">Ссылка на портфолио</div>\r\n                <div class="mri-value"><a href=''https://vadox.net/portfolio'' target=''_blank''>https://vadox.net/portfolio</a></div>\r\n            </div>\r\n                    <div class="message-resume-col">\r\n                <div class="mri-title">Резюме</div>\r\n                <div class="mri-value"><a class=''attachment'' href=''http://jobzz.loc/messenger/download/d6064cfc-a717-43ae-ad1a-9dc38d44e569.docx'' target=''_blank''> TestResume.docx</a></div>\r\n            </div>\r\n            </div>\r\n</div>\r\n', '{"file_name":"d6064cfc-a717-43ae-ad1a-9dc38d44e569.docx","title":"TestResume.docx"}', 1, 0, 0, '2021-09-24 11:40:06', '2021-09-24 11:41:04'),
(75, 'profile', 64, 55, '<div class="fs-italic text-muted mb-10" >\n<span class="text-success">Открыл(а) резюме</span> для <b class="text-black">Дина Шубина</b>\n</div>\r\n\r\n<div class="message-resume">\r\n    <div class="message-resume-title">Opened resume</div>\r\n    <div class="message-resume-row">\r\n                    <div class="message-resume-col">\r\n                <div class="mri-title">Email</div>\r\n                <div class="mri-value"><a href=''mailto:candidate1@gmail.com'' target=''_blank''>candidate1@gmail.com</a></div>\r\n            </div>\r\n                    <div class="message-resume-col">\r\n                <div class="mri-title">Skype</div>\r\n                <div class="mri-value"><a href=''skype:vadoxkrachulov?chat'' target=''_blank''>vadoxkrachulov</a></div>\r\n            </div>\r\n                    <div class="message-resume-col">\r\n                <div class="mri-title">Моб. телефон</div>\r\n                <div class="mri-value"><a href=''tel:+380978623299'' target=''_blank''>+380978623299</a></div>\r\n            </div>\r\n                    <div class="message-resume-col">\r\n                <div class="mri-title">Telegram</div>\r\n                <div class="mri-value"><a href=''https://t.me/vadox'' target=''_blank''>vadox</a></div>\r\n            </div>\r\n                    <div class="message-resume-col">\r\n                <div class="mri-title">Linked In</div>\r\n                <div class="mri-value"><a href=''https://www.linkedin.com/in/vadox/'' target=''_blank''>https://www.linkedin.com/in/vadox/</a></div>\r\n            </div>\r\n                    <div class="message-resume-col">\r\n                <div class="mri-title">GitHub</div>\r\n                <div class="mri-value"><a href=''https://gitlab.com/vadoxdev'' target=''_blank''>https://gitlab.com/vadoxdev</a></div>\r\n            </div>\r\n                    <div class="message-resume-col">\r\n                <div class="mri-title">Ссылка на портфолио</div>\r\n                <div class="mri-value"><a href=''http://vadox.net'' target=''_blank''>http://vadox.net</a></div>\r\n            </div>\r\n                    <div class="message-resume-col">\r\n                <div class="mri-title">Резюме</div>\r\n                <div class="mri-value"><a class=''attachment'' href=''http://jobzz.loc/messenger/download/cdee0a87-4d69-4928-9f3b-888c382c96fe.docx'' target=''_blank''> TestResume.docx</a></div>\r\n            </div>\r\n            </div>\r\n</div>\r\n', '{"file_name":"cdee0a87-4d69-4928-9f3b-888c382c96fe.docx","title":"TestResume.docx"}', 1, 0, 0, '2021-09-24 11:52:47', '2021-09-24 11:54:26'),
(76, 'profile', 64, 55, '<div class="fs-italic text-muted mb-10" >\n<span class="text-success">Открыл(а) резюме</span> для <b class="text-black">Дина Шубина</b>\n</div>\r\n\r\n<div class="message-resume">\r\n    <div class="message-resume-title">Opened resume</div>\r\n    <div class="message-resume-row">\r\n                    <div class="message-resume-col">\r\n                <div class="mri-title">Email</div>\r\n                <div class="mri-value"><a href=''mailto:candidate1@gmail.com'' target=''_blank''>candidate1@gmail.com</a></div>\r\n            </div>\r\n                    <div class="message-resume-col">\r\n                <div class="mri-title">Skype</div>\r\n                <div class="mri-value"><a href=''skype:vadoxkravhulov?chat'' target=''_blank''>vadoxkravhulov</a></div>\r\n            </div>\r\n                    <div class="message-resume-col">\r\n                <div class="mri-title">Моб. телефон</div>\r\n                <div class="mri-value"><a href=''tel:+380978623299'' target=''_blank''>+380978623299</a></div>\r\n            </div>\r\n                    <div class="message-resume-col">\r\n                <div class="mri-title">Telegram</div>\r\n                <div class="mri-value"><a href=''https://t.me/vadox'' target=''_blank''>@vadox</a></div>\r\n            </div>\r\n                    <div class="message-resume-col">\r\n                <div class="mri-title">LinkedIn</div>\r\n                <div class="mri-value"><a href=''https://www.linkedin.com/in/%D0%B2%D0%B0%D0%B4%D0%B8%D0%BC-%D0%BA%D1%80%D0%B0%D1%87%D1%83%D0%BB%D0%BE%D0%B2-803a33221/'' target=''_blank''>https://www.linkedin.com/in/%D0%B2%D0%B0%D0%B4%D0%B8%D0%BC-%D0%BA%D1%80%D0%B0%D1%87%D1%83%D0%BB%D0%BE%D0%B2-803a33221/</a></div>\r\n            </div>\r\n                    <div class="message-resume-col">\r\n                <div class="mri-title">Портфолио</div>\r\n                <div class="mri-value"><a href=''http://vadox.net'' target=''_blank''>http://vadox.net</a></div>\r\n            </div>\r\n                    <div class="message-resume-col">\r\n                <div class="mri-title">Резюме</div>\r\n                <div class="mri-value"><a class=''attachment'' href=''http://jobzz.loc/messenger/download/7360d070-0a0c-4428-b707-6deb43f00206.docx'' target=''_blank''> Не грози Южному централу попивая сок у себя в квартале.docx</a></div>\r\n            </div>\r\n            </div>\r\n</div>\r\n', '{"file_name":"7360d070-0a0c-4428-b707-6deb43f00206.docx","title":"\\u041d\\u0435 \\u0433\\u0440\\u043e\\u0437\\u0438 \\u042e\\u0436\\u043d\\u043e\\u043c\\u0443 \\u0446\\u0435\\u043d\\u0442\\u0440\\u0430\\u043b\\u0443 \\u043f\\u043e\\u043f\\u0438\\u0432\\u0430\\u044f \\u0441\\u043e\\u043a \\u0443 \\u0441\\u0435\\u0431\\u044f \\u0432 \\u043a\\u0432\\u0430\\u0440\\u0442\\u0430\\u043b\\u0435.docx"}', 0, 0, 0, '2021-09-25 10:05:01', '2021-09-25 10:05:01'),
(77, 'profile', 64, 55, '<div class="fs-italic text-muted mb-10" >\n<span class="text-success">Открыл(а) резюме</span> для <b class="text-black">Дина Шубина</b>\n</div>\r\n\r\n<div class="message-resume">\r\n    <div class="message-resume-title">Opened resume</div>\r\n    <div class="message-resume-row">\r\n                    <div class="message-resume-col">\r\n                <div class="mri-title">Email</div>\r\n                <div class="mri-value"><a href=''mailto:candidate1@gmail.com'' target=''_blank''>candidate1@gmail.com</a></div>\r\n            </div>\r\n                    <div class="message-resume-col">\r\n                <div class="mri-title">Резюме</div>\r\n                <div class="mri-value"><a class=''attachment'' href=''http://jobzz.loc/messenger/download/9c5520ef-cc1b-453a-b09d-64ea06591f66.pdf'' target=''_blank''> Zaklyuchenie_dogovora_po_Platezhnomu_porucheniyu.pdf</a></div>\r\n            </div>\r\n            </div>\r\n</div>\r\n', '{"file_name":"9c5520ef-cc1b-453a-b09d-64ea06591f66.pdf","title":"Zaklyuchenie_dogovora_po_Platezhnomu_porucheniyu.pdf"}', 0, 0, 0, '2021-10-07 09:04:38', '2021-10-07 09:04:38'),
(78, 'offer', 64, 62, '<p>Добрый день! Жанна Авдеева<br />\nМне интересна ваша вакансия Android Developer<br />\n<a href="http://jobzz.loc/vacancies/50-android-developer" target="_blank">http://jobzz.loc/vacancies/50-android-developer</a><br />\n<br />\nОткрываю свои контакты и резюме<br />\nТелефон: +380978623299<br />\nSkype: @testskype<br />\nTelegram: @test<br />\nLinked In: <a href="https://www.linkedin.com/in/test-candidate/" target="_blank">https://www.linkedin.com/in/test-candidate/</a><br />\nС нетерпением буду ждать вашего ответа)\n<br /><br />\n--------------------------------------------<br />\r\nС уважением Test Payment<br />\r\n<a href="mailto:candidate1@gmail.com" target="_blank">candidate1@gmail.com</a></p>\r\n\r\n    <div>\r\n        <a class=''attachment''\r\n           href=''http://jobzz.loc/messenger/download/f7acb746-cbb3-4b96-b8a5-04bb1b803bce.pdf?name=Zaklyuchenie_dogovora_po_Platezhnomu_porucheniyu.pdf''\r\n           target=''_blank''>Zaklyuchenie_dogovora_po_Platezhnomu_porucheniyu.pdf</a>\r\n    </div>\r\n', '{"file_name":"f7acb746-cbb3-4b96-b8a5-04bb1b803bce.pdf","title":"Zaklyuchenie_dogovora_po_Platezhnomu_porucheniyu.pdf"}', 1, 0, 0, '2021-10-07 10:28:35', '2021-10-07 10:34:39'),
(79, 'hiring', 62, 64, '<div class="fs-italic text-muted mb-10" >\n<span class="text-success">Сообщил(а) о найме</span>,\nдата выхода на работу <b class="text-black">21.10.2021</b>\n</div>', NULL, 1, 0, 0, '2021-10-07 11:21:04', '2021-10-07 11:21:46'),
(83, 'hiring', 62, 64, '<div class="fs-italic text-muted mb-10" >\n<span class="text-success">Сообщил(а) о найме</span>,\nдата выхода на работу <b class="text-black">21.10.2021</b>\n</div>', NULL, 0, 0, 0, '2021-10-07 11:28:25', '2021-10-07 11:28:25'),
(84, 'hiring', 62, 64, '<div class="fs-italic text-muted mb-10" >\n<span class="text-success">Сообщил(а) о найме</span>,\nдата выхода на работу <b class="text-black">21.10.2021</b>\n</div>', NULL, 0, 0, 0, '2021-10-07 11:32:05', '2021-10-07 11:32:05'),
(85, 'message', 2, 55, '<p><div>Здравствуйте, Шубина Дина</div><div>10.10.2021 истекает срок оплаты за кандидата Testing Payment</div><div>В случае не уплаты ваш аккаунт будет заблокирован</div></p>\r\n\r\n', NULL, 0, 0, 0, '2021-10-15 14:32:13', '2021-10-15 14:32:13'),
(86, 'offer', 55, 35, '<p>Добрый день!<br />\nНам интересен Ваш профиль и мы хотим предложить Вам на рассмотрение нашу вакансию. Будем рады ознакомиться с Вашим резюме)</p>\r\n    <div class="mb-5">\r\n        <a href=http://jobzz.loc/vacancies/11-uiuxdesign-manager  target=''_blank''>UI/UX/Design Manager</a>\r\n    </div>\r\n', NULL, 0, 0, 0, '2021-10-21 15:48:41', '2021-10-21 15:48:41'),
(87, 'message', 65, 2, '<p>sdfsd</p>\r\n', NULL, 1, 0, 0, '2021-10-21 16:42:51', '2021-10-21 16:43:04'),
(88, 'message', 2, 65, '<p>dsfsdf</p>\r\n', NULL, 1, 0, 0, '2021-10-21 16:43:09', '2021-10-21 16:49:03'),
(89, 'message', 2, 65, '<p>fdsfsdf</p>\r\n', NULL, 1, 0, 0, '2021-10-21 17:14:51', '2021-10-21 17:40:57'),
(90, 'message', 2, 65, '<p>sdfsdfsdf</p>\r\n', NULL, 1, 0, 0, '2021-10-21 17:14:52', '2021-10-21 17:40:57'),
(91, 'message', 2, 65, '<p>sdfsdfsdf</p>\r\n', NULL, 1, 0, 0, '2021-10-21 17:14:54', '2021-10-21 17:40:57'),
(92, 'message', 2, 65, '<p>sdfsdfsdfsdd</p>\r\n', NULL, 1, 0, 0, '2021-10-21 17:14:55', '2021-10-21 17:40:57'),
(93, 'message', 65, 2, '<p>sdfsadfdsaf</p>\r\n', NULL, 1, 0, 0, '2021-10-21 17:41:01', '2021-10-25 13:04:28'),
(94, 'message', 65, 2, '<p>sdfsdfsd</p>\r\n', NULL, 1, 0, 0, '2021-10-21 17:41:17', '2021-10-25 13:04:28'),
(95, 'message', 65, 2, '<p>fdsfs</p>\r\n', NULL, 1, 0, 0, '2021-10-21 17:42:38', '2021-10-25 13:04:28'),
(96, 'message', 65, 2, '<p>sdfsdfsdf</p>\r\n', NULL, 1, 0, 0, '2021-10-21 17:44:14', '2021-10-25 13:04:28'),
(97, 'message', 65, 2, '<p>sdfsdfs</p>\r\n', NULL, 1, 0, 0, '2021-10-21 17:45:50', '2021-10-25 13:04:28'),
(98, 'message', 65, 2, '<p>sfdsdfsdf</p>\r\n', NULL, 1, 0, 0, '2021-10-21 17:46:03', '2021-10-25 13:04:28'),
(99, 'message', 65, 2, '<p>sdfsdfsdf</p>\r\n', NULL, 1, 0, 0, '2021-10-21 17:49:08', '2021-10-25 13:04:28'),
(100, 'message', 2, 65, '<p>egdfg</p>\r\n', NULL, 0, 0, 0, '2021-10-25 13:04:31', '2021-10-25 13:04:31'),
(101, 'message', 2, 69, '<p>test</p>\r\n', NULL, 0, 0, 0, '2021-10-25 15:40:05', '2021-10-25 15:40:05'),
(102, 'message', 2, 69, '<p>sdfsdf</p>\r\n', NULL, 0, 0, 0, '2021-10-25 15:41:05', '2021-10-25 15:41:05'),
(103, 'message', 2, 69, '<p>sdfsdf</p>\r\n', NULL, 0, 0, 0, '2021-10-25 15:44:52', '2021-10-25 15:44:52'),
(104, 'message', 2, 69, '<p>sdffsdf</p>\r\n', NULL, 0, 0, 0, '2021-10-25 15:45:08', '2021-10-25 15:45:08'),
(105, 'message', 2, 69, '<p>sdfsdf</p>\r\n', NULL, 0, 0, 0, '2021-10-25 15:45:42', '2021-10-25 15:45:42'),
(106, 'message', 68, 2, '<p>sdfsdf</p>\r\n', NULL, 1, 0, 0, '2021-10-25 15:47:27', '2021-10-25 15:47:41'),
(107, 'message', 2, 68, '<p>sfsdfsdf</p>\r\n', NULL, 1, 0, 0, '2021-10-25 15:47:47', '2021-10-25 15:52:10'),
(108, 'message', 2, 68, '<p>sdfsdfs</p>\r\n', NULL, 1, 0, 0, '2021-10-25 15:48:16', '2021-10-25 15:52:10'),
(109, 'message', 2, 68, '<p>sdfsdf</p>\r\n', NULL, 1, 0, 0, '2021-10-25 15:49:07', '2021-10-25 15:52:10'),
(110, 'message', 2, 68, '<p>sfsdfsdf</p>\r\n', NULL, 1, 0, 0, '2021-10-25 15:59:25', '2021-10-25 16:00:56'),
(111, 'message', 2, 68, '<p>sdfsdf</p>\r\n', NULL, 1, 0, 0, '2021-10-25 15:59:56', '2021-10-25 16:00:56'),
(112, 'message', 2, 68, '<p>sfwefsdffsdf</p>\r\n', NULL, 1, 0, 0, '2021-10-25 16:00:46', '2021-10-25 16:00:56'),
(113, 'message', 2, 68, '<p>sdfsdfsdf</p>\r\n', NULL, 1, 0, 0, '2021-10-25 16:01:19', '2021-10-26 16:36:15'),
(114, 'message', 2, 68, '<p>sdfsdf</p>\r\n', NULL, 1, 0, 0, '2021-10-25 16:05:14', '2021-10-26 16:36:15'),
(115, 'message', 2, 68, '<p>sdfsdfsd</p>\r\n', NULL, 1, 0, 0, '2021-10-25 16:06:31', '2021-10-26 16:36:15'),
(116, 'message', 2, 68, '<p>sdfsdf</p>\r\n', NULL, 1, 0, 0, '2021-10-25 16:08:34', '2021-10-26 16:36:15'),
(117, 'message', 2, 68, '<p>sdfsdfs</p>\r\n', NULL, 1, 0, 0, '2021-10-25 16:08:49', '2021-10-26 16:36:15'),
(118, 'message', 2, 68, '<p>dsfsdf</p>\r\n', NULL, 1, 0, 0, '2021-10-25 16:09:32', '2021-10-26 16:36:15'),
(119, 'message', 2, 68, '<p>fsdfsdf</p>\r\n', NULL, 1, 0, 0, '2021-10-25 16:10:46', '2021-10-26 16:36:15'),
(120, 'message', 2, 68, '<p>Тестируем пуш уведомления!</p>\r\n', NULL, 1, 0, 0, '2021-10-25 16:17:06', '2021-10-26 16:36:15'),
(121, 'message', 2, 68, '<p>fsdfsdfs</p>\r\n', NULL, 1, 0, 0, '2021-10-25 16:20:33', '2021-10-26 16:36:15'),
(122, 'message', 2, 68, '<p>ddddddddddddd</p>\r\n', NULL, 1, 0, 0, '2021-10-25 16:23:32', '2021-10-26 16:36:15'),
(123, 'message', 2, 68, '<p>ываываыва</p>\r\n', NULL, 1, 0, 0, '2021-10-25 16:26:53', '2021-10-26 16:36:15'),
(124, 'message', 2, 68, '<p>ываыва</p>\r\n', NULL, 1, 0, 0, '2021-10-25 16:28:00', '2021-10-26 16:36:15'),
(125, 'message', 2, 68, '<p>ываываыв</p>\r\n', NULL, 1, 0, 0, '2021-10-25 16:28:13', '2021-10-26 16:36:15'),
(126, 'message', 2, 68, '<p>sdfsdfsdf</p>\r\n', NULL, 1, 0, 0, '2021-10-25 17:20:21', '2021-10-26 16:36:15'),
(127, 'message', 2, 68, '<p>sdfsdf</p>\r\n', NULL, 1, 0, 0, '2021-10-25 17:20:53', '2021-10-26 16:36:15'),
(128, 'message', 2, 68, '<p>fsfsdf</p>\r\n', NULL, 1, 0, 0, '2021-10-25 17:22:45', '2021-10-26 16:36:15'),
(129, 'message', 2, 68, '<p>sdfsdf</p>\r\n', NULL, 1, 0, 0, '2021-10-25 17:23:22', '2021-10-26 16:36:15'),
(130, 'message', 2, 68, '<p>sdfsdfsdf</p>\r\n', NULL, 1, 0, 0, '2021-10-25 17:25:48', '2021-10-26 16:36:15'),
(131, 'offer', 69, 68, '<p>Добрый день!<br />\nНам интересен Ваш профиль и мы хотим предложить Вам на рассмотрение нашу вакансию. Будем рады ознакомиться с Вашим резюме)</p>\r\n    <div class="mb-5">\r\n        <a href=http://jobzz.loc/vacancies/58-test-c  target=''_blank''>Test C#</a>\r\n    </div>\r\n', NULL, 1, 0, 0, '2021-10-26 16:40:02', '2021-10-26 16:44:41'),
(132, 'offer', 69, 68, '<p>Добрый день!<br />\nНам интересен Ваш профиль и мы хотим предложить Вам на рассмотрение нашу вакансию. Будем рады ознакомиться с Вашим резюме)</p>\r\n    <div class="mb-5">\r\n        <a href=http://jobzz.loc/vacancies/58-test-c  target=''_blank''>Test C#</a>\r\n    </div>\r\n', NULL, 1, 0, 0, '2021-10-26 16:47:27', '2021-10-26 16:48:51'),
(133, 'offer', 69, 68, '<p>Добрый день!<br />\nНам интересен Ваш профиль и мы хотим предложить Вам на рассмотрение нашу вакансию. Будем рады ознакомиться с Вашим резюме)</p>\r\n    <div class="mb-5">\r\n        <a href=http://jobzz.loc/vacancies/58-test-c  target=''_blank''>Test C#</a>\r\n    </div>\r\n', NULL, 0, 0, 0, '2021-10-26 16:51:38', '2021-10-26 16:51:38'),
(134, 'message', 76, 2, '<p>ываываыва</p>\r\n', NULL, 1, 0, 0, '2021-10-29 10:39:31', '2022-01-27 16:08:13'),
(135, 'offer', 76, 35, '<p>Добрый день!<br />\nНам интересен Ваш профиль и мы хотим предложить Вам на рассмотрение нашу вакансию. Будем рады ознакомиться с Вашим резюме)</p>\r\n    <div class="mb-5">\r\n        <a href=http://jobzz.loc/vacancies/59-test-payment-vacancy  target=''_blank''>Test Payment Vacancy</a>\r\n    </div>\r\n', NULL, 0, 0, 0, '2021-11-01 09:15:11', '2021-11-01 09:15:11'),
(136, 'offer', 76, 68, '<p>Добрый день!<br />\nНам интересен Ваш профиль и мы хотим предложить Вам на рассмотрение нашу вакансию. Будем рады ознакомиться с Вашим резюме)</p>\r\n    <div class="mb-5">\r\n        <a href=http://jobzz.loc/vacancies/60-test-php-vacancy  target=''_blank''>Test PHP vacancy</a>\r\n    </div>\r\n', NULL, 0, 0, 0, '2021-11-01 09:18:48', '2021-11-01 09:18:48'),
(137, 'offer', 68, 76, '<p>Добрый день! Notify Test<br />\nМне интересна ваша вакансия Test Payment Vacancy<br />\n<a href="http://jobzz.loc/vacancies/59-test-payment-vacancy" target="_blank">http://jobzz.loc/vacancies/59-test-payment-vacancy</a><br />\n<br />\nОткрываю свои контакты и резюме<br />\n<br />\nС нетерпением буду ждать вашего ответа)<br />\n<br />\n--------------------------------------------<br />\nС уважением Крачулов Вадим<br />\n<a href="mailto:vadox.dev@gmail.com" target="_blank">vadox.dev@gmail.com</a></p>\r\n    <div>\r\n        <a class=''attachment''\r\n           href=''http://jobzz.loc/messenger/download/44109cf1-b0b0-41e8-999f-46e8f325ae57.docx?name=44a44d1018d664612010e29440526b13.docx''\r\n           target=''_blank''>44a44d1018d664612010e29440526b13.docx</a>\r\n    </div>\r\n', '{"file_name":"44109cf1-b0b0-41e8-999f-46e8f325ae57.docx","title":"44a44d1018d664612010e29440526b13.docx"}', 1, 0, 0, '2021-12-14 10:47:26', '2021-12-17 13:25:51'),
(138, 'offer', 76, 66, '<p>Добрый день!<br />\nНам интересен Ваш профиль и мы хотим предложить Вам на рассмотрение нашу вакансию. Будем рады ознакомиться с Вашим резюме)</p>\r\n    <div class="mb-5">\r\n        <a href=http://jobzz.loc/vacancies/59-test-payment-vacancy  target=''_blank''>Test Payment Vacancy / Very very long vacancy title for testing</a>\r\n    </div>\r\n', NULL, 1, 0, 0, '2021-12-17 13:14:42', '2021-12-17 13:28:48'),
(139, 'message', 66, 76, '<p>Test answer</p>\r\n', NULL, 1, 0, 0, '2021-12-17 13:28:56', '2021-12-17 13:29:16'),
(140, 'message', 66, 76, '<p>ваыыв</p>\r\n', NULL, 1, 0, 0, '2021-12-17 13:44:15', '2021-12-17 13:50:21'),
(141, 'message', 76, 66, '<p>dsfsd</p>\r\n', NULL, 1, 0, 0, '2021-12-17 13:50:26', '2021-12-17 13:58:18'),
(142, 'message', 2, 66, '<p>tesyt</p>\r\n', NULL, 1, 0, 0, '2021-12-17 13:55:53', '2021-12-17 13:56:01'),
(143, 'message', 66, 2, '<p>sdf</p>\r\n', NULL, 1, 0, 0, '2021-12-17 13:56:03', '2021-12-17 13:57:05'),
(144, 'message', 66, 2, '<p>ghgh</p>\r\n', NULL, 1, 0, 0, '2021-12-17 13:58:11', '2022-01-27 16:17:23'),
(145, 'message', 66, 76, '<p>hghgh</p>\r\n', NULL, 1, 0, 0, '2021-12-17 13:58:21', '2021-12-17 13:58:30'),
(146, 'message', 66, 76, '<p>nmnm</p>\r\n', NULL, 1, 0, 0, '2021-12-17 13:58:37', '2021-12-17 13:58:39'),
(147, 'message', 76, 66, '<p>sfsdfsfsdf</p>\r\n', NULL, 1, 1, 0, '2021-12-17 13:58:57', '2022-01-28 10:30:11'),
(148, 'message', 66, 76, '<p>hghghg</p>\r\n', NULL, 1, 0, 0, '2021-12-17 13:59:11', '2021-12-17 13:59:19'),
(149, 'message', 76, 2, '<p>Test</p>\r\n', NULL, 1, 0, 0, '2022-01-06 09:28:26', '2022-01-27 16:08:13'),
(150, 'message', 76, 66, '<p>fdsf<br />\nsdfsdf<br />\nsdfsdf<br />\nsdfsdf</p>\r\n', NULL, 0, 1, 0, '2022-01-06 08:29:40', '2022-01-28 10:30:51'),
(151, 'message', 76, 2, '<p>ываыв</p>\r\n', NULL, 1, 0, 0, '2022-01-06 08:37:19', '2022-01-27 16:08:13'),
(152, 'message', 2, 62, '<p><div>Здравствуйте, Авдеева Жанна</div><div>05.11.2021 истекает срок оплаты за кандидата Testing Payment</div><div>В случае неуплаты ваш аккаунт будет заблокирован</div></p>\r\n', NULL, 0, 0, 0, '2022-01-27 15:12:24', '2022-01-27 15:12:24'),
(153, 'message', 2, 76, '<p><div>Здравствуйте, Notify Test</div><div>24.12.2021 истекает срок оплаты за кандидата Project Manager Manager</div><div>25.12.2021 истекает срок оплаты за кандидата PHP Developer</div><div>В случае неуплаты ваш аккаунт будет заблокирован</div></p>\r\n', NULL, 1, 0, 0, '2022-01-27 15:12:26', '2022-01-28 10:37:35'),
(154, 'message', 76, 66, '<p>sdfsdfvb</p>\r\n', NULL, 0, 1, 0, '2022-01-28 10:30:41', '2022-02-22 08:08:25'),
(155, 'message', 2, 76, '<p>sdfsdf<br />\nsdfsdfsdfsf<br />\nsfdsfsdfs</p>\r\n', NULL, 1, 1, 0, '2022-01-28 10:33:10', '2022-01-28 10:42:13'),
(156, 'message', 76, 2, '<p>Ок, тестируем</p>\r\n', NULL, 1, 1, 0, '2022-01-28 10:44:51', '2022-01-28 10:51:00'),
(157, 'message', 76, 66, '<p>xvcxcvxcv sdf</p>\r\n', NULL, 0, 1, 0, '2022-02-22 08:08:45', '2022-02-22 08:09:16'),
(158, 'message', 76, 2, '<p>Новое сообщение сообщение</p>\r\n', NULL, 1, 1, 0, '2022-02-22 12:06:57', '2022-02-22 12:12:50');

-- 
-- Вывод данных для таблицы candidate_specializations
--
INSERT INTO candidate_specializations VALUES
(50, 1),
(23, 2),
(51, 2),
(22, 3),
(49, 3),
(52, 3),
(66, 3),
(69, 3),
(28, 4),
(21, 5),
(32, 6),
(37, 6),
(1, 7),
(29, 7),
(25, 8),
(31, 9),
(40, 9),
(65, 10),
(30, 13),
(20, 14),
(15, 15),
(41, 15),
(43, 15),
(44, 16),
(34, 17),
(16, 18),
(9, 19),
(27, 19),
(36, 19),
(8, 20),
(33, 21),
(24, 22),
(45, 22),
(5, 23),
(3, 24),
(10, 24),
(18, 24),
(26, 24),
(35, 24),
(48, 24),
(11, 25),
(12, 25),
(13, 25),
(47, 25),
(14, 26),
(17, 27),
(38, 27),
(2, 28),
(6, 28),
(19, 28),
(4, 29),
(7, 29),
(42, 29),
(64, 29),
(46, 30),
(39, 31);

-- 
-- Вывод данных для таблицы candidate_skills
--
INSERT INTO candidate_skills VALUES
(1, 22, 1, 0),
(1, 23, 1, 0),
(1, 40, 1, 0),
(1, 49, 0, 0),
(1, 65, 0, 0),
(1, 74, 0, 0),
(1, 75, 0, 0),
(1, 89, 1, 0),
(1, 109, 0, 0),
(1, 117, 0, 0),
(1, 122, 1, 0),
(2, 2, 1, 0),
(2, 3, 0, 0),
(2, 5, 0, 0),
(2, 6, 1, 0),
(2, 7, 1, 0),
(2, 8, 0, 0),
(2, 9, 0, 0),
(2, 10, 1, 0),
(2, 13, 1, 0),
(2, 17, 0, 0),
(2, 19, 0, 0),
(2, 20, 0, 0),
(3, 1, 1, 0),
(3, 4, 0, 0),
(3, 7, 1, 0),
(3, 9, 0, 0),
(3, 10, 0, 0),
(3, 11, 1, 0),
(3, 12, 0, 0),
(3, 17, 1, 0),
(3, 18, 1, 0),
(3, 20, 0, 0),
(4, 1, 1, 0),
(4, 2, 1, 0),
(4, 3, 0, 0),
(4, 6, 0, 0),
(4, 10, 0, 0),
(4, 11, 0, 0),
(4, 12, 1, 0),
(4, 13, 1, 0),
(4, 14, 0, 0),
(4, 17, 0, 0),
(4, 18, 0, 0),
(4, 19, 0, 0),
(4, 20, 1, 0),
(5, 1, 0, 0),
(5, 2, 1, 0),
(5, 4, 0, 0),
(5, 5, 0, 0),
(5, 7, 1, 0),
(5, 9, 0, 0),
(5, 10, 1, 0),
(5, 11, 1, 0),
(5, 12, 0, 0),
(5, 15, 0, 0),
(5, 16, 0, 0),
(5, 19, 1, 0),
(5, 20, 0, 0),
(6, 2, 1, 0),
(6, 3, 0, 0),
(6, 4, 0, 0),
(6, 5, 0, 0),
(6, 6, 1, 0),
(6, 8, 0, 0),
(6, 10, 0, 0),
(6, 11, 1, 0),
(6, 12, 0, 0),
(6, 15, 1, 0),
(6, 16, 1, 0),
(6, 18, 0, 0),
(6, 19, 0, 0),
(7, 1, 1, 0),
(7, 2, 0, 0),
(7, 4, 1, 0),
(7, 5, 1, 0),
(7, 6, 1, 0),
(7, 7, 0, 0),
(7, 8, 0, 0),
(7, 9, 0, 0),
(7, 10, 0, 0),
(7, 12, 0, 0),
(7, 13, 0, 0),
(7, 16, 0, 0),
(7, 19, 1, 0),
(8, 1, 0, 0),
(8, 4, 0, 0),
(8, 5, 0, 0),
(8, 6, 1, 0),
(8, 7, 0, 0),
(8, 10, 1, 0),
(8, 11, 1, 0),
(8, 12, 0, 0),
(8, 13, 0, 0),
(8, 15, 1, 0),
(8, 18, 0, 0),
(8, 20, 1, 0),
(9, 10, 1, 0),
(9, 12, 1, 0),
(9, 13, 0, 0),
(9, 18, 0, 0),
(9, 19, 1, 0),
(9, 20, 1, 0),
(9, 28, 1, 0),
(9, 56, 0, 0),
(9, 58, 0, 0),
(9, 79, 0, 0),
(10, 2, 0, 0),
(10, 3, 1, 0),
(10, 5, 0, 0),
(10, 6, 0, 0),
(10, 7, 0, 0),
(10, 12, 0, 0),
(10, 13, 1, 0),
(10, 14, 1, 0),
(10, 15, 1, 0),
(10, 16, 1, 0),
(10, 17, 0, 0),
(10, 18, 0, 0),
(10, 20, 0, 0),
(11, 1, 1, 0),
(11, 2, 0, 0),
(11, 3, 1, 0),
(11, 5, 0, 0),
(11, 6, 0, 0),
(11, 7, 0, 0),
(11, 9, 0, 0),
(11, 10, 1, 0),
(11, 14, 0, 0),
(11, 15, 0, 0),
(11, 16, 1, 0),
(11, 17, 0, 0),
(11, 18, 1, 0),
(12, 1, 0, 0),
(12, 2, 1, 0),
(12, 3, 0, 0),
(12, 4, 0, 0),
(12, 5, 1, 0),
(12, 6, 0, 0),
(12, 7, 0, 0),
(12, 8, 0, 0),
(12, 9, 1, 0),
(12, 10, 1, 0),
(12, 13, 1, 0),
(12, 14, 0, 0),
(12, 15, 0, 0),
(13, 1, 1, 0),
(13, 2, 0, 0),
(13, 4, 0, 0),
(13, 5, 0, 0),
(13, 6, 0, 0),
(13, 7, 1, 0),
(13, 9, 1, 0),
(13, 11, 0, 0),
(13, 12, 1, 0),
(13, 15, 1, 0),
(13, 18, 0, 0),
(13, 20, 0, 0),
(14, 1, 1, 0),
(14, 2, 0, 0),
(14, 3, 1, 0),
(14, 4, 0, 0),
(14, 7, 0, 0),
(14, 8, 0, 0),
(14, 9, 1, 0),
(14, 12, 1, 0),
(14, 13, 0, 0),
(14, 16, 1, 0),
(14, 19, 0, 0),
(15, 1, 1, 0),
(15, 4, 1, 0),
(15, 7, 0, 0),
(15, 11, 1, 0),
(15, 12, 0, 0),
(15, 13, 0, 0),
(15, 15, 0, 0),
(15, 17, 1, 0),
(15, 18, 1, 0),
(15, 19, 0, 0),
(15, 20, 0, 0),
(16, 3, 0, 0),
(16, 4, 0, 0),
(16, 7, 0, 0),
(16, 8, 0, 0),
(16, 9, 1, 0),
(16, 10, 1, 0),
(16, 11, 1, 0),
(16, 14, 1, 0),
(16, 15, 0, 0),
(16, 16, 1, 0),
(16, 19, 0, 0),
(16, 20, 0, 0),
(17, 1, 1, 0),
(17, 2, 0, 0),
(17, 5, 0, 0),
(17, 6, 0, 0),
(17, 7, 0, 0),
(17, 8, 0, 0),
(17, 10, 1, 0),
(17, 11, 1, 0),
(17, 12, 0, 0),
(17, 13, 1, 0),
(17, 14, 1, 0),
(17, 16, 0, 0),
(17, 18, 0, 0),
(17, 19, 0, 0),
(17, 20, 0, 0),
(18, 2, 0, 0),
(18, 4, 0, 0),
(18, 6, 1, 0),
(18, 8, 0, 0),
(18, 9, 0, 0),
(18, 10, 1, 0),
(18, 11, 0, 0),
(18, 12, 0, 0),
(18, 14, 1, 0),
(18, 15, 1, 0),
(18, 18, 0, 0),
(18, 19, 0, 0),
(18, 20, 1, 0),
(19, 1, 0, 0),
(19, 2, 0, 0),
(19, 4, 1, 0),
(19, 5, 0, 0),
(19, 7, 0, 0),
(19, 8, 0, 0),
(19, 10, 0, 0),
(19, 11, 1, 0),
(19, 12, 0, 0),
(19, 14, 1, 0),
(19, 15, 0, 0),
(19, 16, 0, 0),
(19, 17, 1, 0),
(19, 20, 1, 0),
(20, 2, 0, 0),
(20, 3, 0, 0),
(20, 6, 0, 0),
(20, 8, 1, 0),
(20, 9, 0, 0),
(20, 10, 1, 0),
(20, 11, 0, 0),
(20, 13, 1, 0),
(20, 14, 1, 0),
(20, 16, 0, 0),
(20, 18, 0, 0),
(20, 19, 1, 0),
(21, 1, 1, 0),
(21, 3, 0, 0),
(21, 4, 1, 0),
(21, 5, 0, 0),
(21, 6, 0, 0),
(21, 11, 1, 0),
(21, 12, 0, 0),
(21, 14, 0, 0),
(21, 17, 1, 0),
(21, 18, 1, 0),
(21, 19, 0, 0),
(21, 20, 0, 0),
(22, 1, 0, 0),
(22, 2, 0, 0),
(22, 31, 1, 0),
(22, 40, 1, 0),
(22, 42, 0, 0),
(22, 59, 1, 0),
(22, 75, 0, 0),
(22, 89, 0, 0),
(22, 102, 1, 0),
(22, 108, 1, 0),
(23, 15, 1, 0),
(23, 32, 1, 0),
(23, 40, 0, 0),
(23, 58, 0, 0),
(23, 65, 1, 0),
(23, 75, 0, 0),
(23, 79, 0, 0),
(23, 84, 1, 0),
(23, 107, 1, 0),
(24, 1, 0, 0),
(24, 5, 0, 0),
(24, 7, 1, 0),
(24, 10, 0, 0),
(24, 11, 0, 0),
(24, 13, 0, 0),
(24, 14, 1, 0),
(24, 15, 1, 0),
(24, 16, 0, 0),
(24, 17, 0, 0),
(24, 18, 1, 0),
(24, 19, 0, 0),
(24, 20, 1, 0),
(25, 30, 0, 0),
(25, 40, 0, 0),
(25, 43, 1, 0),
(25, 50, 0, 0),
(25, 51, 1, 0),
(25, 62, 0, 0),
(25, 66, 0, 0),
(25, 91, 1, 0),
(25, 104, 1, 0),
(25, 105, 1, 0),
(26, 1, 0, 0),
(26, 3, 1, 0),
(26, 4, 0, 0),
(26, 6, 0, 0),
(26, 7, 1, 0),
(26, 8, 0, 0),
(26, 10, 1, 0),
(26, 12, 0, 0),
(26, 13, 1, 0),
(26, 14, 0, 0),
(26, 15, 0, 0),
(26, 16, 0, 0),
(26, 19, 1, 0),
(27, 10, 1, 0),
(27, 12, 0, 0),
(27, 13, 1, 0),
(27, 18, 0, 0),
(27, 19, 0, 0),
(27, 20, 0, 0),
(27, 28, 1, 0),
(27, 40, 1, 0),
(27, 47, 1, 0),
(27, 72, 0, 0),
(27, 79, 0, 0),
(28, 14, 1, 0),
(28, 21, 0, 0),
(28, 40, 0, 0),
(28, 42, 1, 0),
(28, 46, 0, 0),
(28, 86, 1, 0),
(28, 88, 1, 0),
(28, 89, 0, 0),
(28, 99, 1, 0),
(28, 118, 0, 0),
(29, 23, 0, 0),
(29, 40, 0, 0),
(29, 49, 1, 0),
(29, 65, 0, 0),
(29, 69, 0, 0),
(29, 74, 1, 0),
(29, 75, 1, 0),
(29, 89, 1, 0),
(29, 117, 1, 0),
(29, 122, 0, 0),
(30, 21, 0, 0),
(30, 40, 1, 0),
(30, 42, 1, 0),
(30, 46, 0, 0),
(30, 53, 0, 0),
(30, 58, 0, 0),
(30, 66, 0, 0),
(30, 80, 1, 0),
(30, 89, 1, 0),
(30, 95, 0, 0),
(30, 97, 0, 0),
(30, 98, 1, 0),
(31, 28, 0, 0),
(31, 33, 0, 0),
(31, 40, 1, 0),
(31, 46, 1, 0),
(31, 58, 1, 0),
(31, 64, 0, 0),
(31, 66, 0, 0),
(31, 73, 1, 0),
(31, 86, 1, 0),
(31, 89, 0, 0),
(31, 110, 0, 0),
(32, 38, 0, 0),
(32, 40, 1, 0),
(32, 58, 0, 0),
(32, 64, 1, 0),
(32, 66, 0, 0),
(32, 67, 1, 0),
(32, 80, 1, 0),
(32, 89, 0, 0),
(32, 95, 0, 0),
(32, 108, 1, 0),
(33, 1, 1, 0),
(33, 2, 0, 0),
(33, 3, 1, 0),
(33, 5, 0, 0),
(33, 6, 0, 0),
(33, 7, 1, 0),
(33, 8, 1, 0),
(33, 9, 0, 0),
(33, 12, 0, 0),
(33, 13, 1, 0),
(33, 14, 0, 0),
(33, 16, 0, 0),
(33, 17, 0, 0),
(33, 18, 0, 0),
(33, 19, 0, 0),
(34, 1, 0, 0),
(34, 3, 0, 0),
(34, 4, 0, 0),
(34, 5, 0, 0),
(34, 7, 0, 0),
(34, 9, 0, 0),
(34, 10, 0, 0),
(34, 11, 0, 0),
(34, 12, 1, 0),
(34, 13, 1, 0),
(34, 14, 1, 0),
(34, 16, 1, 0),
(34, 20, 1, 0),
(35, 2, 1, 0),
(35, 3, 1, 0),
(35, 5, 0, 0),
(35, 6, 0, 0),
(35, 7, 1, 0),
(35, 11, 0, 0),
(35, 12, 1, 0),
(35, 15, 0, 0),
(35, 17, 0, 0),
(35, 18, 0, 0),
(35, 19, 0, 0),
(35, 20, 1, 0),
(36, 10, 1, 0),
(36, 18, 0, 0),
(36, 19, 0, 0),
(36, 28, 1, 0),
(36, 40, 0, 0),
(36, 47, 1, 0),
(36, 56, 0, 0),
(36, 58, 1, 0),
(36, 66, 1, 0),
(36, 72, 0, 0),
(36, 79, 0, 0),
(37, 28, 1, 0),
(37, 38, 0, 0),
(37, 40, 1, 0),
(37, 58, 0, 0),
(37, 64, 1, 0),
(37, 66, 0, 0),
(37, 67, 0, 0),
(37, 80, 0, 0),
(37, 89, 1, 0),
(37, 95, 1, 0),
(37, 108, 0, 0),
(38, 1, 0, 0),
(38, 2, 0, 0),
(38, 5, 0, 0),
(38, 6, 0, 0),
(38, 8, 0, 0),
(38, 10, 0, 0),
(38, 11, 1, 0),
(38, 12, 1, 0),
(38, 13, 0, 0),
(38, 14, 0, 0),
(38, 16, 1, 0),
(38, 17, 1, 0),
(38, 18, 1, 0),
(38, 19, 0, 0),
(39, 4, 0, 0),
(39, 5, 0, 0),
(39, 6, 0, 0),
(39, 8, 1, 0),
(39, 9, 1, 0),
(39, 10, 0, 0),
(39, 11, 1, 0),
(39, 12, 0, 0),
(39, 13, 1, 0),
(39, 14, 0, 0),
(39, 15, 0, 0),
(39, 16, 0, 0),
(39, 19, 1, 0),
(40, 28, 1, 0),
(40, 33, 1, 0),
(40, 46, 0, 0),
(40, 58, 1, 0),
(40, 64, 0, 0),
(40, 66, 1, 0),
(40, 80, 0, 0),
(40, 86, 0, 0),
(40, 89, 0, 0),
(40, 110, 1, 0),
(41, 1, 1, 0),
(41, 2, 0, 0),
(41, 4, 1, 0),
(41, 6, 0, 0),
(41, 7, 0, 0),
(41, 11, 0, 0),
(41, 12, 0, 0),
(41, 13, 0, 0),
(41, 15, 0, 0),
(41, 16, 1, 0),
(41, 19, 1, 0),
(41, 20, 1, 0),
(42, 1, 1, 0),
(42, 2, 1, 0),
(42, 3, 0, 0),
(42, 9, 0, 0),
(42, 11, 0, 0),
(42, 12, 1, 0),
(42, 13, 0, 0),
(42, 15, 1, 0),
(42, 16, 0, 0),
(42, 18, 1, 0),
(42, 19, 0, 0),
(43, 1, 1, 0),
(43, 3, 0, 0),
(43, 4, 1, 0),
(43, 5, 0, 0),
(43, 8, 1, 0),
(43, 9, 0, 0),
(43, 11, 0, 0),
(43, 12, 0, 0),
(43, 13, 0, 0),
(43, 14, 0, 0),
(43, 17, 1, 0),
(43, 20, 1, 0),
(44, 1, 0, 0),
(44, 7, 0, 0),
(44, 8, 0, 0),
(44, 10, 0, 0),
(44, 11, 1, 0),
(44, 12, 1, 0),
(44, 13, 1, 0),
(44, 14, 1, 0),
(44, 18, 0, 0),
(44, 19, 1, 0),
(44, 20, 0, 0),
(45, 1, 1, 0),
(45, 2, 1, 0),
(45, 5, 0, 0),
(45, 6, 0, 0),
(45, 9, 1, 0),
(45, 10, 0, 0),
(45, 12, 1, 0),
(45, 14, 0, 0),
(45, 15, 0, 0),
(45, 16, 1, 0),
(45, 17, 0, 0),
(45, 18, 0, 0),
(45, 19, 0, 0),
(46, 1, 0, 0),
(46, 3, 0, 0),
(46, 4, 1, 0),
(46, 7, 0, 0),
(46, 8, 1, 0),
(46, 11, 1, 0),
(46, 12, 1, 0),
(46, 14, 0, 0),
(46, 15, 0, 0),
(46, 16, 0, 0),
(46, 18, 0, 0),
(46, 19, 1, 0),
(47, 2, 0, 0),
(47, 4, 1, 0),
(47, 7, 0, 0),
(47, 8, 1, 0),
(47, 10, 0, 0),
(47, 12, 1, 0),
(47, 13, 0, 0),
(47, 15, 0, 0),
(47, 16, 1, 0),
(47, 17, 0, 0),
(47, 18, 0, 0),
(47, 19, 0, 0),
(47, 20, 1, 0),
(48, 2, 1, 0),
(48, 4, 0, 0),
(48, 7, 0, 0),
(48, 8, 1, 0),
(48, 9, 0, 0),
(48, 11, 0, 0),
(48, 13, 1, 0),
(48, 14, 1, 0),
(48, 15, 0, 0),
(48, 18, 1, 0),
(48, 20, 0, 0),
(49, 1, 0, 0),
(49, 2, 1, 0),
(49, 31, 0, 0),
(49, 40, 0, 0),
(49, 42, 0, 0),
(49, 59, 1, 0),
(49, 75, 1, 0),
(49, 89, 1, 0),
(49, 102, 1, 0),
(49, 108, 0, 0),
(50, 8, 1, 0),
(50, 40, 0, 0),
(50, 45, 1, 0),
(50, 49, 0, 0),
(50, 55, 0, 0),
(50, 71, 0, 0),
(50, 75, 1, 0),
(50, 89, 1, 0),
(50, 93, 1, 0),
(51, 1, 1, 1),
(51, 2, 1, 2),
(51, 16, 1, 0),
(52, 1, 1, 0),
(64, 2, 1, 0),
(65, 21, 1, 2),
(65, 42, 1, 0),
(65, 46, 1, 3),
(65, 57, 1, 4),
(65, 78, 1, 1),
(69, 1, 1, 2),
(69, 2, 1, 0),
(69, 40, 1, 1),
(69, 42, 1, 3),
(69, 59, 0, 0),
(69, 102, 1, 4);

-- 
-- Вывод данных для таблицы candidate_open_data
--
INSERT INTO candidate_open_data VALUES
(1, 63, 55, '{"email":"vadox.dev@gmail.com","linked_in":"https:\\/\\/www.linkedin.com\\/in\\/someuser-adsfdsafdasf-adfdsafsf-adfadsfadfs-adfafddf","attachment":{"file_name":"3810e673-02e3-4e2d-80e2-322253cccd3d.docx","title":"TestResume.docx"}}', '2021-09-15 15:05:30', '2021-09-15 15:18:55'),
(2, 64, 55, '{"email":"candidate1@gmail.com","attachment":{"file_name":"9c5520ef-cc1b-453a-b09d-64ea06591f66.pdf","title":"Zaklyuchenie_dogovora_po_Platezhnomu_porucheniyu.pdf"}}', '2021-09-16 10:47:21', '2021-10-07 09:04:38'),
(3, 64, 61, '{"email":"candidate1@gmail.com","attachment":{"file_name":"3e664aef-b9bf-4e07-a370-dd4cb68afa89.docx","title":"TestResume.docx"}}', '2021-09-17 10:42:31', '2021-09-17 10:42:31'),
(5, 64, 62, '{"email":"candidate1@gmail.com","attachment":{"file_name":"f7acb746-cbb3-4b96-b8a5-04bb1b803bce.pdf","title":"Zaklyuchenie_dogovora_po_Platezhnomu_porucheniyu.pdf"}}', '2021-10-07 10:28:36', '2021-10-07 10:28:36'),
(6, 63, 62, '{"email":"vadox.dev@gmail.com","attachment":{"file_name":"1251c3d9-f546-4be0-af92-a99802cc1fe4.docx","title":"App1_TZ 18-09.docx"}}', '2021-10-07 18:35:33', '2021-10-07 18:43:25'),
(7, 68, 76, '{"email":"vadox.dev@gmail.com","attachment":{"file_name":"44109cf1-b0b0-41e8-999f-46e8f325ae57.docx","title":"44a44d1018d664612010e29440526b13.docx"}}', '2021-12-14 10:47:26', '2021-12-14 10:47:26'),
(8, 79, 76, '{"email":"vadox.dev@gmail.com","attachment":{"file_name":"44109cf1-b0b0-41e8-999f-46e8f325ae57.docx","title":"44a44d1018d664612010e29440526b13.docx"}}', '2021-12-14 10:47:26', '2021-12-14 10:47:26');

-- 
-- Вывод данных для таблицы candidate_employment_types
--
INSERT INTO candidate_employment_types VALUES
(1, 1),
(2, 1),
(4, 1),
(9, 1),
(10, 1),
(11, 1),
(14, 1),
(23, 1),
(26, 1),
(27, 1),
(31, 1),
(35, 1),
(38, 1),
(40, 1),
(41, 1),
(43, 1),
(46, 1),
(49, 1),
(51, 1),
(52, 1),
(66, 1),
(69, 1),
(1, 2),
(2, 2),
(4, 2),
(6, 2),
(11, 2),
(14, 2),
(24, 2),
(26, 2),
(30, 2),
(31, 2),
(38, 2),
(40, 2),
(43, 2),
(52, 2),
(66, 2),
(69, 2),
(4, 3),
(6, 3),
(9, 3),
(10, 3),
(11, 3),
(14, 3),
(23, 3),
(24, 3),
(26, 3),
(27, 3),
(30, 3),
(31, 3),
(35, 3),
(38, 3),
(40, 3),
(41, 3),
(46, 3),
(49, 3),
(66, 3),
(69, 3),
(1, 4),
(2, 4),
(6, 4),
(9, 4),
(10, 4),
(23, 4),
(24, 4),
(27, 4),
(30, 4),
(35, 4),
(41, 4),
(43, 4),
(46, 4),
(49, 4),
(3, 5),
(5, 5),
(7, 5),
(8, 5),
(12, 5),
(13, 5),
(15, 5),
(16, 5),
(17, 5),
(18, 5),
(19, 5),
(20, 5),
(21, 5),
(22, 5),
(25, 5),
(28, 5),
(29, 5),
(32, 5),
(33, 5),
(34, 5),
(36, 5),
(37, 5),
(39, 5),
(42, 5),
(44, 5),
(45, 5),
(47, 5),
(48, 5),
(50, 5),
(64, 5),
(65, 5);

-- 
-- Вывод данных для таблицы candidate_cities
--
INSERT INTO candidate_cities VALUES
(14, 80),
(26, 80),
(39, 80),
(45, 80),
(47, 80),
(11, 170),
(13, 170),
(17, 170),
(23, 170),
(42, 170),
(48, 170),
(2, 183),
(3, 183),
(17, 183),
(20, 183),
(48, 183),
(20, 276),
(24, 276),
(34, 276),
(40, 276),
(50, 276),
(10, 345),
(11, 345),
(18, 345),
(41, 345),
(15, 353),
(37, 353),
(44, 353),
(49, 353),
(50, 353),
(4, 357),
(35, 357),
(37, 357),
(49, 357),
(24, 466),
(34, 466),
(27, 503),
(30, 503),
(2, 531),
(4, 531),
(37, 531),
(8, 605),
(21, 605),
(32, 605),
(44, 605),
(51, 605),
(52, 605),
(65, 605),
(66, 605),
(69, 605),
(10, 648),
(28, 648),
(36, 648),
(41, 648),
(42, 648),
(24, 666),
(38, 666),
(49, 666),
(6, 673),
(36, 673),
(5, 710),
(9, 710),
(19, 710),
(32, 710),
(42, 714),
(1, 786),
(9, 786),
(18, 786),
(44, 786),
(17, 808),
(19, 808),
(25, 808),
(6, 827),
(15, 827),
(18, 827),
(19, 827),
(35, 827),
(66, 827),
(8, 844),
(33, 844),
(2, 952),
(9, 952),
(21, 952),
(28, 952),
(50, 952),
(7, 967),
(10, 967),
(21, 967),
(15, 978),
(31, 978),
(43, 978),
(12, 1013),
(14, 1024),
(16, 1024),
(32, 1024),
(41, 1024),
(46, 1024),
(39, 1044),
(5, 1047),
(22, 1047),
(20, 1107),
(38, 1107),
(40, 1107),
(26, 1108),
(29, 1108);

-- 
-- Вывод данных для таблицы addresses
--
INSERT INTO addresses VALUES
(1, 'App\\Models\\Auth\\User', 8, 'swift', '', 216, 'Ukraine', NULL, NULL, NULL, NULL, 'Melitipol, Yaltinskaya, 86', NULL, NULL, NULL, 'Test', 'Recruiter', '', '', NULL, '', '', '2021-08-24 16:23:23', '2021-08-25 11:58:01'),
(3, 'App\\Models\\Auth\\User', 8, 'invoice', '', NULL, '', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 'Test', 'Recruiter', '', '', NULL, '501212395324', '', '2021-08-24 17:00:32', '2021-08-25 08:16:16'),
(4, 'App\\Models\\Auth\\User', 8, 'card', '', NULL, '', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 'Test', 'Recruiter', '', 'vadox.test@gmail.com', NULL, '', '', '2021-08-26 09:02:04', '2021-08-26 09:02:04'),
(5, 'App\\Models\\Auth\\User', 55, 'invoice', '', NULL, '', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 'Крачулов', 'Вадим', '', '', NULL, '3086013976', '', '2021-09-16 08:56:26', '2021-10-08 15:51:34'),
(6, 'App\\Models\\Auth\\User', 55, 'swift', '', 172, 'Russia', NULL, NULL, NULL, NULL, 'фваывфа', NULL, NULL, NULL, 'Кываыв', 'ФВА', '', '', NULL, '', '', '2021-09-16 09:06:24', '2021-10-08 15:52:11'),
(7, 'App\\Models\\Auth\\User', 62, 'invoice', '', NULL, '', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 'Vadim', 'Krachulove', '', '', NULL, '3086013976', '', '2021-10-07 11:33:22', '2021-10-07 11:33:22'),
(8, 'App\\Models\\Auth\\User', 55, 'card', '72311', NULL, '', NULL, NULL, NULL, NULL, 'Ялтинская, 86', NULL, NULL, NULL, 'Вадим', 'Крачулов', '+380978623299', 'vadox.dev@gmail.com', NULL, '', '', '2021-10-15 10:25:11', '2021-10-15 10:29:28'),
(9, 'App\\Models\\Auth\\User', 76, 'invoice', '', NULL, '', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 'Test', NULL, '', '', NULL, '380978623299', '', '2021-11-01 09:24:00', '2021-11-01 09:24:00'),
(10, 'App\\Models\\Auth\\User', 76, 'card', '72311', NULL, '', NULL, NULL, NULL, NULL, 'Ялтинская, 86', NULL, NULL, NULL, 'Вадим', 'Крачулов', '+380978623299', 'vadox.dev@gmail.com', NULL, '', '', '2021-11-01 09:46:01', '2021-11-01 09:51:42');

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
--
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;