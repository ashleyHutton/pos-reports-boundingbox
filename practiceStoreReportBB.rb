require 'prawn'

#
# Fills the background of the box you're in
#
def fill_bg_color color
	float do
		fill_color color
		fill_rectangle [0, bounds.height], bounds.width, bounds.height
		stroke_color "000000"
	end
end


# generate pdf using bounding box

Prawn::Document::generate("generatedPracticeReport.pdf") do 

	stroke_axis

	fill_bg_color "30abdf"

end





def build_page firstLayer

	widthOfQuestionNumber = 16
	widthOfShortQuestion = 192
	widthOfCheckbox = 18
	widthOfShortAnswer = 324
	widthOfLongQandA = 534

	xPosOfQuestionNumber = 0
	xPosOfShortQuestion = 16
	xPosOfCheckbox = 209
	xPosOfShortAnswer = 227
	xPosOfLongQandA = 16

	#
	# Need to duplicate so that the content isn't covered by the filled rectangles
	#

	bounding_box([0, cursor], :width => 550) do

		# page heading
		bounding_box([0, cursor], :width => 550, :height => 50) do

			move_down 10
			indent(10) do
				font_size(25) { text "Question Title" }
			end

			#fill_color "30abdf"
			#stroke_bounds

		end

		# extra question info
		bounding_box([0,cursor], :width => 550) do

			text "Here is some basic information about this section."

			#stroke_bounds

		end

		# basic question
		bounding_box([0,cursor], :width => 550) do

			cursorPos = cursor

			# question number
			bounding_box([xPosOfQuestionNumber,0], :width => widthOfQuestionNumber) do

				text "1"
				#stroke_bounds

				# move cusor so all bounding boxes are in the same row
				if (bounds.height != cursorPos) 
					cursorPos += bounds.height
				end

			end

			move_cursor_to(cursorPos)

			# question
			bounding_box([xPosOfShortQuestion, cursorPos], :width => widthOfShortQuestion) do

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

				text "This is an answer to a basic question"
				#stroke_bounds

				#move cursor down for next question
				cursorPos -= bounds.height
			end

			move_cursor_to(cursorPos)

			#stroke_bounds

		end

		# checkbox question
		bounding_box([0, cursor], :width => 550) do

			cursorPos = cursor

			# question number
			bounding_box([xPosOfQuestionNumber,0], :width => widthOfQuestionNumber) do

				text "1"
				#stroke_bounds

				# move cusor so all bounding boxes are in the same row
				cursorPos += bounds.height
			end

			move_cursor_to(cursorPos)

			# question
			bounding_box([xPosOfShortQuestion, cursorPos], :width => widthOfShortQuestion) do

				text "This is a checkbox question"
				#stroke_bounds

			end

			# checkbox 1
			bounding_box([xPosOfCheckbox, cursorPos], :width => widthOfCheckbox) do

				text "@"
				#stroke_bounds

			end

			# answer 1
			bounding_box([xPosOfShortAnswer, cursorPos], :width => widthOfShortAnswer) do

				text "This is an answer to a checkbox question"
				#stroke_bounds

				# move cursor down for next checkbox
				cursorPos -= bounds.height

			end

			move_cursor_to(cursorPos)

			# checkbox 2
			bounding_box([xPosOfCheckbox, cursorPos], :width => widthOfCheckbox) do

				text "@"
				#stroke_bounds

				# move cursor so bounding boxes will be in same row
				cursorPos += bounds.height
			end

			move_cursor_to(cursorPos)

			# answer 2
			bounding_box([xPosOfShortAnswer, cursorPos], :width => widthOfShortAnswer) do

				text "This is an answer to another checkbox question"
				#stroke_bounds

				# move cursor down for next checkbox
				cursorPos -= bounds.height
			end

			# checkbox 3
			bounding_box([xPosOfCheckbox, cursorPos], :width => widthOfCheckbox) do

				text "@"
				#stroke_bounds

				# move cursor so bounding boxes will be in same row
				cursorPos += bounds.height
			end

			move_cursor_to(cursorPos)

			# answer 3
			bounding_box([xPosOfShortAnswer, cursorPos], :width => widthOfShortAnswer) do

				text "This is an answer to another checkbox question"
				#stroke_bounds
			end

			#stroke_bounds

		end

		# descriptive question
		bounding_box([0,cursor], :width => widthOfQuestionNumber) do

			cursorPos = cursor

			# question number
			bounding_box([0,cursor], :width => widthOfQuestionNumber) do

				text "3"
				#stroke_bounds

				cursorPos += bounds.height

			end

			move_cursor_to(cursorPos)

			# question description
			bounding_box([xPosOfLongQandA, cursor], :width => widthOfLongQandA) do

				text "This is a long descriptive question. It will usually ask the user to desribe something he or she observed. This question will also include topics to touch on while answering the question"
				#stroke_bounds

			end

			# question answer
			bounding_box([xPosOfLongQandA,cursor], :width => widthOfLongQandA) do

				text "This is a long descriptive question. We would guess that these answers are up to 250 words in the length. These answers go into great detail about the observations noted by the man or woman. We need to be prepared for formatting issuses as these answers will definitely span more than one row"
				#stroke_bounds

			end

			#stroke_bounds

		end

			stroke_bounds

	end

end


# ISSUES:
# 1) When any single entry spans more than one row, the formatting goes crazy









