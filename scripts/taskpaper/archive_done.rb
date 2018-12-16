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
      lines = @content.split("\n").to_enum.with_index.map do |line_content, index|
        OpenStruct.new({
          index: index,
          content: line_content,
          is_done: line_content.include?("@done")
        })
      end

      lines = lines.to_enum.with_index.map do |line, index|
        if line[:is_done]
          line.to_archive = true
          line.to_delete = true

          # Mark all children
          i = 1
          loop do
            next_line = lines[index + i]
            break unless next_line
            break unless is_child(line, next_line)
            next_line.to_archive = true
            next_line.to_delete = true
            i += 1
          end

          # Mark parent, and parent-parent, etc., up to the top
          parent_line = line
          loop do
            parent_line = find_parent(lines, parent_line)
            break unless parent_line
            parent_line.to_archive = true
          end
        end
        line
      end

      new_content = lines.reject(&:to_delete).map(&:content).join("\n")
      archive = lines.select(&:to_archive).map(&:content).join("\n")

      [new_content, archive]
    end

    def is_child(line, other_line)
      line.content.match(/^\s*/)[0].length < other_line.content.match(/^\s*/)[0].length
    end

    def is_parent(line, other_line)
      line.content.match(/^\s*/)[0].length > other_line.content.match(/^\s*/)[0].length
    end

    def find_parent(lines, line)
      i = line.index - 1
      loop do
        break if i < 0
        prev_line = lines[i]
        if is_parent(line, prev_line)
          return prev_line
        end
        i -= 1
      end
      nil
    end

  end
end
