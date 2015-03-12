def call_block(&block)
	block.call(1)
	block.call(2)
	block.call(3)
end
proc_1 = Proc.new { |i| puts "#{i}: Blocks are cool!"}
proc_2 = lambda { |i| puts "#{i}: lambda are cool!"}

call_block(&proc_1)
call_block(&proc_2)