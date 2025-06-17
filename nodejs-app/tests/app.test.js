const request = require('supertest');
const app = require('../src/app');

describe('GET /health', () => {
  it('should return status UP', async () => {
    const res = await request(app).get('/health');
    expect(res.statusCode).toBe(200);
    expect(res.body).toHaveProperty('status', 'UP');
  });
});

describe('GET /hello', () => {
  it('should return welcome message', async () => {
    const res = await request(app).get('/hello');
    expect(res.statusCode).toBe(200);
    expect(res.body).toHaveProperty('message', 'Hello, DevOps World!');
  });
});
