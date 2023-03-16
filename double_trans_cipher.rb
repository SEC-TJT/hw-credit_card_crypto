# frozen_string_literal: true

# implement the double transposition cipher
module DoubleTranspositionCipher
  def self.encrypt(document, key)
    # TODO: FILL THIS IN!
    x, y = find_rows_cols(document.size)
    matrix = to_matrix(document, x, y)
    matrix = rowchange(matrix, generate_permutation(x, key))
    matrix = matrix.transpose
    matrix = rowchange(matrix, generate_permutation(y, key + x))
    matrix = matrix.transpose
    to_string(matrix)
    ## Suggested steps for double transposition cipher
    # 1. find number of rows/cols such that matrix is almost square
    # 2. break plaintext into evenly sized blocks
    # 3. sort rows in predictibly random way using key as seed
    # 4. sort columns of each row in predictibly random way
    # 5. return joined cyphertext
  end

  def self.decrypt(ciphertext, key)
    # TODO: FILL THIS IN!
    x, y = find_rows_cols(ciphertext.size)
    matrix = to_matrix(ciphertext, x, y)
    matrix = matrix.transpose
    matrix = recover_rowchange(matrix, generate_permutation(y, key + x))
    matrix = matrix.transpose
    matrix = recover_rowchange(matrix, generate_permutation(x, key))
    to_string(matrix)
  end

  def self.to_string(arr)
    arr.map(&:join).join
  end

  def self.to_matrix(str, x, y)
    matrix = Array.new(x) { Array.new(y) }
    (0..x - 1).to_a.each do |i|
      (0..y - 1).to_a.each do |j|
        matrix[i][j] = str[i * y + j]
      end
    end
    matrix
  end

  def self.find_rows_cols(size)
    (1..size).to_a.each do |i|
      return i, size / i if i * i >= size && (size % i).zero?
    end
  end

  def self.rowchange(arr, order)
    change_arr = Array.new(arr.size) { Array.new(arr[0].length) }
    arr.each_with_index do |_row, i|
      change_arr[i] = arr[order[i] - 1]
    end
    change_arr
  end

  def self.recover_rowchange(arr, order)
    plain_arr = Array.new(arr.size) { Array.new(arr[0].length) }
    plain_arr.each_with_index do |_row, i|
      plain_arr[order[i] - 1] = arr[i]
    end
    plain_arr
  end

  def self.generate_permutation(size, key)
    srand(key)
    (1..size).to_a.shuffle(random: Random.new(key % 23))
  end
end
