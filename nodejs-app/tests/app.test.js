const request = require('supertest');
const { app, server } = require('../src/app'); // Adjust path if needed

describe('API Tests', () => {
  afterAll((done) => {
    server.close(done); // Clean up after tests
  });

  test('GET /health should return status UP', async () => {
    const res = await request(app).get('/health');
    expect(res.statusCode).toBe(200);
    expect(res.body.status).toBe('UP');
  });

  test('GET /hello should return welcome message', async () => {
    const res = await request(app).get('/hello');
    expect(res.statusCode).toBe(200);
    expect(res.body.message).toContain('Welcome');
  });
});
