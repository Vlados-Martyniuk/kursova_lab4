CC = g++
CFLAGS = -Wall -Wextra -std=c++17
LDFLAGS =

SRCDIR = src
OBJDIR = build
TARGET = calculator_app

LIBRARY = libcalculator.a

SOURCES = $(SRCDIR)/main.cpp $(SRCDIR)/calculator.cpp
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o)


$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	if not exist $(OBJDIR) mkdir $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@


all: $(TARGET)

$(LIBRARY): $(OBJDIR)/calculator.o
	ar rcs $(LIBRARY) $^

$(TARGET): $(OBJECTS) $(LIBRARY)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJECTS) $(LDFLAGS) -L. -lcalculator


clean:
	if exist $(OBJDIR) rmdir /s /q $(OBJDIR)
	del /f /q $(TARGET) $(LIBRARY)

.PHONY: all clean
