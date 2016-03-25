require 'prawn'

# generate pdf using bounding box

Prawn::Document::generate("generatedPracticeReport.pdf") do 

	stroke_axis

	widthOfQuestionNumber = 25
	widthOfShortQuestion = 140
	widthOfCheckbox = 25
	widthOfShortAnswer = 310

	xPosOfQuestionNumber = 0
	xPosOfShortQuestion = 25
	xPosOfCheckbox = 165
	xPosOfShortAnswer = 190

	# would we potentially make all these bounding boxes separate functions and call as the data is passed in?

	bounding_box([0, cursor], :width => 550) do

		# page heading
		bounding_box([0, cursor], :width => 550, :height => 50) do

			#stroke_color 'FFFFFF'
		    #    stroke_bounds
		    #    stroke do
	        #    stroke_color 'FFFF00'
	        #    fill_color "30abdf"
	        #    fill_and_stroke_rectangle [0,cursor], 550, 100
	        #    fill_color '000000'
        	#end

			move_down 10
			indent(10) do
				font_size(25) { text "Question Title" }
			end

			#fill_color "30abdf"
			stroke_bounds

		end

		# extra question info
		bounding_box([0,cursor], :width => 550) do

			text "Here is some basic information about this section."

			stroke_bounds

		end

		# basic question
		bounding_box([0,cursor], :width => 550) do

			cursorPos = cursor

			# question number
			bounding_box([xPosOfQuestionNumber,0], :width => widthOfQuestionNumber) do

					text "Q1"
					stroke_bounds

					# move cusor so all bounding boxes are in the same row
					cursorPos += bounds.height
			end

			move_cursor_to(cursorPos)

			# question
			bounding_box([xPosOfShortQuestion, cursorPos], :width => widthOfShortQuestion) do

					text "This is a question"
					stroke_bounds

			end

			move_cursor_to(cursorPos)

			# checkbox
			bounding_box([xPosOfCheckbox, cursorPos], :width => widthOfCheckbox) do

					text "@"
					stroke_bounds

			end

			move_cursor_to(cursorPos)

			# answer
			bounding_box([xPosOfShortAnswer, cursorPos], :width => widthOfShortAnswer) do

					text "This is an answer to a question"
					stroke_bounds
			end

			stroke_bounds

		end

		stroke_bounds
	end
end











