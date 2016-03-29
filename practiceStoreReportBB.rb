require 'prawn'

#
# Fills the background of the box you're in
#
def fill_bg_color color
	float do
		fill_color color
		fill_rectangle [0, bounds.height], bounds.width, bounds.height
		fill_color "000000"
	end
end

def checkbox_question answer, cursorPos

	widthOfCheckbox = 18
	xPosOfCheckbox = 209

	widthOfShortAnswer = 324
	xPosOfShortAnswer = 227

	move_cursor_to(cursorPos)

	# checkbox 2
	bounding_box([xPosOfCheckbox, cursorPos], :width => widthOfCheckbox) do

		move_down 5
		text "@"
		#stroke_bounds

		# move cursor so bounding boxes will be in same row
		cursorPos += bounds.height
	end

	move_cursor_to(cursorPos)

	# answer 2
	bounding_box([xPosOfShortAnswer, cursorPos], :width => widthOfShortAnswer) do

		move_down 5
		text answer
		#stroke_bounds

		# move cursor down for next checkbox
		cursorPos -= bounds.height
	end

end

def build_page firstLayer

	widthOfQuestionTitle = 485
	widthOfQuestionScore = 65

	widthOfQuestionNumber = 18
	widthOfShortQuestion = 190
	widthOfCheckbox = 18
	widthOfShortAnswer = 324
	widthOfLongQandA = 534

	xPosOfQuestionNumber = 0
	xPosOfShortQuestion = 18
	xPosOfCheckbox = 209
	xPosOfShortAnswer = 227
	xPosOfLongQandA = 16

	font_size(9)

	#
	# Need to duplicate so that the content isn't covered by the filled rectangles
	#

	bounding_box([0, cursor], :width => 550) do

		# page heading
		bounding_box([0, cursor], :width => 550, :height => 50) do

			bounding_box([0, cursor], :width => widthOfQuestionTitle, :height => 50) do

				move_down 18
				indent(5) do
					font_size(15) { text "<b>B. Discover Needs</b>", :color => "ffffff", :inline_format => true }
				end
			end

			bounding_box([widthOfQuestionTitle, 50], :width => widthOfQuestionScore, :height => 50) do

				move_down 18
				font_size(12) {text "<b>8/16 | 50%</b>", :color => "ffffff", :inline_format => true}
			end

			#fill_color "30abdf"
			#stroke_bounds

			if (firstLayer)
				fill_bg_color "30abdf"
			end

		end

		# points row
		bounding_box([0,cursor], :width => 550) do

			move_down 5
			font_size(10) {text "Points", :color => "30abdf", :align => :right}

			if (firstLayer)
				fill_bg_color "ffffff"
			end

		end


		# checkbox question
		bounding_box([0, cursor], :width => 550) do

			cursorPos = cursor

			# question number
			bounding_box([xPosOfQuestionNumber,0], :width => widthOfQuestionNumber) do


				move_down 5
				indent(3) do
					text "B1"
				end
				#stroke_bounds

				# move cusor so all bounding boxes are in the same row
				cursorPos += bounds.height
			end

			move_cursor_to(cursorPos)

			# question
			bounding_box([xPosOfShortQuestion, cursorPos], :width => widthOfShortQuestion) do

				move_down 5
				text "<b>What question did the salseperson ask?</b>", :inline_format => true
				#stroke_bounds

			end

			checkbox_question "General question(s) on how I would use the product", cursorPos
			checkbox_question "Where I would use the product: home, office, on the go, etc.", cursorPos
			checkbox_question "If anyone else would use the product: family, friends, etc.", cursorPos
			checkbox_question "Questions about my work, studies, or hobbies", cursorPos
			checkbox_question "Questions about sepcific uses, such as email, Internet, phones, etc.", cursorPos
			checkbox_question "How I use other technology, such as current computer or smartphone", cursorPos
			checkbox_question "What type of computer I use (Apple Mac or Windows PC", cursorPos
			checkbox_question "If I own any other Apple products (iPod, iPhone, or iPad)", cursorPos

			#stroke_bounds

			if (firstLayer)
				fill_bg_color "ffffff"
			end

		end


		# extra question info
		bounding_box([0,cursor], :width => 550) do

			move_down 5
			text "Here is some basic information about this section."

			#stroke_bounds

			if (firstLayer)
				fill_bg_color "ffffff"
			end

		end

		# basic question
		bounding_box([0,cursor], :width => 550) do

			cursorPos = cursor

			# question number
			bounding_box([xPosOfQuestionNumber,0], :width => widthOfQuestionNumber) do

				move_down 5
				text "B1"
				#stroke_bounds

				# move cusor so all bounding boxes are in the same row
				if (bounds.height != cursorPos) 
					cursorPos += bounds.height
				end

			end

			move_cursor_to(cursorPos)

			# question
			bounding_box([xPosOfShortQuestion, cursorPos], :width => widthOfShortQuestion) do

				move_down 5
				text "This is a basic question"
				#text "This is a basic question. What do we do if this question is realllllllllllllly long?"
				#stroke_bounds

				# move cusor so all bounding boxes are in the same row
				if (bounds.height != cursorPos) 
					cursorPos += bounds.height
				end

			end

			move_cursor_to(cursorPos)

			# checkbox
			bounding_box([xPosOfCheckbox, cursorPos], :width => widthOfCheckbox) do

				move_down 5
				text "!"
				#stroke_bounds

				# move cusor so all bounding boxes are in the same row
				#if (bounds.height != cursorPos) 
				#	cursorPos += bounds.height
				#end

			end

			#move_cursor_to(cursorPos)

			# answer
			bounding_box([xPosOfShortAnswer, cursorPos], :width => widthOfShortAnswer) do

				move_down 5
				text "General question(s) on how I would use the product"
				#stroke_bounds

				#move cursor down for next question
				cursorPos -= bounds.height
			end

			move_cursor_to(cursorPos)

			#stroke_bounds

			if (firstLayer)
				fill_bg_color "f3f9fd"
			end

		end

		# descriptive question
		bounding_box([0,cursor], :width => widthOfQuestionNumber) do

			cursorPos = cursor

			# question number
			bounding_box([0,cursor], :width => widthOfQuestionNumber) do

				move_down 5
				text "B3"
				#stroke_bounds

				cursorPos += bounds.height

			end

			move_cursor_to(cursorPos)

			# question description
			bounding_box([xPosOfLongQandA, cursor], :width => widthOfLongQandA) do

				move_down 5
				text "This is a long descriptive question. It will usually ask the user to desribe something he or she observed. This question will also include topics to touch on while answering the question"
				#stroke_bounds

			end

			# question answer
			bounding_box([xPosOfLongQandA,cursor], :width => widthOfLongQandA) do

				move_down 5
				text "This is a long descriptive question. We would guess that these answers are up to 250 words in the length. These answers go into great detail about the observations noted by the man or woman. We need to be prepared for formatting issuses as these answers will definitely span more than one row"
				#stroke_bounds

			end

			#stroke_bounds

			if (firstLayer)
				fill_bg_color "f3f9fd"
			end

		end

		stroke_bounds

		move_cursor_to(bounds.height)

	end

end

# generate pdf using bounding box

Prawn::Document::generate("generatedPracticeReport.pdf") do 

	stroke_axis

	build_page true
	build_page false

end


# ISSUES:
# 1) When any single entry spans more than one row, the formatting goes crazy
# 2) Stroke thickness on border
# 3) Font and font size
# 4) PADDING








