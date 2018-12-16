require 'minitest/autorun'
require './archive_done'

class TaskpaperArchiveDoneTest < Minitest::Test
  def test_returns_new_content_with_no_done_things_and_archive_with_done_things
    content = [
      "Life:",
      "  get one",
      "  ",
      "Programming:",
      "  - read books @done",
      "    - Clean Code",
      "  - do courses",
      "    - ruby @done",
      "    - elixir",
      "  - eat lunch",
      "  ",
      "  ",
      "Other:",
      "  - buy milk"
    ].join("\n")

    expected_new_content = [
      "Life:",
      "  get one",
      "  ",
      "Programming:",
      "  - do courses",
      "    - elixir",
      "  - eat lunch",
      "  ",
      "  ",
      "Other:",
      "  - buy milk"
    ].join("\n")

    expected_archive = [
      "Programming:",
      "  - read books @done",
      "    - Clean Code",
      "  - do courses",
      "    - ruby @done"
    ].join("\n")

    new_content, archive = Taskpaper::ArchiveDone.call(content)

    assert_equal(new_content, expected_new_content)
    assert_equal(archive, expected_archive)
  end
end
