require 'benchmark'

n = 50000
Benchmark.bm(7) do |x|
  x.report("for:")   { for i in 1..n; a = "1"; end }
  x.report("times:") { n.times do   ; a = "1"; end }
  x.report("upto:")  { 1.upto(n) do ; a = "1"; end }
end

Benchmark.bm do |r|
  N = 100000

  r.report("+= ") do
    s = ""
    N.times { s += "1" }
  end

  r.report("<< ") do
    s = ""
    N.times { s << "1" }
  end
end
