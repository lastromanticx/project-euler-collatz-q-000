def even_next(n)
  n / 2
end

def odd_next(n)
  n * 3 + 1
end

def next_value(n)
  if n & 1 == 1
    odd_next(n)
  else 
    even_next(n)
  end
end

def collatz(n)
  s = []

  while n != 1
    s.push(n)
    n = next_value(n)
  end

  s + [1]
end

$h = {1 => 1}

def collatz_length(n)
  if $h.has_key?(n)
    $h[n]
  else
    $h[n] = 1 + collatz_length(next_value(n))
    $h[n]
  end
end

def longest_collatz
  best = 1
  start = 1
  n = 1

  while n < 1000000
    current = collatz_length(n)
    if current > best
      best = current
      start = n
    end

    n += 1
  end  

  start
end

