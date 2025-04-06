# psql_l2_a7

<!-- QA -->

1.What is PostgreSQL?
Ans: Postgres SQL হল একটি Objecet oriented database management system(ORDBM)
যা Relational and non relational query উভয় সাপোর্ট করে।

2.What is the purpose of a database schema in PostgreSQL?
একই সাথে একাধিক ইউজার যাতে সিকিউরিটির সাথে একটা ডাটাবেইজ ব্যাবহার করতে পারে , এটিই হল স্কিমা ব্যাবহারের উদ্দেশ্য। স্কিমা একটা ডাটাবেজকে বিভিন্ন টেবিল,কলাম, ভিউ আকারে অর্গানাইজ করে রাখে এবং ইউজারকে বেটার ম্যানেজমেন্ট, বেটার সিকিউরিটি প্রদান করে.

3.Explain the Primary Key and Foreign Key concepts in PostgreSQL.
প্রাইমারি কী হওয়ার শর্ত হল, ইউনিক হতে হবে, স্টেবল হতে হবে এবং নাল হতে পারবেনা। কোনো কী'র মধ্যে যদি এই বৈশিষ্ট্য গুলো থাকে তাহলে সেটা প্রাইমারি কী হিসেবে বিবেচিত হবে।

ফরেন কী হল: যখন একটা টেবিলের প্রাইমারি কী অন্য একটা টেবিলে রেফারেন্স হিসেবে ব্যাবহৃত হয়, তখন সেই রেফারেন্স কী কে ফরেন কী বলে.

4.VARCHAR & CHAR ডাটা টাইপের মধ্যে মূল পার্থক্য হল, VARCHAR -
১. ভেরিয়েবলে যতটুকু ততটুকু যায়গা স্টোর করে। ঠিকানা বা ডেসক্রিপশনেন জন্য ব্যাবহার করা হয়।

CHAR -
১. ফিক্সড লেন্থের ভেরিয়েবল স্টোর করে এবং খালি যায়গা স্পেস দিয়ে পূর্ণ করে। পিন নাম্বার, স্টাটাস ইত্যাদিতে ব্যাবহার হয়.

5.Explain the purpose of the WHERE clause in a SELECT statement.
সিলেক্ট ক্লজের মধ্যে Where ক্লজ ব্যাবহারের উদ্দেশ্য হল, এটি শুধুমাত্র ঐ ডাটকেই শো করাবে যেটা স্পেসিফিক কোনো একটা কন্ডিশন বা ক্রাইটেরিয়ার সাথে যাবে.

6.What are the LIMIT and OFFSET clauses used for?
লিমিট ক্লজ -যতগুলো ডাটা দরকার ততোগুলোই রিটার্ন করবে।
অফসেট ক্লজ হল - ডাটা রিটার্ন করার আগে কতগুলো ডাটা স্কিপ করতে হবে সেটা বোঝায়

7.How can you modify data using UPDATE statements?
UPDATE স্টেটমেন্ট ব্যাবহার করে কোনো একটা এক্সিস্টিং রো এর ডাটা কে  আপডেট করা যায়।

8.What is the significance of the JOIN operation, and how does it work in PostgreSQL?
জয়েন অপারেশন করা হয় মুলত মাল্টিপল টেবিলের ডাটাকে একত্রিত করার জন্য। বিভিন্ন টেবিলের মধ্যে কোনো একটা স্পেসিফিক কন্ডিশনের উপর ভিত্তি ম্যাচিং ডাটাুলোকে খুঁজে পেতে জয়েন অপারেশন ব্যাবহার করা হয়.

9.Explain the GROUP BY clause and its role in aggregation operations.
Group by ক্লজটি সাধারণত এক বা একাধিক কলামের মান অনুযায়ী ডাটার গ্রুপ তৈরি করে।এর মাধ্যমে একই ধরনের মানের উপর এগ্রিগেশন চালাতে সুবিধা হয়.

10.How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?
postgres SQL এ এগ্রিগেট ফাংশন গুলো সিলেক্ট ক্লজ বা গ্রুপ বাই ক্লজের সাথে ক্যালকুলেট করা যায়
