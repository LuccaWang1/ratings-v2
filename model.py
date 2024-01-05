"""Models for movie ratings app."""

from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import Column, Integer
from server import app
from datetime import datetime

db = SQLAlchemy()

class User(db.Model):
    """A user."""

    __tablename__ = "users"

    user_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    email = db.Column(db.String, unique=True, nullable=False)
    password = db.Column(db.String, nullable=False)

    rating = db.relationship("Rating", back_populates="user") 

    def __repr__(self):
        return f'<User user_id={self.user_id} email={self.email}>'

class Movie(db.Model):
    """movies"""

    __tablename__ = "movies"
    
    movie_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    title = db.Column(db.String)
    overview = db.Column(db.Text)
    release_date = db.Column(db.DateTime)
    poster_path = db.Column(db.String)

    rating = db.relationship("Rating", back_populates="movie")

    def __repr__(self):
        return f'<Movie Table✨ movie_id={self.movie_id} title={self.title}>'

class Rating(db.Model):
    """a movie rating"""
    
    __tablename__ = "ratings"

    rating_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    score = db.Column(db.Integer)
    movie_id = db.Column(db.Integer, db.ForeignKey("movies.movie_id"))
    user_id = db.Column(db.Integer, db.ForeignKey("users.user_id"))
    comment = db.Column(db.String, nullable=False)

    movie = db.relationship("Movie", back_populates="rating")
    user = db.relationship("User", back_populates="rating")

    def __repr__(self):
        return f'<Rating rating_id={self.rating_id} score={self.score}>'


def connect_to_db(flask_app, db_uri="postgresql:///ratings", echo=True):
    flask_app.config["SQLALCHEMY_DATABASE_URI"] = db_uri
    flask_app.config["SQLALCHEMY_ECHO"] = echo
    flask_app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

    db.app = flask_app
    db.init_app(flask_app)

    print("Connected to the db!")


if __name__ == "__main__":
    from server import app

    # Call connect_to_db(app, echo=False) if your program output gets
    # too annoying; this will tell SQLAlchemy not to print out every
    # query it executes.

    connect_to_db(app, "postgresql:///ratings")
