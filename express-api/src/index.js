const express = require('express');

const DEFAULT_PORT = 3000;

// Instantiate the server.
const app = express();
app.use(express.json());
const defaultRouter = express.Router();

// Single health endpoint that retuns a json body.
defaultRouter.get('/health', async (req, res) => {
    res.status(200).json({
        'status': 'green'
    });
});

app.use('/', defaultRouter);

console.info(`Listening on ${DEFAULT_PORT}`);
app.listen(DEFAULT_PORT);
