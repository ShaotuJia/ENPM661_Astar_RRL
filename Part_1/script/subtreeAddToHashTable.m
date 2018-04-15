% @file subtreeAddToHashTable.m
% @brief This function is to add subtree to hashtable

function hashtable = subtreeAddToHashTable(subtree, hashtable)

    if isempty(subtree)
        return;
    else
        for n = 1 : length(subtree)
            hashtable.put(subtree(n).info, num2str(subtree(n).coordinate));
        end
    end

end

