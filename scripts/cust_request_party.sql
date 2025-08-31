--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cust_request_party; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE cust_request_party (
    cust_request_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.cust_request_party OWNER TO ofbiz;

--
-- Name: cust_request_party pk_cust_request_party; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_party
    ADD CONSTRAINT pk_cust_request_party PRIMARY KEY (cust_request_id, party_id, role_type_id, from_date);


--
-- Name: creq_rl_crqst; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX creq_rl_crqst ON cust_request_party USING btree (cust_request_id);


--
-- Name: creq_rl_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX creq_rl_party ON cust_request_party USING btree (party_id);


--
-- Name: creq_rl_prole; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX creq_rl_prole ON cust_request_party USING btree (party_id, role_type_id);


--
-- Name: cst_rqt_prt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_rqt_prt_txcrts ON cust_request_party USING btree (created_tx_stamp);


--
-- Name: cst_rqt_prt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_rqt_prt_txstmp ON cust_request_party USING btree (last_updated_tx_stamp);


--
-- Name: cust_request_party creq_rl_crqst; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_party
    ADD CONSTRAINT creq_rl_crqst FOREIGN KEY (cust_request_id) REFERENCES cust_request(cust_request_id);


--
-- Name: cust_request_party creq_rl_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_party
    ADD CONSTRAINT creq_rl_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: cust_request_party creq_rl_prole; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_party
    ADD CONSTRAINT creq_rl_prole FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- PostgreSQL database dump complete
--

