require_relative './node'

class LinkedList

    attr_accessor :head

    def initialize 
        head = nil
    end

    def prepend(node)
        node.next_node = head
        self.head = node
    end

    def append(node)
        if head.nil?
            self.head = node
            return
        end

        last_node = head

        while last_node.next_node
            last_node = last_node.next_node
        end

        last_node.next_node = node
    end

    def delete_head 
        self.head = head.next_node unless head.nil?
    end

    def delete_tail
        return if head.nil?

        if head.next_node.nil?
            self.head = nil
            return
        end


        second_last_node = head

        while second_last_node.next_node.next_node
            second_last_node = second_last_node.next_node
        end

        second_last_node.next_node = nil
    end

    def add_after(after, node)
        current_node = head
        node_index = 0

        while current_node.next_node

            if after == node_index
                break;
            end
            current_node = current_node.next_node
            node_index += 1

        end

        node.next_node = current_node.next_node
        current_node.next_node = node
    end

    def search(value)
        node = head
        while node
            return node if node.data == value
            node = node.next_node
        end
        nil
    end


end
