# Diary API

- [Routes Overview](#routes-overview)
- [Routes Specification](#routes-specification)
  - [Diaries](#diary-routes)
  - [Notes](#note-routes)
- [Running The App](#running-the-app)

## Routes Overview

### Diaries

|  Verb  | Path             | Description         |
| :----: | :--------------- | ------------------- |
|  GET   | /api/diaries     | get all diaries     |
|  POST  | /api/diaries     | create new diary    |
|  GET   | /api/diaries/:id | view single diary   |
| PATCH  | /api/diaries/:id | modify single diary |
|  PUT   | /api/diaries/:id | modify single diary |
| DELETE | /api/diaries/:id | delete single diary |

### Notes

|  Verb  | Path                         | Description                                   |
| :----: | :--------------------------- | --------------------------------------------- |
|  GET   | /api/diaries/:diary_id/notes | get all notes belonging to the a single diary |
|  POST  | /api/diaries/:diary_id/notes | create new note belonging to a single diary   |
| PATCH  | /api/notes/:id               | modify single note                            |
|  PUT   | /api/notes/:id               | modify single note                            |
| DELETE | /api/notes/:id               | delete single note                            |

## Routes specification

## Diary Routes

### Request

`GET /api/diaries`

### Response

```json
[
  {
    "id": 1,
    "title": "public diary N.1",
    "expiration": null,
    "created_at": "2021-07-01T14:51:48.505Z",
    "updated_at": "2021-07-01T14:51:48.505Z",
    "kind": "public"
  }
]
```

---

### Request

`POST /api/diaries`

### Format

`title: string` (required)

`kind: public|private` (required)

`expiration: datetime` (only availalbe with kind set to private)

_Note_: You have to nest your attributes under a diary key

```json
{
  "diary": {
    "title": "title",
    "kind": "public"
  }
}
```

### Response

If diary was sucesfully created

`STATUS: 201`

```json
{
  "id": 5,
  "title": "title",
  "expiration": null,
  "created_at": "2021-07-01T15:24:11.627Z",
  "updated_at": "2021-07-01T15:24:11.627Z",
  "kind": "public"
}
```

If diary was not sucesfully created

`STATUS: 422`

```json
[
  "Title can't be blank"
]
```

---

### Request

`GET /api/diaries/:id`

### Response

```json
{
  "id": 1,
  "title": "public diary N.1",
  "expiration": null,
  "created_at": "2021-07-01T14:51:48.505Z",
  "updated_at": "2021-07-01T14:51:48.505Z",
  "kind": "public"
}
```

---

### Request

`PUT /api/diaries/:id`

### Format

One or more attrubutes to modify

```json
{
  "diary": {
    "title": "new title"
  }
}
```

### Reponse

Newly updated diary

`STATUS: 201`

```json
{
  "title": "title json",
  "id": 6,
  "expiration": null,
  "created_at": "2021-07-01T15:31:36.213Z",
  "updated_at": "2021-07-01T15:31:36.213Z",
  "kind": "public"
}
```

---

### Request

`PATCH /api/diaries/:id`

Same as PUT

---

### Request

`DELETE /api/diaries/:id`

### Response

`STATUS: 204`

---

## Note Routes

### Request

`GET /api/diaries/:diary_id/notes`

### Response

```json
[
    {
        "id": 1,
        "text": "text of the note N.1 for diary N.1",
        "diary_id": 1,
        "created_at": "2021-07-01T14:51:48.566Z",
        "updated_at": "2021-07-01T14:51:48.566Z"
    },
    {
        "id": 2,
        "text": "text of the note N.2 for diary N.1",
        "diary_id": 1,
        "created_at": "2021-07-01T14:51:48.580Z",
        "updated_at": "2021-07-01T14:51:48.580Z"
    }
```

---

### Request

`POST /api/diaries/:diary_id/notes`

### Format

`text: string` (required)

_Note_: You have to nest your attributes under a note key

```json
{
  "note": {
    "text": "text of a note"
  }
}
```

### Response

If note was sucesfully created

`STATUS: 201`

```json
{
  "id": 13,
  "text": "text of a note",
  "diary_id": 1,
  "created_at": "2021-07-01T15:54:53.728Z",
  "updated_at": "2021-07-01T15:54:53.728Z"
}
```

If note was not sucesfully created

`STATUS: 422`

```json
[
  "Text can't be blank"
]
```

---

### Request

`PUT /api/notes/:id`

### Format

One or more attrubutes to modify

```json
{
  "note": {
    "text": "new text"
  }
}
```

### Reponse

Newly updated note

`STATUS: 201`

```json
{
  "text": "new text",
  "id": 13,
  "diary_id": 1,
  "created_at": "2021-07-01T15:54:53.728Z",
  "updated_at": "2021-07-01T15:57:22.121Z"
}
```

---

### Request

`PATCH /api/notes/:id`

Same as PUT

---

### Request

`DELETE /api/notes/:id`

### Response

`STATUS: 204`

---

### Running The App

```bash
git clone https://github.com/samarink/diaries-api
cd diaries api
docker-compose up

```
