# MySQL Crash Course: A Hands-On Introduction to Database Development

A chapter-by-chapter exploration of relational database development based on *MySQL Crash Course* by Rick Silva. Covers SQL fundamentals, data modeling, database objects, and real-world projects using MySQL 8.0.

<!-- Replace the src below with your uploaded GitHub image URL -->
<img width="626" height="825" alt="MySQL Crash Course book cover" src="YOUR_IMAGE_URL_HERE" />

---

## Chapters Covered

**Part I — Getting Started**
- ✅ Installing MySQL and Tools
- ✅ Creating Databases and Tables

**Part II — Selecting Data from a MySQL Database**
- ✅ Introduction to SQL
- ✅ MySQL Data Types
- 🟠 Joining Database Tables
- 🟠 Performing Complex Joins with Multiple Tables
- 🔴 Comparing Values
- 🔴 Calling Built-in MySQL Functions
- 🔴 Inserting, Updating, and Deleting Data

**Part III — Database Objects**
- 🔴 Creating Views
- 🔴 Creating Functions and Procedures
- 🔴 Creating Triggers
- 🔴 Creating Events

**Part IV — Advanced Topics**
- 🔴 Tips and Tricks
- 🔴 Calling MySQL from Programming Languages

**Part V — Projects**
- 🔴 Building a Weather Database
- 🔴 Tracking Changes to Voter Data with Triggers
- 🔴 Protecting Salary Data with Views

---

## Project Overview

The goal of this project was to build a solid, practical understanding of relational databases and SQL from the ground up — not just how to write queries, but *why* they work the way they do.

### Part I & II: The Foundation (Thinking in Tables)
- **Databases and Tables:** Designing schemas and understanding how data is structured into rows and columns with enforced types.
- **SQL Querying:** Writing `SELECT` statements to filter, sort, and retrieve data — including handling `NULL` values and commenting SQL code for clarity.
- **Joins:** Connecting multiple tables together to answer questions that span across related data, including complex multi-table joins using subqueries, CTEs, and derived tables.
- **Built-in Functions:** Leveraging MySQL's library of functions for string manipulation, date arithmetic, and aggregations.

### Part III & IV: Database Objects and Advanced Usage
- **Views:** Creating virtual tables that simplify complex queries and can be used to restrict access to sensitive columns.
- **Stored Procedures and Functions:** Writing reusable, parameterized SQL routines that live inside the database itself.
- **Triggers:** Automating actions that fire in response to data changes — useful for auditing, enforcing rules, and preventing bad data.
- **Events:** Scheduling SQL code to run automatically at set intervals, like a cron job built into the database.
- **Calling MySQL from Code:** Integrating MySQL with PHP, Python, and Java to understand how databases fit into a broader application stack.

### Part V: Projects
- **Weather Database:** Designing and populating a database from scratch to track weather data.
- **Voter Data with Triggers:** Using triggers to audit and prevent errors in an election database.
- **Salary Data with Views:** Using views and permission controls to protect sensitive employee information.

---

## Personal Takeaways

Before this book, I had a surface-level awareness of databases — I knew they existed behind every application, but I had no real understanding of what was happening inside them. *MySQL Crash Course* changed that.

Starting with the basics of tables and data types, I built up a mental model of how relational databases are actually structured: data organized into rows and columns, relationships enforced through foreign keys, and information spread across multiple tables that you stitch back together with joins. That last part — joins — was the biggest conceptual shift for me. Understanding how to combine related tables to answer real questions made the whole relational model click.

The sections on database objects were particularly eye-opening. The idea that logic — procedures, functions, triggers, and scheduled events — can live *inside the database itself*, rather than only in application code, was something I hadn't considered before. It completely changed how I think about where business rules belong in a system.

By the end, I had gone from someone who couldn't write a SQL query to someone who could design a schema, query it confidently, automate behavior with triggers and events, and think about access control through views. The three final projects tied everything together in a way that felt real and satisfying.

The commits in this repository reflect that journey, chapter by chapter.
