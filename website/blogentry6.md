
The "In" Crowd: An Introduction to the Ruby group_by Method

One of the most important parts of solving any data-driven problem is getting your data into a useable format. A method like group_by is a extremeley clean way to start dividing up data into useful parts.

Let's start simple. You introductory level Ruby student and you're given an array filled with different Ruby objects and asked to identify them. Maybe you've been a little naughty about memorizing the syntax of each object and can't really identify them by sight. Or perhaps there are just so many entries and you just want to use the arrays for now. Well let's try it out.

my_data1 = [1, "b", [2,3], {a: 1, b: 2}, 3, "d"]

my_organized_data1 = my_data1.group_by {|i| i.class}

print my_organized_data1
puts

#OUTPUT#
{Fixnum=>[1, 3], String=>["b", "d"], Array=>[[2, 3]], Hash=>[{:a=>1, :b=>2}]}

In this instance group_by arranges all of my information so that I can see what's there. It's also really easy now to extract whatever data I need.

Let's take a a second to talk about what group_by is actually doing. I call it on an array and feed it a block of code. The output to this block of code is going to be the key for the hash. The values will correspond to each element in my original array. Each element that returns the same output when run through the block will be paired with the same key. In this example, the block checked each elements class. Thus each element was organized by the output of calling class on itself.

Now let's try one more example that is maybe a little more applicable to the real world. Say you're a teacher and you've calculated all of your students grades and you want to see how your class is doing. Try this on for size:

my_data2 = [90, 92, 77, 75, 88, 99, 82]

my_organized_data2 = my_data2.group_by {|i| (i/10)}

print my_organized_data2
puts

#OUTPUT#
{9=>[90, 92, 99], 7=>[77, 75], 8=>[88, 82]}

Because I know that dividing into integers in Ruby is going to return an integer, I can divide by 10 and have my class organized by A, B, C students.

Both of these examples, for the purpose of this introduction, have included rather small datasets. Group_by is going to be an even better friend to you as your data becomes more overwhelming. Doing good work with data is always going to rely on your ability to organize it, so make sure to make friends with this little function to keep your work clean.