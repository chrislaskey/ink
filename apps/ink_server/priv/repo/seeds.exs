# Script for populating the database. You can run it as:
#
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     InkServer.Repo.insert!(%InkServer.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# alias InkServer.User
# alias InkServer.Note
# alias InkServer.Repo

# Repo.insert!(%User{name: "John", email: "john@example.com"})
# Repo.insert!(%User{name: "Beth", email: "beth@example.com"})

# Enum.map(1..10, fn(_) ->
#   Repo.insert(%Note{
#     secret: Secret.create,
#     title: Faker.Lorem.sentence,
#     body: Faker.Lorem.paragraph,
#     user_id: [1, 2] |> Enum.take_random(1) |> hd
#   })
#     |> Note.add_uid
#     |> Repo.update
# end)

### Alternative way using a Module to organize code:

# defmodule InkServer.Seeds do
#   def generate_notes() do
#     InkServer.Repo.insert!(%Note{
#       title: Faker.Lorem.sentence,
#       body: Faker.Lorem.paragraph,
#       user_id: [1, 2] |> Enum.take_random(1) |> hd
#     })
#   end
# end

# Long form:
# Enum.map(1..10, fn(_) -> InkServer.Seeds.generate_notes(_) end)

# Short form (using & syntax):
# Enum.map(1..10, &InkServer.Seeds.generate_notes(&1))

### Alternative way using `for`:

# for _ <- 1..10 do
#   Repo.insert!(%Note{})
# end
