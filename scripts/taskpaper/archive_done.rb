require 'ostruct'

module Taskpaper
  class ArchiveDone
    def self.call(content)
      self.new(content).call
    end

    def initialize(content)
      @content = content
    end

    def call
      doit
    end

    private

    def doit
      lines = @content.split("\n").map do |line_content|
        OpenStruct.new({
          content: line_content,
          is_done: line_content.include?("@done")
        })
      end

      lines = lines.to_enum.with_index.map do |line, index|
        if line[:is_done]
          line.to_archive = true
          line.to_delete = true

          i = 1
          loop do
            next_line = lines[index + i]
            break unless next_line
            break unless is_child(line, next_line)
            next_line.to_archive = true
            next_line.to_delete = true
            i += 1
          end

          i = 1
          loop do
            prev_line = lines[index - i]
            break unless prev_line
            break unless is_parent(line, prev_line)
            prev_line.to_archive = true
            i += 1
          end
        end
        line
      end

      new_content = lines.reject(&:to_delete).map(&:content).join("\n")
      archive = lines.select(&:to_archive).map(&:content).join("\n")

      [new_content, archive]
    end

    def is_child(line, other_line)
      line.content.match(/^ */)[0].length < other_line.content.match(/^ */)[0].length
    end

    def is_parent(line, other_line)
      line.content.match(/^ */)[0].length > other_line.content.match(/^ */)[0].length
    end
  end
end
