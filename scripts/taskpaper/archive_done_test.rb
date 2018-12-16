require 'minitest/autorun'
require './archive_done'

class TaskpaperArchiveDoneTest < Minitest::Test
  def test_returns_new_content_with_no_done_things_and_archive_with_done_things
    content = [
      "Life:",
      "\tget one",
      "\t",
      "Programming:",
      "\t- read books @done",
      "\t\t- Clean Code",
      "\t- contribue",
      "\t- do courses",
      "\t\t- ruby @done",
      "\t\t- elixir",
      "\t- eat lunch",
      "\t",
      "",
      "Other:",
      "\t- buy milk"
    ].join("\n")

    expected_new_content = [
      "Life:",
      "\tget one",
      "\t",
      "Programming:",
      "\t- contribue",
      "\t- do courses",
      "\t\t- elixir",
      "\t- eat lunch",
      "\t",
      "",
      "Other:",
      "\t- buy milk"
    ].join("\n")

    expected_archive = [
      "Programming:",
      "\t- read books @done",
      "\t\t- Clean Code",
      "\t- do courses",
      "\t\t- ruby @done"
    ].join("\n")

    new_content, archive = Taskpaper::ArchiveDone.call(content)

    assert_equal(new_content, expected_new_content)
    assert_equal(archive, expected_archive)
  end
end
