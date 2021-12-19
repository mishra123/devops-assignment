import logging
import os


logging.basicConfig(level=logging.INFO)

STARTING_SEQUENCE = os.environ["STARTING_NUM_SEQ"]
ENDING_SEQUENCE = os.environ["ENDING_NUM_SEQ"]


class PrintNumberSequences():

    def __init__(self, start, end):
        self.start_range = int(start)
        self.end_range = int(end)
        self.business_logic()

    def business_logic(self):
        try:
            for i in range(self.start_range, self.end_range):
                if self.multiple_of_both(i) == True:
                    logging.info('FizzBuzz')


                elif self.multiple_of_five(i) == True:
                    logging.info('Buzz')

                elif self.multiple_of_three(i) == True:
                    logging.info('Fizz')

                else:
                    logging.info(i)



        except Exception as e:
            logging.exception(e)


    def multiple_of_three(self, num):
        if num % 3 == 0:
            return True
        else:
            return False

    def multiple_of_five(self, num):
        if num % 5 == 0:
            return True
        else:
            return False

    def multiple_of_both(self, num):
        if num % 3 == 0 and num % 5 == 0:
            return True
        else:
            return False


printNumberSequences = PrintNumberSequences(STARTING_SEQUENCE,ENDING_SEQUENCE)
